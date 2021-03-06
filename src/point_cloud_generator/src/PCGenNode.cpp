#include "PCGenNode.h"

using namespace pcl;

PCGenNode::PCGenNode()
: cloudSub(nh.subscribe("/points2", 1, &PCGenNode::cloudCallback, this))
, captureService(nh.advertiseService("capture_cloud", &PCGenNode::captureCloud, this))
, mostRecentCloud(new pcl::PointCloud<pcl::PointXYZ>)
, transformPub(nh.advertise<geometry_msgs::TransformStamped>("/modelTransform",1,this))
{

    cloudProcessed = false;
    handeye_transform << -0.0342177 , -0.0224303, 0.999141, 0.0357424, -0.998979 , -0.0285611  , -0.034854 , -0.0232153, 0.0293307  , -0.999324 , -0.0214294  , 0.0547717, 0, 0, 0, 1;
    
}

//Receive most recent cloud and convert it to PCL message (this is apparently slow, perhaps we can do another way)
void PCGenNode::cloudCallback(const pcl::PointCloud<pcl::PointXYZ>::ConstPtr& msg)
{
    //pcl::fromROSMsg (*cloud_msg, *mostRecentCloud);
    //std::cout<<"cloud captured"<<std::endl;
    *mostRecentCloud = *msg;
}

/*When false is received: 
filter point cloud to remove NaN values
add filtered cloud to list
convert tf::StampedTransform to a 4x4 Eigen Matrix4f
add transform to list

when true:
process point clouds
*/
bool PCGenNode::captureCloud(messages::ImageCapture::Request& req, messages::ImageCapture::Response& res)
{
    if (req.x == false)
    {
        ROS_INFO("capturing point cloud [%ld]", (int) cloudList.size()+1);
        tf::StampedTransform base2gripper;
        listener.lookupTransform("panda_EE", "panda_link0", ros::Time(0), base2gripper);
        
        if (mostRecentCloud->size() > 0){
            MyCloud newCloud(mostRecentCloud, base2gripper);
            cloudList.push_back(newCloud);
        }
        else 
        {
            ROS_INFO("cloud has size 0...");
        }
    }
    else if (req.x == true && cloudProcessed == false)
    {
        ROS_INFO("Processing and stitching cloud...");
        cloudProcessed = true;
        //update directory locations
        pcl::PointCloud<pcl::PointXYZ>::Ptr model_skeleton(new PointCloud<pcl::PointXYZ>);
        pcl::io::loadPCDFile<pcl::PointXYZ>("/home/rnm/Desktop/Skeleton_Target.pcd", *model_skeleton);
        
        stitchClouds();

        scaleCloud(model_skeleton);

        //registerModel(scanResults,model_skeleton);
        globalRegistration(scanResults, model_skeleton);
    }
    res.y = true;
}

//Loop through all point clouds, and find correspondences between them. Output should be the 'Full' point cloud merged from all of the views.
void PCGenNode::stitchClouds()
{
    ROS_INFO("stitching point clouds...");

    pcl::PointCloud<pcl::PointXYZ>::Ptr source(new PointCloud<pcl::PointXYZ>), target(new PointCloud<pcl::PointXYZ>);

    //first target is the first point in the cloud. Transform to base frame
    //pcl::transformPointCloud(*cloudList[0], *target, cloudTransforms[0]);

    processCloud(cloudList[0], target);
    pcl::io::savePCDFile ("/home/rnm/Desktop/scan0.pcd", *target);

    std::cout<<"size: "<<target->size()<<std::endl;

    for (int i = 1; i < cloudList.size(); i++)
    {
        ROS_INFO("Processing scan and transforming it to base frame...");
        processCloud(cloudList[i], source);

        ROS_INFO("Matching scan...");
        Eigen::Matrix4f pairTransform;
        pcl::io::savePCDFile ("/home/rnm/Desktop/scan" + std::to_string(i) + ".pcd", *source);
        pcl::PointCloud<pcl::PointXYZ>::Ptr temp (new PointCloud<pcl::PointXYZ>);
        
        pairAlign(source,target,temp, pairTransform);

        *target = *temp;
    }

    *scanResults = *target;
    ROS_INFO("saving this scan..");
    pcl::io::savePCDFile ("/home/rnm/Desktop/dense_scan.pcd", *target);
}

