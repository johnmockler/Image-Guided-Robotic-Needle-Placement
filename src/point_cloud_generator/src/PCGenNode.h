#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <vector> 
//PCL Includes
//#include <pcl/memory.h>  // for pcl::make_shared
#include <pcl_conversions/pcl_conversions.h>
#include <tf_conversions/tf_eigen.h>

#include <boost/make_shared.hpp>

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
#include <pcl/visualization/cloud_viewer.h>
#include <pcl/common/common_headers.h>
#include <pcl/console/parse.h>


#include <messages/ImageCapture.h>
#include <tf/transform_listener.h>

//convenient typedefs
//typedef pcl::PointXYZ PointT;
//typedef pcl::PointCloud<PointT> PointCloud;


class PCGenNode
{
private:
    //ROS objects here
    ros::NodeHandle nh;
    ros::Subscriber cloudSub;
    ros::ServiceServer captureService;

    //Class Methods here
    void cloudCallback(const sensor_msgs::PointCloud2ConstPtr& cloud_msg);
    //need to add data type here
    void transformCallback();
    bool captureCloud(messages::ImageCapture::Request& req, messages::ImageCapture::Response& res);
    void stitchClouds();
    void pairAlign(const pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_src, const pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_tgt, pcl::PointCloud<pcl::PointXYZ>::Ptr output, Eigen::Matrix4f &final_transform);
    void listenTransform();
    void formatTransform(tf::StampedTransform tfTransform, Eigen::Matrix4f &eigenTransform);
    void registerModel();
    void pcViewer(const pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_src);




    //Constants here

    //Variables here
    bool cloudProcessed;
    pcl::PointCloud<pcl::PointXYZ>::Ptr  mostRecentCloud;
    pcl::PointCloud<pcl::PointXYZ>::Ptr scanResults;

    tf::StampedTransform mostRecentTransform;
    tf::TransformListener listener;

    std::vector<pcl::PointCloud<pcl::PointXYZ>::Ptr> cloudList;
    std::vector<Eigen::Matrix4f> cloudTransforms;


public:

    PCGenNode();
    


};