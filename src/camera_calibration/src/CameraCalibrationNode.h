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

using namespace cv;
//using namespace std;

class CameraCalibrationNode
{
private:

    //all subscribers here
    ros::NodeHandle nh;
    ros::Subscriber imageSub;

    //service advertisement
    ros::ServiceServer captureService;

    // Additional constant for calibration
    const float calibrationSquareDimension = 0.01905f; //meters
    const Size chessboardDimension = Size(8,5);

    //Additional Function for camera calibration
    void createKnownBoardPosition(std::vector<Point3f>& corners);
    void getChessboardCorners(std::vector<Mat> images, std::vector<std::vector<Point2f>>& allFoundCorners);

    //
    void cameraCallback(const sensor_msgs::ImageConstPtr& msg);
    bool captureImage(messages::ImageCapture::Request& req, messages::ImageCapture::Response& res);
    void calibrateAndPoseEstimation();
    void computeHandeyeTransform();

    //tf broadcasters and listeners here
    tf::TransformBroadcaster br;
    tf::Transform transform;
    tf::TransformListener listener;

    //class variables
    cv::Mat cameraMatrix = cv::Mat::eye(3,3, CV_64F);
    cv::Mat distCoeffs = cv::Mat::zeros(8, 1, CV_64F);
    cv::Mat mostRecentImage;
    std::vector<cv::Mat> calibrationImages;


    std::vector<cv::Mat> endEffectorPosesR;
    std::vector<cv::Mat> endEffectorPosesT;
    std::vector<cv::Mat> cameraPosesR;
    std::vector<cv::Mat> cameraPosesT;

    bool alreadyCalibrated;


public:

    CameraCalibrationNode();
    void broadcastTransform();
    void listenTransform();

};