void PCGenNode::processCloud(MyCloud inputCloud, pcl::PointCloud<pcl::PointXYZ>::Ptr outputCloud)
{
        pcl::PointCloud<pcl::PointXYZ> raw_cloud = inputCloud.cloud;
        tf::StampedTransform raw_tf = inputCloud.transform;
        
        pcl::PointCloud<pcl::PointXYZ>::Ptr filter_NaN(new PointCloud<pcl::PointXYZ>);
        pcl::PointCloud<pcl::PointXYZ>::Ptr filteredCloud(new PointCloud<pcl::PointXYZ>);
        pcl::PointCloud<pcl::PointXYZ>::Ptr finalCloud(new PointCloud<pcl::PointXYZ>);
        ROS_INFO("Filtering bad points out...");
        std::vector< int > indices;
        //here we can use most recent cloud as output probably, to avoid creating a new variable
        pcl::removeNaNFromPointCloud(raw_cloud, *filter_NaN, indices);
       // std::cout<<"size: "<<filter_NaN->size()<<std::endl;

        //Outler removal (lonely points that are spread here and there in the cloud, like annoying mosquitoes
        //There are pthe product of sensors inaccuracy (noise) which registers measrements where there should be any.
        //Filter object (RadiusBased)

        /*
        pcl::PointCloud<pcl::PointXYZ>::Ptr filtered_outlier(new pcl::PointCloud<pcl::PointXYZ>);
        RadiusOutlierRemoval<pcl::PointXYZ> filter_outlier;
        filter_outlier.setInputCloud(filter_NaN);
        //Every point must have 10 neighbors within 15cm, or it will be removed
        filter_outlier.setRadiusSearch(0.15);
        filter_outlier.setMinNeighborsInRadius(10);
        filter_outlier.filter(*filtered_outlier);
        std::cout<<"size: "<<filtered_outlier->size()<<std::endl;
        */

        /*
        pcl::PassThrough<pcl::PointXYZ> passfilter;
        passfilter.setInputCloud(filtered_outlier);
        // Filter out all points with Z values not in the [0-2] range.
        passfilter.setFilterFieldName("z");
        passfilter.setFilterLimits(0.0, 1.2);
        passfilter.filter(*filteredCloud);
        std::cout<<"size: "<<filteredCloud->size()<<std::endl;
        */
        //Resampling -Downsampling
        pcl::PointCloud<pcl::PointXYZ>::Ptr downsampleCloud(new pcl::PointCloud<pcl::PointXYZ>);
        pcl::VoxelGrid<pcl::PointXYZ> filter_voxel;
        filter_voxel.setInputCloud(filter_NaN);
        // We set the size of every voxel to be 1x1x1cm
        // (only one point per every cubic centimeter will survive).
        filter_voxel.setLeafSize(0.01f,0.01f,0.01f);
        filter_voxel.filter(*downsampleCloud);

        Eigen::Matrix4f convertedTransform;
        formatTransform(raw_tf, convertedTransform);
        ROS_INFO("transform formatted");

        pcl::transformPointCloud(*downsampleCloud, *finalCloud, convertedTransform);
        //std::cout<<"final size: "<<finalCloud->size()<<std::endl;

        *outputCloud = *finalCloud;
}

//Take two point clouds, and find the transformation between them. Output is the merged point cloud. 
void PCGenNode::pairAlign(const pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_src, const pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_tgt, pcl::PointCloud<pcl::PointXYZ>::Ptr output, Eigen::Matrix4f &final_transform)
{
    pcl::PointCloud<pcl::PointXYZ> cloud_source_registered;
    IterativeClosestPoint<PointXYZ, PointXYZ> icp;

    icp.setInputCloud(cloud_src);
    icp.setInputTarget(cloud_tgt);

     // Set the max correspondence distance to 5cm (e.g., correspondences with higher distances will be ignored)
    icp.setMaxCorrespondenceDistance (0.05);
    std::cout<<"setting criteria 2"<<std::endl;
    // Set the maximum number of iterations (criterion 1) 50
    icp.setMaximumIterations (50);
    // Set the transformation epsilon (criterion 2)
    icp.setTransformationEpsilon (1e-8);
    // Set the euclidean distance difference epsilon (criterion 3)
    icp.setEuclideanFitnessEpsilon (1);
    // Perform the alignment
    icp.align (cloud_source_registered);

    std::cout << "has converged:" << icp.hasConverged() << " score: " <<
              icp.getFitnessScore() << std::endl;
    std::cout << icp.getFinalTransformation() << std::endl;

    final_transform = icp.getFinalTransformation();

    *output = cloud_source_registered + *cloud_tgt;
}

