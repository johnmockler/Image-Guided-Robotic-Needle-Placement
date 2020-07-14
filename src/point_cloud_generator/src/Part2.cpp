//REGISTRATION
#include <pcl/io/pcd_io.h>
#include <pcl/registration/icp.h>

#include <iostream>

int ICP(int argc, char *argv)
{
    // Objects for storing the point clouds.
    pcl::PointCloud<pcl::PointXYZ>::Ptr sourceCloud(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr targetCloud(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr finalCloud(new pcl::PointCloud<pcl::PointXYZ>);

    //ICP object
    pcl::IterativeClosestPoint<pcl::PointXYZ, pcl::PointXYZ> reg;
    reg.setInputSource(sourceCloud);
    reg.setInputTarget(targetCloud);

    reg.align(*finalCloud);

    if (reg.hasConverged())
    {
        std::cout << "ICP converged." << std::endl
                  << "The score is " << reg.getFitnessScore() << std::endl;
        std::cout << "Transformation matrix:" << std::endl;
        std::cout << reg.getFinalTransformation() << std::endl;
    }
    else std::cout << "ICP did not converge." << std::endl;
}

#include <pcl/io/pcd_io.h>
#include <pcl/sample_consensus/ransac.h>
#include <pcl/sample_consensus/sac_model_sphere.h>
int Model_fitting (int argc, char** argv)
{
    // Objects for storing the point clouds.
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr inlierPoints(new pcl::PointCloud<pcl::PointXYZ>);

    // RANSAC objects: model and algorithm.
    pcl::SampleConsensusModelSphere<pcl::PointXYZ>::Ptr model(new pcl::SampleConsensusModelSphere<pcl::PointXYZ>(cloud));
    pcl::RandomSampleConsensus<pcl::PointXYZ> ransac(model);

    //Set the maximum allowed distance to the model
    ransac.setDistanceThreshold(0.01);  // or ransac.setMaxIterations();
    ransac.computeModel();

    std::vector<int> inlierIndices;
    ransca.getInlier(inlierIndices);

    //Copy all inlier of the model to another cloud
    pcl::copyPointCloud<pcl::PointXYZ>(*cloud,inlierIndices, *inlierPoints);

}

//Projecting points
//After you have recovered the coefficients of a model, it is possible to project the points of a cloud onto said model. For example,
//if the model is a plane, after projection the points of the cloud would all lie on the plane.

//SEGMENTATION

//Euclidean
//t checks the distance between two points.
// If it is less than a threshold, both are considered to belong in the same cluster.
#include <pcl/io/pcd_io.h>
#include <pcl/segmentation/extract_clusters.h>

int segmentation_euclidean (int argc, char ** argv)
{
    // Object for storing the point cloud.
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);

    // kd-tree object for searches.
    pcl::search::KdTree<pcl::PointXYZ>::Ptr kdtree(new pcl::search::KdTree<pcl::PointXYZ>);
    kdtree->setInputCloud(cloud);

    //Eclidean clustering object.
    pcl::EuclideanClusterExtraction<pcl::PointXYZ> clustering;

    //Set cluster tolerance to 2cm (small values may cause objects to be divided)
    // in several clusters, whereas big values may join objects in same cluster
    clustering.setClusterTolerance(0.02);
    //Set the minimum and maximum number of points that a cluster can have
    clustering.setMinClusterSize(100);
    clustering.setMaxClusterSize(25000);
    clustering.setSearchMethod(kdtree);

    std::vector<pcl::PointIndices> clusters;
    clustering.extract(clusters);

    //For every cluster...

    int currentClusterNum = 1;

    for (std::vector<pcl::PointIndices>::const_iterator i = clusters.begin(); i != clusters.end(); ++i)
    {
        //...add all its points to a new cloud...
        pcl::PointCloud<pcl::PointXYZ>::Ptr cluster (new pcl::PointCloud<pcl::PointXYZ>);
        for (std::vector<int>::const_iterator point = i->indices.begin(); point != i->indices.end(); point++)
        {
            cluster->width = cluster->points.size();
            cluster->height = 1;
            cluster->is_dense = true;

            // and save it to disk.

            if (cluster->points.size() <= 0)
                break;
            std::cout << "Cluster " << currentClusterNum << " has " << cluster->points.size() << " points." << std::endl;
            std::string fileName = "cluster" + boost::to_string(currentClusterNum) + ".pcd";
            pcl::io::savePCDFileASCII(fileName, *cluster);

            currentClusterNum++;
        }
    }
}

//Conditional
//Apart from the distance check, points need also to meet a special, custom requirement for them to be added to a cluster.

#include <pcl/segmentation/conditional_euclidean_clustering.h>


// If this function returns true, the candidate point will be added
// to the cluster of the seed point.

bool
customCondition(const pcl::PointXYZ& seedPoint, const pcl::PointXYZ& candidatePoint, float squaredDistance)
{
    // Do whatever you want here.
    if (candidatePoint.y < seedPoint.y)
        return false;

    return true;
}

int segmentation_conditional (int argc, char** argv)
{
    // Object for storing the point cloud.
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);


    // Conditional Euclidean clustering object.
    pcl::ConditionalEuclideanClustering<pcl::PointXYZ> clustering;
    clustering.setClusterTolerance(0.02);
    clustering.setMinClusterSize(100);
    clustering.setMaxClusterSize(25000);
    clustering.setInputCloud(cloud);
    // Set the function that will be called for every pair of points to check.
    clustering.setConditionFunction(&customCondition);

    std::vector<pcl::PointIndices> clusters;
    clustering.segment(clusters);

    // For every cluster...
    int currentClusterNum = 1;
    for (std::vector<pcl::PointIndices>::const_iterator i = clusters.begin(); i != clusters.end(); ++i)
    {
        // ...add all its points to a new cloud...
        pcl::PointCloud<pcl::PointXYZ>::Ptr cluster(new pcl::PointCloud<pcl::PointXYZ>);
        for (std::vector<int>::const_iterator point = i->indices.begin(); point != i->indices.end(); point++)
            cluster->points.push_back(cloud->points[*point]);
        cluster->width = cluster->points.size();
        cluster->height = 1;
        cluster->is_dense = true;

        // ...and save it to disk.
        if (cluster->points.size() <= 0)
            break;
        std::cout << "Cluster " << currentClusterNum << " has " << cluster->points.size() << " points." << std::endl;
        std::string fileName = "cluster" + boost::to_string(currentClusterNum) + ".pcd";
        pcl::io::savePCDFileASCII(fileName, *cluster);

        currentClusterNum++;
    }
}



