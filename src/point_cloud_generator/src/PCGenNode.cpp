#include "PCGenNode.h"

using namespace pcl;

PCGenNode::PCGenNode()
: cloudSub(nh.subscribe("/points2", 1, &PCGenNode::cloudCallback, this))
, captureService(nh.advertiseService("capture_cloud", &PCGenNode::captureCloud, this))
{
    cloudProcessed = false;
}

void PCGenNode::cloudCallback(const sensor_msgs::PointCloud2ConstPtr& cloud_msg)
{
    pcl::fromROSMsg (*cloud_msg, mostRecentCloud);

}

void PCGenNode::listenTransform()
{
    //To - do get transform from base2gripper and convert from quarternion to 4x4 matrix.
    tf::StampedTransform base2gripper;
    try
    {
        listener.lookupTransform("end_effector", "base", ros::Time(0), base2gripper);
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
        cloudList.push_back(mostRecentCloud);

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

}

//Convert all captured point clouds to base frame using Interative Closest Point to find all points in first frame (i think icp automatically finds
//correspondense)
void PCGenNode::stitchClouds()
{
    //visualize cloud?
    pcl::PointCloud<pcl::PointXYZ>::Ptr source, target;

    //first target is the first point in the cloud
    pcl::transformPointCloud(cloudList[0], target, cloudTransforms[0]);

    for (int i = 0; i < cloudList.size(); i++)
    {
        Eigen::Matrix4f pairTransform;
        pcl::transformPointCloud(cloudList[i], source, cloudTransforms[i]);
        pcl::PointCloud<pcl::PointXYZ>::Ptr temp (new PointCloud<pcl::PointXYZ>);

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

    *output = cloud_source_registered + cloud_tgt;

}

void PCGenNode::formatTransform(tf::StampedTransform tfTransform, const Eigen::Matrix4f &eigenTransform)
{
    tf::Matrix3x3 rotTF;
    tf::Vector3 transTF;

    Eigen::Matrix3d R;
    Eigen::Vector3d T;

    rotTF = tfTransform.getBasis();
    transTF = tfTransform.getOrigin();

    tf::matrixTFToEigen(rotTF, R);
    tf::vectorTFToEigen(transTF,T);

    Eigen::Matrix4d Trans;
    Trans.setIdentity();
    Trans.block<3,3>(0,0) = R;
    Trans.block<3,1>(0,3) = T;

    eigenTransform = Trans.cast<float>();

}