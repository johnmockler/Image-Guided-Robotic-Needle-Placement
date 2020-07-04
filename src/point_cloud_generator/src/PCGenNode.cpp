#include "PCGenNode.h"

using namespace pcl;

PCGenNode::PCGenNode()
: cloudSub(nh.subscribe("/points2", 1, &PCGenNode::cloudCallback, this))
, captureService(nh.advertiseService("capture_cloud", &PCGenNode::captureCloud, this))
, mostRecentCloud(new pcl::PointCloud<pcl::PointXYZ>)
{
    
    cloudProcessed = false;

    
}

void PCGenNode::cloudCallback(const sensor_msgs::PointCloud2ConstPtr& cloud_msg)
{
    pcl::PointCloud<pcl::PointXYZ> temp;
    pcl::fromROSMsg (*cloud_msg, *mostRecentCloud);




    //mostRecentCloud = temp;

}

void PCGenNode::listenTransform()
{
    ROS_INFO("collecting stuff");
    //To - do get transform from base2gripper and convert from quarternion to 4x4 matrix.
    tf::StampedTransform base2gripper;
    try
    {
        listener.lookupTransform("panda_link7", "panda_link0", ros::Time(0), base2gripper);
        ROS_INFO_STREAM(" base2gripper: " << base2gripper.getOrigin().x() << ", " << base2gripper.getOrigin().y() << ", " <<base2gripper.getOrigin().z() << ", "
                                              << base2gripper.getRotation().x() << ", " << base2gripper.getRotation().y() << ", " << base2gripper.getRotation().z());
        mostRecentTransform = base2gripper;
        //add store transform to class variables
    }
    catch (tf::TransformException ex)
    {
        ROS_ERROR("%s", ex.what());
        ros::Duration(1.0).sleep();
    }
}

bool PCGenNode::captureCloud(messages::ImageCapture::Request& req, messages::ImageCapture::Response& res)
{
    if (req.x == false)
    {
        ROS_INFO("capturing point cloud [%ld]", (int) cloudList.size());
        //pcViewer(mostRecentCloud);
        pcl::PointCloud<pcl::PointXYZ>::Ptr filteredCloud(new PointCloud<pcl::PointXYZ>);
        
        std::vector< int > indices;
        pcl::removeNaNFromPointCloud(*mostRecentCloud, *filteredCloud, indices);

        cloudList.push_back(filteredCloud);

        
        tf::StampedTransform base2gripper;
        listener.lookupTransform("panda_link7", "panda_link0", ros::Time(0), base2gripper);
        mostRecentTransform = base2gripper;
        

        
        Eigen::Matrix4f convertedTransform;
        formatTransform(mostRecentTransform, convertedTransform);
        cloudTransforms.push_back(convertedTransform);
        
    }
    else if (req.x == true && cloudProcessed == false)
    {
        ROS_INFO("stitching point clouds...");
        stitchClouds();
        registerModel();

    }

    res.y = true;

}

//Convert all captured point clouds to base frame using Interative Closest Point to find all points in first frame (i think icp automatically finds
//correspondense)
void PCGenNode::stitchClouds()
{
    //visualize cloud?
    pcl::PointCloud<pcl::PointXYZ>::Ptr source(new PointCloud<pcl::PointXYZ>), target(new PointCloud<pcl::PointXYZ>);
    ROS_INFO("here");

    //first target is the first point in the cloud
    pcl::transformPointCloud(*cloudList[0], *target, cloudTransforms[0]);

    ROS_INFO("here 2");

    for (int i = 0; i < cloudList.size(); i++)
    {
        Eigen::Matrix4f pairTransform;
        pcl::transformPointCloud(*cloudList[i], *source, cloudTransforms[i]);
        pcl::PointCloud<pcl::PointXYZ>::Ptr temp (new PointCloud<pcl::PointXYZ>);
        ROS_INFO("here3");
        pairAlign(source,target,temp, pairTransform);

        target = temp;

    }

    scanResults = target;

}

void PCGenNode::registerModel()
{
    return;
}

void PCGenNode::pairAlign(const pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_src, const pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_tgt, pcl::PointCloud<pcl::PointXYZ>::Ptr output, Eigen::Matrix4f &final_transform)
{
    pcl::PointCloud<pcl::PointXYZ> cloud_source_registered;
    IterativeClosestPoint<PointXYZ, PointXYZ> icp;

    icp.setInputCloud(cloud_src);
    icp.setInputTarget(cloud_tgt);

     // Set the max correspondence distance to 5cm (e.g., correspondences with higher distances will be ignored)
    icp.setMaxCorrespondenceDistance (0.05);
    // Set the maximum number of iterations (criterion 1)
    icp.setMaximumIterations (50);
    // Set the transformation epsilon (criterion 2)
    icp.setTransformationEpsilon (1e-8);
    // Set the euclidean distance difference epsilon (criterion 3)
    icp.setEuclideanFitnessEpsilon (1);
    // Perform the alignment
    icp.align (cloud_source_registered);

    final_transform = icp.getFinalTransformation();

    *output = cloud_source_registered + *cloud_tgt;

}

void PCGenNode::formatTransform(tf::StampedTransform tfTransform, Eigen::Matrix4f &eigenTransform)
{
    tf::Matrix3x3 rotTF;
    tf::Vector3 transTF;

    Eigen::Matrix3d R;
    Eigen::Vector3d T;

    rotTF = tfTransform.getBasis();
    transTF = tfTransform.getOrigin();
    ROS_INFO_STREAM(" tfTransform: " << tfTransform.getOrigin().x() << ", " << tfTransform.getOrigin().y() << ", " <<tfTransform.getOrigin().z() << ", "
                                              << tfTransform.getRotation().x() << ", " << tfTransform.getRotation().y() << ", " << tfTransform.getRotation().z());
    tf::matrixTFToEigen(rotTF, R);
    tf::vectorTFToEigen(transTF,T);

    Eigen::Matrix4d Trans;
    Trans.setIdentity();
    Trans.block<3,3>(0,0) = R;
    Trans.block<3,1>(0,3) = T;
    std::cout<<Trans<<std::endl;

    eigenTransform = Trans.cast<float> ();
    ROS_INFO("i've been here");

}

void PCGenNode::pcViewer(const pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_src)
{
    //pcl::visualization::CloudViewer viewer("Simple Cloud Viewer");


    //pcl::PointCloud<pcl::PointXYZRGB>::Ptr ptrCloud(&cloud_src);


    //viewer.showCloud (cloud_src);



}