//Converts a Tf::StampedTransform to an Eigen::Matrix4f
void PCGenNode::formatTransform(tf::StampedTransform tfTransform, Eigen::Matrix4f &eigenTransform)
{
    tf::Matrix3x3 rotTF;
    tf::Vector3 transTF;
    //Eigen::Matrix3d R;
    //Eigen::Vector3d T;
    rotTF = tfTransform.getBasis();
    transTF = tfTransform.getOrigin();
    ROS_INFO_STREAM(" tfTransform: " << tfTransform.getOrigin().x() << ", " << tfTransform.getOrigin().y() << ", " <<tfTransform.getOrigin().z() << ", "
                                              << tfTransform.getRotation().x() << ", " << tfTransform.getRotation().y() << ", " << tfTransform.getRotation().z());

    //tf::matrixTFToEigen(rotTF, R);
    //tf::vectorTFToEigen(transTF,T);

    Eigen::Matrix4d Trans;
    Trans.setIdentity();
    for(int i=0; i<3; i++)
    {
      for(int j=0; j<3; j++)
      {
        Trans(i,j) = rotTF[i][j];
      }
    }
    for(int i=0; i<3; i++)
    {
        Trans(i,3) = transTF[i];
    }
    //Trans.block<3,3>(0,0) = R;
    //Trans.block<3,1>(0,3) = T;
    std::cout<<Trans<<std::endl;
    Eigen::Matrix4d total_transform;
    total_transform = Trans*handeye_transform;
    eigenTransform = total_transform.cast<float> ();

    /*

    Eigen::Matrix3d R;

    geometry_msgs::Transform trans = tfTransform.transform;

    Eigen::Quaterniond rotquat (trans.rotation.w, trans.rotation.x, trans.rotation.y, trans.rotation.z);
    Eigen::Vector3d   T(trans.translation.x, trans.translation.y, trans.translation.z);

    R = rotquat.toRotationMatrix();


    Eigen::Matrix4d Trans;
    Trans.setIdentity();
    Trans.block<3,3>(0,0) = R;
    Trans.block<3,1>(0,3) = T;
    std::cout<<Trans<<std::endl;

    eigenTransform = Trans.cast<float> ();
    */
}

void PCGenNode::scaleCloud(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud, float scalingFactor)
{
    pcl::PointCloud<pcl::PointXYZ> temp;
    temp = *cloud;
    for(int i = 0; i < temp.size(); i++)
    {
        temp.points[i].x = temp.points[i].x * scalingFactor;
        temp.points[i].y = temp.points[i].y * scalingFactor;
        temp.points[i].z = temp.points[i].z * scalingFactor;
    }
    *cloud = temp;
}

