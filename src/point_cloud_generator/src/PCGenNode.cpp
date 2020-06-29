#include "PCGenNode.h"

using namespace pcl;

PCGenNode::PCGenNode()
: cloudSub(nh.subscribe("/points2", 1, &PCGenNode::cloudCallback, this))
, captureService(nh.advertiseService("capture_image", &CameraCalibrationNode::captureImage, this))
{
    cloudProcessed = false;
}

void PCGenNode::cloudCallback(const pcl::PointCloud& msg)
{
    mostRecentCloud = msg;

}

bool PCGenNode::captureCloud(messages::ImageCapture::Request& req, messages::ImageCapture::Response& res)
{
    if (req.x == false)
    {
        ROS_INFO("capturing point cloud [%ld]", (int) cloudList.size());
        cloudList.push_back(mostRecentCloud);
    }
    else if (req.x == true && cloudProcessed == false)
    {
        ROS_INFO("stitching point clouds...")
        stitchClouds();
        registerModel();

    }

}

//Convert all captured point clouds to base frame using Interative Closest Point to find all points in first frame (i think icp automatically finds
//correspondense)
void PCGenNode::stitchClouds()
{

    //visualize cloud?
    
    PointCloud::Ptr source, target;

    //first target is the first point in the cloud
    pcl::transformPointCloud(cloudList[0], target, cloudTransforms[0]);

    for (int i = 0; i < cloudList.size(); i++)
    {
        pcl::transformPointCloud(cloudList[i], source, cloudTransforms[i]);
        PointCloud::Ptr temp (new PointCloud);

        pairAlign(source,target,temp, pairTransform);

        target = temp;

    }

    scanResults = target;

}

void PCGenNode::registerModel()
{
    return;
}

void PCGenNode::pairAlign(const PointCloud::Ptr cloud_src, const PointCloud::Ptr cloud_tgt, PointCloud::Ptr output, Eigen::Matrix4f &final_transform)
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