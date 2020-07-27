#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
 #include <pcl_ros/point_cloud.h>
#include <vector> 
//PCL Includes
//#include <pcl/memory.h>  // for pcl::make_shared
#include <pcl_conversions/pcl_conversions.h>
#include <tf_conversions/tf_eigen.h>
//#include <tf2_msgs/TFMessage.msg>

#include <messages/ImageCapture.h>
#include <tf/transform_listener.h>
#include <boost/make_shared.hpp>

#include <boost/thread/thread.hpp>

// PCL specific includes
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <pcl/point_representation.h>
#include <pcl/io/pcd_io.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/filters/filter.h>
#include <pcl/filters/uniform_sampling.h>
#include <pcl/filters/passthrough.h>
#include <pcl/filters/radius_outlier_removal.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/features/our_cvfh.h>
#include <pcl/features/crh.h>
#include <pcl/features/normal_3d_omp.h>
#include <pcl/features/shot_omp.h>
#include <pcl/features/board.h>
#include <pcl/features/normal_3d.h>
#include <pcl/features/fpfh.h>
#include <pcl/features/cvfh.h>
#include <pcl/features/range_image_border_extractor.h>
#include <pcl/kdtree/kdtree_flann.h>
#include <pcl/kdtree/impl/kdtree_flann.hpp>
#include <pcl/keypoints/narf_keypoint.h>
#include <pcl/keypoints/iss_3d.h>
#include <pcl/registration/icp.h>
#include <pcl/registration/icp_nl.h>
#include <pcl/features/integral_image_normal.h>
#include <pcl/features/shot.h>
#include <pcl/range_image/range_image_planar.h>
#include <pcl/recognition/cg/hough_3d.h>
#include <pcl/recognition/cg/geometric_consistency.h>
#include <pcl/recognition/hv/hv_go.h>
#include <pcl/registration/sample_consensus_prerejective.h>
#include <pcl/registration/ia_ransac.h>
#include <pcl/registration/transforms.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/visualization/cloud_viewer.h>
#include <pcl/visualization/range_image_visualizer.h>
#include <pcl/common/common_headers.h>
#include <pcl/console/parse.h>
#include <pcl/common/centroid.h>
#include <pcl/correspondence.h>
#include <pcl/common/transforms.h> 
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/segmentation/extract_polygonal_prism_data.h>
#include <pcl/surface/convex_hull.h>






class PCGenNode
{
private:
    struct MyCloud
    {
        pcl::PointCloud<pcl::PointXYZ> cloud; 
        tf::StampedTransform transform;

        MyCloud (pcl::PointCloud<pcl::PointXYZ>::Ptr cloud,
                    tf::StampedTransform  transform
                    ) :
            cloud (*cloud),
            transform (transform)
        {
        }
    };
    //ROS objects here
    ros::NodeHandle nh;
    ros::Subscriber cloudSub;
    ros::Publisher transformPub;


    ros::ServiceServer captureService;

    //Class Methods here
    void cloudCallback(const pcl::PointCloud<pcl::PointXYZ>::ConstPtr& msg);

    //need to add data type here
    void transformCallback();
    bool captureCloud(messages::ImageCapture::Request& req, messages::ImageCapture::Response& res);
    void stitchClouds();
    void pairAlign(const pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_src, const pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_tgt, pcl::PointCloud<pcl::PointXYZ>::Ptr output, Eigen::Matrix4f &final_transform);
    void formatTransform(tf::StampedTransform tfTransform, Eigen::Matrix4f &eigenTransform);


    void scaleCloud(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud, float scalingFactor=0.001);
    void processCloud(MyCloud inputCloud, pcl::PointCloud<pcl::PointXYZ>::Ptr outputCloud);
    void broadcastTransform();

    /**LOCAL PIPELINE FOR REGISTRATION**/
    void localRegistration(pcl::PointCloud<pcl::PointXYZ>::Ptr model ,pcl::PointCloud<pcl::PointXYZ>::Ptr scene);



    /**GLOBAL PIPELINE FOR REGISTRATION**/
    void globalRegistration(pcl::PointCloud<pcl::PointXYZ>::Ptr scene ,pcl::PointCloud<pcl::PointXYZ>::Ptr model);
    void computeDescriptors(pcl::PointCloud<pcl::PointXYZ>::Ptr scene, pcl::PointCloud<pcl::VFHSignature308>::Ptr& sceneDescriptors);
    void clusterAndPose(pcl::PointCloud<pcl::PointXYZ>::Ptr scene ,pcl::PointCloud<pcl::PointXYZ>::Ptr model,pcl::CorrespondencesPtr correspondences, bool verifyHypothesis );
    void keyPoints(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud,pcl::PointCloud<pcl::PointXYZ>::Ptr& keypoints);
    double computeCloudResolution(const pcl::PointCloud<pcl::PointXYZ>::ConstPtr& cloud);
    void hypotesisVerification(pcl::PointCloud<pcl::PointXYZ>::Ptr scene, std::vector<pcl::PointCloud<pcl::PointXYZ>::ConstPtr> registered_instances);



    //Constants here

    //Variables here
    bool cloudProcessed;
    bool modelRegistered;
    pcl::PointCloud<pcl::PointXYZ>::Ptr mostRecentCloud;
    pcl::PointCloud<pcl::PointXYZ>::Ptr scanResults;

    geometry_msgs::TransformStamped mostRecentTransform;
    tf::TransformListener listener;

    std::vector<MyCloud> cloudList;


    Eigen::Matrix4d handeye_transform;

    Eigen::Matrix4f modelTransform;

    /*
    std::vector<pcl::PointCloud<pcl::PointXYZ>::Ptr> cloudList;
    std::vector<Eigen::Matrix4f> cloudTransforms;
    */



public:

    PCGenNode();

};