void PCGenNode::localRegistration(pcl::PointCloud<pcl::PointXYZ>::Ptr model ,pcl::PointCloud<pcl::PointXYZ>::Ptr scene)
    {
        //pcl::PointCloud<pcl::PointXYZ>::Ptr model (new pcl::PointCloud<pcl::PointXYZ> ());
        pcl::PointCloud<pcl::PointXYZ>::Ptr model_keypoints (new pcl::PointCloud<pcl::PointXYZ> ());
        //pcl::PointCloud<pcl::PointXYZ>::Ptr scene (new pcl::PointCloud<pcl::PointXYZ> ());
        pcl::PointCloud<pcl::PointXYZ>::Ptr scene_keypoints (new pcl::PointCloud<pcl::PointXYZ> ());
        pcl::PointCloud<pcl::Normal>::Ptr model_normals (new pcl::PointCloud<pcl::Normal> ());
        pcl::PointCloud<pcl::Normal>::Ptr scene_normals (new pcl::PointCloud<pcl::Normal> ());
        pcl::PointCloud<pcl::SHOT352>::Ptr model_descriptors (new pcl::PointCloud<pcl::SHOT352> ());
        pcl::PointCloud<pcl::SHOT352>::Ptr scene_descriptors (new pcl::PointCloud<pcl::SHOT352> ());

        /**
         * Load Clouds
         */
        //if (pcl::io::loadPCDFile (model_filename_, *model) < 0)
        //{
        //   std::cout << "Error loading model cloud." << std::endl;
        //    showHelp (argv[0]);
        //    return (-1);
        //}
        /**
         * Compute Normals
         */
        pcl::NormalEstimationOMP<pcl::PointXYZ, pcl::Normal> norm_est;
        norm_est.setKSearch (10);
        norm_est.setInputCloud (model);
        norm_est.compute (*model_normals);

        norm_est.setInputCloud (scene);
        norm_est.compute (*scene_normals);

        /**
         *  Downsample Clouds to Extract keypoints
         */
        pcl::UniformSampling<pcl::PointXYZ> uniform_sampling;
        uniform_sampling.setInputCloud (model);
        uniform_sampling.setRadiusSearch (0.02f);
        uniform_sampling.filter (*model_keypoints);
        std::cout << "Model total points: " << model->size () << "; Selected Keypoints: " << model_keypoints->size () << std::endl;

        uniform_sampling.setInputCloud (scene);
        uniform_sampling.setRadiusSearch (0.02f);
        uniform_sampling.filter (*scene_keypoints);
        std::cout << "Scene total points: " << scene->size () << "; Selected Keypoints: " << scene_keypoints->size () << std::endl;

        /**
         *  Compute Descriptor for keypoints
         */
        pcl::SHOTEstimationOMP<pcl::PointXYZ, pcl::Normal, pcl::SHOT352> descr_est;
        descr_est.setRadiusSearch (0.02f);

        descr_est.setInputCloud (model_keypoints);
        descr_est.setInputNormals (model_normals);
        descr_est.setSearchSurface (model);
        descr_est.compute (*model_descriptors);

        descr_est.setInputCloud (scene_keypoints);
        descr_est.setInputNormals (scene_normals);
        descr_est.setSearchSurface (scene);
        descr_est.compute (*scene_descriptors);

        /**
         *  Find Model-Scene Correspondences with KdTree
         */
        pcl::CorrespondencesPtr model_scene_corrs (new pcl::Correspondences ());
        pcl::KdTreeFLANN<pcl::SHOT352> match_search;
        match_search.setInputCloud (model_descriptors);
        std::vector<int> model_good_keypoints_indices;
        std::vector<int> scene_good_keypoints_indices;

        for (std::size_t i = 0; i < scene_descriptors->size (); ++i)
        {
            std::vector<int> neigh_indices (1);
            std::vector<float> neigh_sqr_dists (1);
            if (!std::isfinite (scene_descriptors->at (i).descriptor[0]))  //skipping NaNs
            {
                continue;
            }
            int found_neighs = match_search.nearestKSearch (scene_descriptors->at (i), 1, neigh_indices, neigh_sqr_dists);
            if (found_neighs == 1 && neigh_sqr_dists[0] < 0.25f)
            {
                pcl::Correspondence corr (neigh_indices[0], static_cast<int> (i), neigh_sqr_dists[0]);
                model_scene_corrs->push_back (corr);
                model_good_keypoints_indices.push_back (corr.index_query);
                scene_good_keypoints_indices.push_back (corr.index_match);
            }
        }
        pcl::PointCloud<pcl::PointXYZ>::Ptr model_good_kp (new pcl::PointCloud<pcl::PointXYZ> ());
        pcl::PointCloud<pcl::PointXYZ>::Ptr scene_good_kp (new pcl::PointCloud<pcl::PointXYZ> ());
        pcl::copyPointCloud (*model_keypoints, model_good_keypoints_indices, *model_good_kp);
        pcl::copyPointCloud (*scene_keypoints, scene_good_keypoints_indices, *scene_good_kp);

        std::cout << "Correspondences found: " << model_scene_corrs->size () << std::endl;

        /**
         *  Clustering
         */
        std::vector<Eigen::Matrix4f, Eigen::aligned_allocator<Eigen::Matrix4f> > rototranslations;
        std::vector < pcl::Correspondences > clustered_corrs;

        pcl::GeometricConsistencyGrouping<pcl::PointXYZ, pcl::PointXYZ> gc_clusterer;
        gc_clusterer.setGCSize (0.01f);
        gc_clusterer.setGCThreshold (5.0f);

        gc_clusterer.setInputCloud (model_keypoints);
        gc_clusterer.setSceneCloud (scene_keypoints);
        gc_clusterer.setModelSceneCorrespondences (model_scene_corrs);

        gc_clusterer.recognize (rototranslations, clustered_corrs);
        // }

        /**
         * Stop if no instances
         */
        if (rototranslations.size () <= 0)
        {
            std::cout << "*** No instances found! ***" << std::endl;
            return ;
        }
        else
        {
            std::cout << "Recognized Instances: " << rototranslations.size () << std::endl << std::endl;
        }

        /**
         * Generates clouds for each instances found
         */
        std::vector<pcl::PointCloud<pcl::PointXYZ>::ConstPtr> instances;

        for (std::size_t i = 0; i < rototranslations.size (); ++i)
        {
            pcl::PointCloud<pcl::PointXYZ>::Ptr rotated_model (new pcl::PointCloud<pcl::PointXYZ> ());
            pcl::transformPointCloud (*model, *rotated_model, rototranslations[i]);
            instances.push_back (rotated_model);
        }

        /**
         * ICP
         */
        std::vector<pcl::PointCloud<pcl::PointXYZ>::ConstPtr> registered_instances;
        if (true)
        {
            std::cout << "--- ICP ---------" << std::endl;

            for (std::size_t i = 0; i < rototranslations.size (); ++i)
            {
                pcl::IterativeClosestPoint<pcl::PointXYZ, pcl::PointXYZ> icp;
                icp.setMaximumIterations (5);
                icp.setMaxCorrespondenceDistance (0.005f);
                icp.setInputTarget (scene);
                icp.setInputSource (instances[i]);
                pcl::PointCloud<pcl::PointXYZ>::Ptr registered (new pcl::PointCloud<pcl::PointXYZ>);
                icp.align (*registered);
                registered_instances.push_back (registered);
                std::cout << "Instance " << i << " ";
                if (icp.hasConverged ())
                {
                    std::cout << "Aligned!" << std::endl;
                }
                else
                {
                    std::cout << "Not Aligned!" << std::endl;
                }
            }

            std::cout << "-----------------" << std::endl << std::endl;
        }

        /**
         * Hypothesis Verification
         */
        std::cout << "--- Hypotheses Verification ---" << std::endl;
        std::vector<bool> hypotheses_mask;  // Mask Vector to identify positive hypotheses

        pcl::GlobalHypothesesVerification<pcl::PointXYZ, pcl::PointXYZ> GoHv;

        GoHv.setSceneCloud (scene);  // Scene Cloud
        GoHv.addModels (registered_instances, true);  //Models to verify
        GoHv.setResolution (0.005f);
        //GoHv.setResolutionOccupancyGrid (5.0f);
        GoHv.setInlierThreshold (0.005f);
        GoHv.setOcclusionThreshold (0.01f);
        GoHv.setRegularizer (3.0f);
        GoHv.setRadiusClutter (0.03f);
        GoHv.setClutterRegularizer (5.0f);
        GoHv.setDetectClutter (true);
        GoHv.setRadiusNormals (0.05);

        GoHv.verify ();
        GoHv.getMask (hypotheses_mask);  // i-element TRUE if hvModels[i] verifies hypotheses

        for (int i = 0; i < hypotheses_mask.size (); i++)
        {
            if (hypotheses_mask[i])
            {
                std::cout << "Instance " << i << " is GOOD! <---" << std::endl;
            }
            else
            {
                std::cout << "Instance " << i << " is bad!" << std::endl;
            }
        }
        std::cout << "-------------------------------" << std::endl;
    }

    void PCGenNode::broadcastTransform()
    {
        if(modelRegistered)
        {
            Eigen::Matrix3f mat(3,3);
            for(int i=0;i<3;i++)
            {
                for(int j=0;j<3;j++)
                {
                    mat(i,j) = modelTransform(i,j);
                }
            }
            Eigen::Quaternionf q;
            q = mat;
            geometry_msgs::TransformStamped trans;

            trans.transform.translation.x = modelTransform(3,0);
            trans.transform.translation.y = modelTransform(3,1);
            trans.transform.translation.z = modelTransform(3,2);

            trans.transform.rotation.x = q.x();
            trans.transform.rotation.y = q.y();
            trans.transform.rotation.z = q.z();
            trans.transform.rotation.w = q.w();

            tf2_msgs::TFMessage mesg;
            mesg.transforms.push_back(trans);
            transformPub.publish(mesg);
        }
        
    }