#include <pcl/io/pcd_io.h>
#include <pcl/search/kdtree.h>
#include <pcl/features/normal_3d.h>
#include <pcl/segmentation/region_growing.h>

int segmentation_region_growing(int argc, char** argv)
{
    // Object for storing the point cloud.
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
    // Object for storing the normals.
    pcl::PointCloud<pcl::Normal>::Ptr normals(new pcl::PointCloud<pcl::Normal>);

    // kd- tree object for searches.
    pcl::search::KdTree<pcl::PointXYZ>::Ptr kdtree (new pcl::search::KdTree<pcl::PointXYZ>);
    kdtree->setInputCloud(cloud);

    // Estimate the normals.
    pcl::NormalEstimation<pcl::PointXYZ, pcl::Normal> normalEstimation;
    normalEstimation.setInputCloud(cloud);
    normalEstimation.setRadiusSearch(0.03);
    normalEstimation.setSearchMethod(kdtree);
    normalEstimation.compute(*normals);

    // Region growing clustering object.
    pcl::RegionGrowing<pcl::PointXYZ, pcl::Normal> clustering;
    clustering.setMinClusterSize(100);
    clustering.setMaxClusterSize(10000);
    clustering.setSearchMethod(kdtree);
    clustering.setNumberOfNeighbours(30);
    clustering.setInputCloud(cloud);
    clustering.setInputNormals(normals);

    // Set the angle in radians that will be the smoothness threshold
    // (the maximum allowable deviation of the normals).
    clustering.setSmoothnessThreshold(7.0 / 180.0 * M_PI); // 7 degrees.
    // Set the curvature threshold. The disparity between curvatures will be
    // tested after the normal deviation check has passed.
    clustering.setCurvatureThreshold(1.0);

    std::vector <pcl::PointIndices> clusters;
    clustering.extract(clusters);

    // For every cluster...
    int currentClusterNum = 1;
    for (std::vector<pcl::PointIndices>::const_iterator i = clusters.begin(); i != clusters.end(); ++i)
    {
        // ...add all its points to a new cloud...
        pcl::PointCloud<pcl::PointXYZ>::Ptr cluster(new pcl::PointCloud<pcl::PointXYZ>);
        for (std::vector<int>::const_iterator point = i->indices.begin(); point != i->indices.end(); point++)
            cluster->points.push_back(cloud->points[*point]);
        cluster->width = cluster->points.size();
        cluster->height = 1;
        cluster->is_dense = true;

        // ...and save it to disk.
        if (cluster->points.size() <= 0)
            break;
        std::cout << "Cluster " << currentClusterNum << " has " << cluster->points.size() << " points." << std::endl;
        std::string fileName = "cluster" + boost::to_string(currentClusterNum) + ".pcd";
        pcl::io::savePCDFileASCII(fileName, *cluster);

        currentClusterNum++;
    }
}


