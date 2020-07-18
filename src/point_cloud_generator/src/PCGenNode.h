#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <vector> 
//PCL Includes
//#include <pcl/memory.h>  // for pcl::make_shared
#include <pcl_conversions/pcl_conversions.h>
#include <tf_conversions/tf_eigen.h>

#include <boost/make_shared.hpp>

// PCL specific includes
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

//Asan Added
#include <pcl/filters/radius_outlier_removal.h>
#include <pcl/io/pcd_io.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/surface/convex_hull.h>
#include <pcl/segmentation/extract_polygonal_prism_data.h>
#include <pcl/visualization/cloud_viewer.h>

#include <pcl/io/pcd_io.h>
#include <pcl/features/normal_3d.h>
#include <pcl/features/our_cvfh.h>
#include <pcl/visualization/histogram_visualizer.h>
#include <pcl/visualization/pcl_plotter.h>
#include <pcl/common/centroid.h>
#include <pcl/features/crh.h>
#include <pcl/io/pcd_io.h>

#include <pcl/features/shot.h>
#include <pcl/registration/sample_consensus_prerejective.h>

#include <pcl/io/pcd_io.h>
#include <pcl/point_cloud.h>
#include <pcl/correspondence.h>
#include <pcl/features/normal_3d_omp.h>
#include <pcl/features/shot_omp.h>
#include <pcl/features/board.h>
#include <pcl/filters/uniform_sampling.h>
#include <pcl/recognition/cg/hough_3d.h>
#include <pcl/recognition/cg/geometric_consistency.h>
#include <pcl/recognition/hv/hv_go.h>
#include <pcl/registration/icp.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/kdtree/kdtree_flann.h>
#include <pcl/kdtree/impl/kdtree_flann.hpp>
#include <pcl/common/transforms.h> 
#include <pcl/console/parse.h>

// Features extracting
#include <pcl/features/integral_image_normal.h>
#include <boost/thread/thread.hpp>


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
    void formatTransform(tf::StampedTransform tfTransform, Eigen::Matrix4f &eigenTransform);
    void registerModel(const pcl::PointCloud<pcl::PointXYZ>::Ptr cloud,   const pcl::PointCloud<pcl::PointXYZ>::Ptr modelSkeleton);
 
    void scaleCloud(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud, float scalingFactor=0.001);

    void localRegistration(pcl::PointCloud<pcl::PointXYZ>::Ptr model ,pcl::PointCloud<pcl::PointXYZ>::Ptr scene);

    void computeSurfaceNormals(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud, pcl::PointCloud<pcl::Normal>::Ptr normals);
    void computeLocalFeatures(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud,pcl::PointCloud<pcl::Normal>::Ptr normals, pcl::PointCloud<pcl::FPFHSignature33>::Ptr features);
    void alignTemplate(pcl::PointCloud<pcl::PointXYZ>::Ptr input_cloud, pcl::PointCloud<pcl::PointXYZ>::Ptr model_cloud);



    //Constants here

    //Variables here
    bool cloudProcessed;
    pcl::PointCloud<pcl::PointXYZ>::Ptr mostRecentCloud;
    pcl::PointCloud<pcl::PointXYZ>::Ptr scanResults;

    tf::StampedTransform mostRecentTransform;
    tf::TransformListener listener;

    std::vector<pcl::PointCloud<pcl::PointXYZ>::Ptr> cloudList;
    std::vector<Eigen::Matrix4f> cloudTransforms;






public:

    PCGenNode();
    


};