//____________________________________________________________________________________________________________________________//
//____________________________________________________________________________________________________________________________//

void PCGenNode::globalRegistration(pcl::PointCloud<pcl::PointXYZ>::Ptr scene ,pcl::PointCloud<pcl::PointXYZ>::Ptr model)
{
    pcl::PointCloud<pcl::VFHSignature308>::Ptr sceneDescriptors(new pcl::PointCloud<pcl::VFHSignature308>);
    pcl::PointCloud<pcl::VFHSignature308>::Ptr modelDescriptors(new pcl::PointCloud<pcl::VFHSignature308>);

    /// Compute Descriptors based on Segmentation  (ps: NOT based on Keypoints) that is the main different between localRegistration
    computeDescriptors(scene,sceneDescriptors);
    computeDescriptors(model,modelDescriptors);

    // A kd-tree object that uses the FLANN library for fast search of nearest neighbors.
    pcl::KdTreeFLANN<pcl::VFHSignature308> matching;
    matching.setInputCloud(modelDescriptors);
    // A Correspondence object stores the indices of the query and the match, and the distance/weight.
    pcl::CorrespondencesPtr correspondences(new pcl::Correspondences());

    for(size_t i=0 ; i<sceneDescriptors->size(); i++)
    {
        std::vector<int> neighbors(1);
        std::vector<float> squaredDistances(1);

        int neighborCount = matching.nearestKSearch(sceneDescriptors->at(i),1,neighbors,squaredDistances);

        if(neighborCount==1 && squaredDistances[0]<0.25f)
        {
            pcl::Correspondence correspondence(neighbors[0], static_cast<int>(i), squaredDistances[0]);
            correspondences->push_back(correspondence);
        }
    }
    std::cout << "Found " << correspondences->size() << " correspondences." << std::endl;

    /// Clustering found correspondecnes ,Computer Pose and Hypothesis Verification
    bool verifyHypothesis = true;
    clusterAndPose(scene,model,correspondences,verifyHypothesis);


    //_____________________________________________________________________________________________________//

}