//Color-based
//This method is based on the previous one but, instead of comparing the normals and the curvature of the points,
// it compares the RGB color.
// Like always, if the difference is less than a threshold, both are put in the same cluster


#include <pcl/io/pcd_io.h>
#include <pcl/search/kdtree.h>
#include <pcl/segmentation/region_growing_rgb.h>

#include <iostream>


int segmentation_color_based(int argc, char** argv)
{
    // Object for storing the point cloud, with color information.
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZRGB>);

    // kd-tree object for searches.
    pcl::search::KdTree<pcl::PointXYZRGB>::Ptr kdtree(new pcl::search::KdTree<pcl::PointXYZRGB>);
    kdtree->setInputCloud(cloud);

    // Color-based region growing clustering object.
    pcl::RegionGrowingRGB<pcl::PointXYZRGB> clustering;
    clustering.setInputCloud(cloud);
    clustering.setSearchMethod(kdtree);
    // Here, the minimum cluster size affects also the postprocessing step:
    // clusters smaller than this will be merged with their neighbors.
    clustering.setMinClusterSize(100);
    // Set the distance threshold, to know which points will be considered neighbors.
    clustering.setDistanceThreshold(10);
    // Color threshold for comparing the RGB color of two points.
    clustering.setPointColorThreshold(6);
    // Region color threshold for the postprocessing step: clusters with colors
    // within the threshold will be merged in one.
    clustering.setRegionColorThreshold(5);

    std::vector <pcl::PointIndices> clusters;
    clustering.extract(clusters);

    // For every cluster...
    int currentClusterNum = 1;
    for (std::vector<pcl::PointIndices>::const_iterator i = clusters.begin(); i != clusters.end(); ++i)
    {
        // ...add all its points to a new cloud...
        pcl::PointCloud<pcl::PointXYZRGB>::Ptr cluster(new pcl::PointCloud<pcl::PointXYZRGB>);
        for (std::vector<int>::const_iterator point = i->indices.begin(); point != i->indices.end(); point++)
            cluster->points.push_back(cloud->points[*point]);
        cluster->width = cluster->points.size();
        cluster->height = 1;
        cluster->is_dense = true;

        // ...and save it to disk.
        if (cluster->points.size() <= 0)
            break;
        std::cout << "Cluster " << currentClusterNum << " has " << cluster->points.size() << " points." << std::endl;
        std::string fileName = "cluster" + boost::to_string(currentClusterNum) + ".pcd";
        pcl::io::savePCDFileASCII(fileName, *cluster);

        currentClusterNum++;
    }
}

// Min Cut

/*
 *  it divides the cloud in two clusters, one with points that do not belong to the object we are interested in (background points)
 *  and another with points that are considered part of the object (foreground points).
 */

#include <pcl/io/pcd_io.h>
#include <pcl/segmentation/min_cut_segmentation.h>

#include <iostream>

