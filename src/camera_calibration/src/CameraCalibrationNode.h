#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <vector> 
#include <opencv2/opencv.hpp>
#include <opencv2/core.hpp>
#include <opencv2/core/utility.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/calib3d.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <std_msgs/String.h>
#include <std_msgs/Float64MultiArray.h>
#include <messages/ImageCapture.h>
#include <tf/transform_listener.h>
#include <tf/transform_broadcaster.h>



class CameraCalibrationNode
{
private:

    //all subscribers here
    ros::NodeHandle nh;
    ros::Subscriber imageSub;



    //service advertisement
    ros::ServiceServer captureService;





    void cameraCallback(const sensor_msgs::ImageConstPtr& msg);

    bool captureImage(messages::ImageCapture::Request& req, messages::ImageCapture::Response& res);

    void calibrateCamera();

    void estimatePoses();
    void computeHandeyeTransform();

    //tf broadcasters and listeners here
    tf::TransformBroadcaster br;
    tf::Transform transform;
    tf::TransformListener listener;

    //all global class variables here
    cv::Mat cameraMatrix = cv::Mat::eye(3,3, CV_64F);
    std::vector<std::vector<cv::Point2f>> imagePoints;
    std::vector<std::vector<cv::Point3f>> objectPoints;

    int imagesTaken = 0;
    const int CALIB_IMAGES = 15;
    cv::Mat mostRecentImage;
    std::vector<cv::Mat> calibrationImages;

    std::vector<cv::Mat> endEffectorPosesR;
    std::vector<cv::Mat> endEffectorPosesT;
    std::vector<cv::Mat> cameraPosesR;
    std::vector<cv::Mat> cameraPosesT;

    bool alreadyProcessed;


public:

    CameraCalibrationNode();
    void broadcastTransform();
    void listenTransform();

};