void PCGenNode::computeDescriptors(pcl::PointCloud<pcl::PointXYZ>::Ptr scene, pcl::PointCloud<pcl::VFHSignature308>::Ptr& sceneDescriptors)
{

    //pcl::PointCloud<pcl::PointXYZ>::Ptr scene(new pcl::PointCloud<pcl::PointXYZ>);
    //pcl::PointCloud<pcl::VFHSignature308>::Ptr sceneDescriptors(new pcl::PointCloud<pcl::VFHSignature308>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr plane(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr convexHull(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr objectsScene(new pcl::PointCloud<pcl::PointXYZ>);

    // Get the plane model, if present.
    pcl::ModelCoefficients::Ptr coefficients(new pcl::ModelCoefficients);
    pcl::SACSegmentation<pcl::PointXYZ> segmentation;
    segmentation.setInputCloud(scene);
    segmentation.setModelType(pcl::SACMODEL_PLANE);
    segmentation.setMethodType(pcl::SAC_RANSAC);
    segmentation.setDistanceThreshold(0.01);
    segmentation.setOptimizeCoefficients(true);
    pcl::PointIndices::Ptr planeIndices(new pcl::PointIndices);
    segmentation.segment(*planeIndices, *coefficients);
    //_____________________________________________________________________________________________________//

    if (planeIndices->indices.size() == 0)
        std::cout << "Could not find a plane in the scene." << std::endl;
    else
    {
        // Copy the points of the plane to a new cloud.
        pcl::ExtractIndices<pcl::PointXYZ> extract;
        extract.setInputCloud(scene);
        extract.setIndices(planeIndices);
        extract.filter(*plane);

        // Retrieve the convex hull.
        pcl::ConvexHull<pcl::PointXYZ> hull;
        hull.setInputCloud(plane);
        // Make sure that the resulting hull is bidimensional.
        hull.setDimension(2);
        hull.reconstruct(*convexHull);

        // Redundant check.
        if (hull.getDimension() == 2)
        {
            // Prism object.
            pcl::ExtractPolygonalPrismData<pcl::PointXYZ> prism;
            prism.setInputCloud(scene);
            prism.setInputPlanarHull(convexHull);
            // First parameter: minimum Z value. Set to 0, segments objects lying on the plane (can be negative).
            // Second parameter: maximum Z value, set to 10cm. Tune it according to the height of the objects you expect.
            prism.setHeightLimits(0.0f, 0.1f);
            pcl::PointIndices::Ptr objectIndices(new pcl::PointIndices);

            prism.segment(*objectIndices);

            // Get and show all points retrieved by the hull.
            extract.setIndices(objectIndices);
            extract.filter(*objectsScene);
            //pcl::visualization::CloudViewer viewerObjects("Objects on table");
            //viewerObjects.showCloud(objectsScene);
        }
        else std::cout << "The chosen hull is not planar." << std::endl;
    }
    //_____________________________________________________________________________________________________//

    //________CRH
    // Cloud for storing the object.
    //pcl::PointCloud<pcl::PointXYZ>::Ptr objectsScene(new pcl::PointCloud<pcl::PointXYZ>);
    // Object for storing the normals.
    pcl::PointCloud<pcl::Normal>::Ptr normalsScene(new pcl::PointCloud<pcl::Normal>);
    // Object for storing the CRH.
    pcl::PointCloud<pcl::Histogram<90>>::Ptr histogramScene(new pcl::PointCloud<pcl::Histogram<90>>);

    // Note: this cloud file should contain a snapshot of the object. Remember
    // that you need to compute a CRH for every VFH or CVFH descriptor that you
    // are going to have (that is, one for every snapshot).

    //_____________________________________________________________________________________________________//
    // Estimate the normals.
    pcl::NormalEstimation<pcl::PointXYZ, pcl::Normal> normalEstimation;
    normalEstimation.setInputCloud(objectsScene);
    normalEstimation.setRadiusSearch(0.03);
    pcl::search::KdTree<pcl::PointXYZ>::Ptr kdtree(new pcl::search::KdTree<pcl::PointXYZ>);
    normalEstimation.setSearchMethod(kdtree);
    normalEstimation.compute(*normalsScene);
    //_____________________________________________________________________________________________________//
    // CRH estimation object.
    pcl::CRHEstimation<pcl::PointXYZ, pcl::Normal, pcl::Histogram<90>> crh;
    crh.setInputCloud(objectsScene);
    crh.setInputNormals(normalsScene);
    Eigen::Vector4f centroid;
    pcl::compute3DCentroid(*objectsScene, centroid);
    crh.setCentroid(centroid);
    // Compute the CRH.
    crh.compute(*histogramScene);
    //_____________________________________________________________________________________________________//
    // CVFH estimation object.
    pcl::CVFHEstimation<pcl::PointXYZ, pcl::Normal, pcl::VFHSignature308> cvfh;
    cvfh.setInputCloud(objectsScene);
    cvfh.setInputNormals(normalsScene);
    cvfh.setSearchMethod(kdtree);
    // Set the maximum allowable deviation of the normals,
    // for the region segmentation step.
    cvfh.setEPSAngleThreshold(5.0 / 180.0 * M_PI); // 5 degrees.
    // Set the curvature threshold (maximum disparity between curvatures),
    // for the region segmentation step.
    cvfh.setCurvatureThreshold(1.0);
    // Set to true to normalize the bins of the resulting histogram,
    // using the total number of points. Note: enabling it will make CVFH
    // invariant to scale just like VFH, but the authors encourage the opposite.
    cvfh.setNormalizeBins(false);

    cvfh.compute(*sceneDescriptors);
    //_____________________________________________________________________________________________________//
}