int min_cut (int argc, char** argv)
{
    // Object for storing the point cloud.
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);

    //Min -Cut clustering object.
    pcl::MinCutSegmentation<pcl::PointXYZ> clustering;
    clustering.setInputCloud(cloud);

    // Create a cloud that lists all the points that we know belong to the object
    // (foreground points). We should set here the object's center.
    pcl::PointCloud<pcl::PointXYZ>::Ptr foregroundPoints(new pcl::PointCloud<pcl::PointXYZ>());

    pcl::PointXYZ point;
    point.x = 100.0;
    point.y = 100.0;
    point.z = 100.0;
    foregroundPoints->points.push_back(point);
    clustering.setForegroundPoints(foregroundPoints);
    // Set sigma, which affects the smooth cost calculation. It should be
    // set depending on the spacing between points in the cloud (resolution).
    clustering.setSigma(0.05);
    // Set the radius of the object we are looking for.
    clustering.setRadius(0.20);
    // Set the number of neighbors to look for. Increasing this also increases
    // the number of edges the graph will have.
    clustering.setNumberOfNeighbours(20);
    // Set the foreground penalty. It is the weight of the edges
    // that connect clouds points with the source vertex.
    clustering.setSourceWeight(0.6);

    std::vector <pcl::PointIndices> clusters;
    clustering.extract(clusters);

    std::cout << "Maximum flow is " << clustering.getMaxFlow() << "." << std::endl;

    // For every cluster...
    int currentClusterNum = 1;
    for (std::vector<pcl::PointIndices>::const_iterator i = clusters.begin(); i != clusters.end(); ++i)
    {
        // ...add all its points to a new cloud...
        pcl::PointCloud<pcl::PointXYZ>::Ptr cluster(new pcl::PointCloud<pcl::PointXYZ>);
        for (std::vector<int>::const_iterator point = i->indices.begin(); point != i->indices.end(); point++)
            cluster->points.push_back(cloud->points[*point]);
        cluster->width = cluster->points.size();
        cluster->height = 1;
        cluster->is_dense = true;

        // ...and save it to disk.
        if (cluster->points.size() <= 0)
            break;
        std::cout << "Cluster " << currentClusterNum << " has " << cluster->points.size() << " points." << std::endl;
        std::string fileName = "cluster" + boost::to_string(currentClusterNum) + ".pcd";
        pcl::io::savePCDFileASCII(fileName, *cluster);

        currentClusterNum++;
    }

}

// RANSAC

/*
 *  It will search the cloud and find a list of points
 *  that support the chosen model (plane, sphere...),
 *  and also compute the coefficients of the model
 */

//Plane model
/*The following code lets you segment all planar surfaces from a point cloud.
 * This is very important, because you will be able to detect things like the floor, ceiling, walls, or a table in a scene.
 * If you know that the object you are looking for is sitting on a table, you can discard all points that are not supported by it,
 * with the associated performance gain.
 */


#include <pcl/io/pcd_io.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>

int RANSAC_Plane(int argc, char** argv)
{
    // Objects for storing the point clouds.
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr inlierPoints(new pcl::PointCloud<pcl::PointXYZ>);

    // Object for storing the plane model coefficients.
    pcl::ModelCoefficients::Ptr coefficients(new pcl::ModelCoefficients);

    // Create the segmentation object.
    pcl::SACSegmentation<pcl::PointXYZ> segmentation;
    segmentation.setInputCloud(cloud);

    // Configure the object to look for a plane.
    segmentation.setModelType(pcl::SACMODEL_PLANE);
    // Use RANSAC method.
    segmentation.setMethodType(pcl::SAC_RANSAC);
    // Set the maximum allowed distance to the model.
    segmentation.setDistanceThreshold(0.01);
    // Enable model coefficient refinement (optional).
    segmentation.setOptimizeCoefficients(true);

    pcl::PointIndices inlierIndices;
    segmentation.segment(inlierIndices, *coefficients);

    if(inlierIndices.indices.size()==0)
        std::cout <<"Could not find any point that fitted the plane model. "<<std::endl;
    else
    {
        std::cerr<<"Model Coefficients: "
                <<coefficients->values[0] << ""
                <<coefficients->values[1] << ""
                <<coefficients->values[2] << ""
                <<coefficients->values[3] <<std::endl;
        // Copy all inlier of the model to another cloud.
        pcl::copyPointCloud<pcl::PointXYZ>(*cloud,inlierIndices, *inlierPoints);
    }

}


