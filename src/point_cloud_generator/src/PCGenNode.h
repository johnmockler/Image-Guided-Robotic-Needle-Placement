#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <vector> 
//PCL Includes
#include <pcl/memory.h>  // for pcl::make_shared
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <pcl/point_representation.h>
#include <pcl/io/pcd_io.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/filters/filter.h>
#include <pcl/features/normal_3d.h>
#include <pcl/registration/icp.h>
#include <pcl/registration/icp_nl.h>
#include <pcl/registration/transforms.h>
#include <pcl/visualization/pcl_visualizer.h>

#include <messages/ImageCapture.h>

class PCGenNode
{
private:
    //ROS objects here
    ros::NodeHandle nh;
    ros::Subscriber cloudSub;
    ros::ServiceServer captureService;

    //Class Methods here
    void cloudCallback(const pcl::PointCloud& msg);
    //need to add data type here
    void transformCallback();
    bool captureCloud(messages::ImageCapture::Request& req, messages::ImageCapture::Response& res);
    void stitchClouds();
    void pairAlign();

    //Constants here

    //Variables here
    bool cloudProcessed;
    pcl::PointCloud mostRecentCloud;
    pcl::PointCloud scanResults;

    tf::StampedTransform mostRecentTransform;

    std::vector<pcl::PointCloud> cloudList;
    std::vector<Eigen::Matrix4f> cloudTransforms;


public:

    PCGenNode();
    


}