void PCGenNode::clusterAndPose(pcl::PointCloud<pcl::PointXYZ>::Ptr scene ,pcl::PointCloud<pcl::PointXYZ>::Ptr model, pcl::CorrespondencesPtr correspondences, bool verifyHypothesis)
{

    // Objects for storing the keypoints of the scene and the model.
    pcl::PointCloud<pcl::PointXYZ>::Ptr sceneKeypoints(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr modelKeypoints(new pcl::PointCloud<pcl::PointXYZ>);

    keyPoints(scene,sceneKeypoints);
    keyPoints(model,modelKeypoints);

    //_____________________________________________________________________________________________________//
    // Objects for storing the unclustered and clustered correspondences.
    std::vector<pcl::Correspondences> clusteredCorrespondences;
    // Object for storing the transformations (rotation plus translation).
    std::vector<Eigen::Matrix4f, Eigen::aligned_allocator<Eigen::Matrix4f> > transformations;

    // Object for correspondence grouping.
    pcl::GeometricConsistencyGrouping<pcl::PointXYZ, pcl::PointXYZ> grouping;
    grouping.setSceneCloud(sceneKeypoints);
    grouping.setInputCloud(modelKeypoints);
    grouping.setModelSceneCorrespondences(correspondences);
    // Minimum cluster size. Default is 3 (as at least 3 correspondences
    // are needed to compute the 6 DoF pose).
    grouping.setGCThreshold(3);
    // Resolution of the consensus set used to cluster correspondences together,
    // in metric units. Default is 1.0.
    grouping.setGCSize(0.01);

    grouping.recognize(transformations, clusteredCorrespondences);

    std::cout << "Model instances found: " << transformations.size() << std::endl << std::endl;
    for (size_t i = 0; i < transformations.size(); i++)
    {
        std::cout << "Instance " << (i + 1) << ":" << std::endl;
        std::cout << "\tHas " << clusteredCorrespondences[i].size() << " correspondences." << std::endl << std::endl;

        Eigen::Matrix3f rotation = transformations[i].block<3, 3>(0, 0);
        Eigen::Vector3f translation = transformations[i].block<3, 1>(0, 3);
        printf("\t\t    | %6.3f %6.3f %6.3f | \n", rotation(0, 0), rotation(0, 1), rotation(0, 2));
        printf("\t\tR = | %6.3f %6.3f %6.3f | \n", rotation(1, 0), rotation(1, 1), rotation(1, 2));
        printf("\t\t    | %6.3f %6.3f %6.3f | \n", rotation(2, 0), rotation(2, 1), rotation(2, 2));
        std::cout << std::endl;
        printf("\t\tt = < %0.3f, %0.3f, %0.3f >\n", translation(0), translation(1), translation(2));
    }

    //_____________________________________________________________________________________________________//
    ///// POSE REFINEMENT

    /**
     * Stop if no instances
     */
    if (transformations.size() <= 0)
    {
        std:cout << "*** No Intances found! *** " <<std::endl;
    }
    else
    {
        std::cout << "Recognized Instances: " << transformations.size () << std::endl << std::endl;
    }

    /**
    * Generates clouds for each instances found
    */
    std::vector<pcl::PointCloud<pcl::PointXYZ>::ConstPtr> instances;

    for (std::size_t i=0 ;  i<transformations.size() ; i++)
    {
        pcl::PointCloud<pcl::PointXYZ>::Ptr rotated_model (new pcl::PointCloud<pcl::PointXYZ> ());
        // NEED TO INPUT MODEL ->modelNormals  -> modelDescriptors
        pcl::transformPointCloud (*model, *rotated_model, transformations[i]);
        instances.push_back (rotated_model);
    }
    std::vector<pcl::PointCloud<pcl::PointXYZ>::ConstPtr> registered_instances;

    std::cout << "--- ICP ---------" << std::endl;

    for (std::size_t i = 0; i < transformations.size (); ++i)
    {
        pcl::IterativeClosestPoint<pcl::PointXYZ, pcl::PointXYZ> icp;
        icp.setMaximumIterations (5);
        icp.setMaxCorrespondenceDistance (0.005f);
        icp.setTransformationEpsilon(1e-8);
        icp.setEuclideanFitnessEpsilon(1);
        icp.setInputTarget (scene);
        icp.setInputSource (instances[i]);
        pcl::PointCloud<pcl::PointXYZ>::Ptr registered (new pcl::PointCloud<pcl::PointXYZ>);
        icp.align (*registered);
        registered_instances.push_back (registered);
        std::cout << "Instance " << i << " ";
        if (icp.hasConverged ())
        {
            std::cout << "Aligned!" << std::endl;
            modelTransform = icp.getFinalTransformation();
            modelRegistered = true;
        }
        else
        {
            std::cout << "Not Aligned!" << std::endl;
        }
    }

    std::cout << "-----------------" << std::endl << std::endl;

    //_____________________________________________________________________________________________________//
    /// HYPOTHESIS VERIFICATION
    if (verifyHypothesis ==true)
        hypotesisVerification(scene,instances);




}
void PCGenNode::keyPoints(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud,pcl::PointCloud<pcl::PointXYZ>::Ptr& keypoints)
{
    // ISS keypoint detector object.
    pcl::ISSKeypoint3D<pcl::PointXYZ, pcl::PointXYZ> detector;
    detector.setInputCloud(cloud);
    pcl::search::KdTree<pcl::PointXYZ>::Ptr kdtree(new pcl::search::KdTree<pcl::PointXYZ>);
    detector.setSearchMethod(kdtree);
    double resolution = computeCloudResolution(cloud);
    // Set the radius of the spherical neighborhood used to compute the scatter matrix.
    detector.setSalientRadius(6 * resolution);
    // Set the radius for the application of the non maxima supression algorithm.
    detector.setNonMaxRadius(4 * resolution);
    // Set the minimum number of neighbors that has to be found while applying the non maxima suppression algorithm.
    detector.setMinNeighbors(5);
    // Set the upper bound on the ratio between the second and the first eigenvalue.
    detector.setThreshold21(0.975);
    // Set the upper bound on the ratio between the third and the second eigenvalue.
    detector.setThreshold32(0.975);
    // Set the number of prpcessing threads to use. 0 sets it to automatic.
    detector.setNumberOfThreads(4);

    detector.compute(*keypoints);

}

double PCGenNode::computeCloudResolution(const pcl::PointCloud<pcl::PointXYZ>::ConstPtr& cloud)
{
    double resolution = 0.0;
    int numberOfPoints = 0;
    int nres;
    std::vector<int> indices(2);
    std::vector<float> squaredDistances(2);
    pcl::search::KdTree<pcl::PointXYZ> tree;
    tree.setInputCloud(cloud);

    for (size_t i = 0; i < cloud->size(); ++i)
    {
        if (! pcl_isfinite((*cloud)[i].x))
            continue;

        // Considering the second neighbor since the first is the point itself.
        nres = tree.nearestKSearch(i, 2, indices, squaredDistances);
        if (nres == 2)
        {
            resolution += sqrt(squaredDistances[1]);
            ++numberOfPoints;
        }
    }
    if (numberOfPoints != 0)
        resolution /= numberOfPoints;

    return resolution;
}

void PCGenNode::hypotesisVerification(pcl::PointCloud<pcl::PointXYZ>::Ptr scene,std::vector<pcl::PointCloud<pcl::PointXYZ>::ConstPtr> registered_instances)
{
    /**
     * Hypothesis Verification
     */
    std::cout << "--- Hypotheses Verification ---" << std::endl;
    std::vector<bool> hypotheses_mask;  // Mask Vector to identify positive hypotheses

    pcl::GlobalHypothesesVerification<pcl::PointXYZ, pcl::PointXYZ> GoHv;

    GoHv.setSceneCloud (scene);  // Scene Cloud
    GoHv.addModels (registered_instances, true);  //Models to verify
    GoHv.setResolution (0.005f);
    //GoHv.setResolutionOccupancyGrid (5.0f);
    GoHv.setInlierThreshold (0.005f);
    GoHv.setOcclusionThreshold (0.01f);
    GoHv.setRegularizer (3.0f);
    GoHv.setRadiusClutter (0.03f);
    GoHv.setClutterRegularizer (5.0f);
    GoHv.setDetectClutter (true);
    GoHv.setRadiusNormals (0.05);

    GoHv.verify ();
    GoHv.getMask (hypotheses_mask);  // i-element TRUE if hvModels[i] verifies hypotheses

    for (int i = 0; i < hypotheses_mask.size (); i++)
    {
        if (hypotheses_mask[i])
        {
            std::cout << "Instance " << i << " is GOOD! <---" << std::endl;
        }
        else
        {
            std::cout << "Instance " << i << " is bad!" << std::endl;
        }
    }
    std::cout << "-------------------------------" << std::endl;

}