//Cylinder Model

int RANSAC_Cylinder (int argc, char** argv)
{
    // Objects for storing the point clouds.
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr inlierPoints(new pcl::PointCloud<pcl::PointXYZ>);

    // Read a PCD file from disk.
    if (pcl::io::loadPCDFile<pcl::PointXYZ>(argv[1], *cloud) != 0)
    {
        return -1;
    }

    // Object for storing the plane model coefficients.
    pcl::ModelCoefficients::Ptr coefficients(new pcl::ModelCoefficients);
    // Create the segmentation object.
    pcl::SACSegmentation<pcl::PointXYZ> segmentation;
    segmentation.setInputCloud(cloud);
    // Configure the object to look for a plane.
    segmentation.setModelType(pcl::SACMODEL_CYLINDER);
    // Use RANSAC method.
    segmentation.setMethodType(pcl::SAC_RANSAC);
    // Set the maximum allowed distance to the model.
    segmentation.setDistanceThreshold(0.01);
    // Enable model coefficient refinement (optional).
    segmentation.setOptimizeCoefficients(true);
    // Set minimum and maximum radii of the cylinder.
    segmentation.setRadiusLimits(0, 0.1);

    pcl::PointIndices inlierIndices;
    segmentation.segment(inlierIndices, *coefficients);

    if (inlierIndices.indices.size() == 0)
        std::cout << "Could not find any points that fitted the cylinder model." << std::endl;
        // Copy all inliers of the model to another cloud.
    else pcl::copyPointCloud<pcl::PointXYZ>(*cloud, inlierIndices, *inlierPoints);
}



// Retrieving the hull
/*
 * or a given set of points, PCL can compute the external hull of the shape, using the QHull library.
 * The hull could be defined as the points that conform the outermost boundary of the set, like a shell showing the volume.
 */
//There are two types of hull that you can calculate, the convex and the concave one

#include <pcl/io/pcd_io.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/surface/concave_hull.h>
#include <pcl/visualization/cloud_viewer.h>

int concave_hull (int argc, char** argv)
{
    // Objects for storing the point clouds.
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr plane(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr convexHull(new pcl::PointCloud<pcl::PointXYZ>);

    	// Read a PCD file from disk.
	if (pcl::io::loadPCDFile<pcl::PointXYZ>(argv[1], *cloud) != 0)
	{
		return -1;
	}

	// Get the plane model, if present.
	pcl::ModelCoefficients::Ptr coefficients(new pcl::ModelCoefficients);
	pcl::SACSegmentation<pcl::PointXYZ> segmentation;
	segmentation.setInputCloud(cloud);
	segmentation.setModelType(pcl::SACMODEL_PLANE);
	segmentation.setMethodType(pcl::SAC_RANSAC);
	segmentation.setDistanceThreshold(0.01);
	segmentation.setOptimizeCoefficients(true);
	pcl::PointIndices::Ptr inlierIndices(new pcl::PointIndices);
	segmentation.segment(*inlierIndices, *coefficients);

	if (inlierIndices->indices.size() ==0)
	    std::cout << "Could not find a plane in the scene. "<<std::endl;
	else
    {
	    //COpy the points of the plane to a new cloud.
	    pcl::ExtractIndices<pcl::PointXYZ> extract;
	    extract.setInputCloud(cloud);
	    extract.setIndices(inlierIndices);
	    extract.filter(*plane);

	    //Object for retrieving the convex hull
	    pcl::ConvexHull<pcl::PointXYZ> hull;
	    hull.setInputCloud(plane);
	    hull.reconstruct(*convexHull);

	    //Visualize the hull
	    pcl::visualization::CloudViewer viewerPlane("Convex Hull");
	    viewerPlane.showCloud(convexHull);
	    while(!viewerPlane.wasStopped())
        {
	        // Do nothing but wait
        }
    }
}