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
#include <fstream>

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
    const float calibrationSquareDimension = 0.04f; //meters
    const Size chessboardDimension = Size(8,5);

    //Additional Function for camera calibration
    void createKnownBoardPosition(std::vector<Point3f>& corners);
    void getChessboardCorners(std::vector<Mat> images, std::vector<std::vector<Point2f>>& allFoundCorners);

    Mat homogeneousInverse(const Mat& T);
    void calibrateHandEyeQR24(std::vector<Mat>& Hg, const std::vector<Mat>& Hc, Mat& R_cam2gripper, Mat& t_cam2gripper);
    void calibrateHandEye(InputArrayOfArrays R_gripper2base, InputArrayOfArrays t_gripper2base, InputArrayOfArrays R_target2cam, InputArrayOfArrays t_target2cam, OutputArray R_cam2gripper, OutputArray t_cam2gripper);
    //
    void cameraCallback(const sensor_msgs::ImageConstPtr& msg);
    bool captureImage(messages::ImageCapture::Request& req, messages::ImageCapture::Response& res);
    void calibrateAndPoseEstimation();
    void computeHandeyeTransform();
    void readTextFiles();

    //baseline methods
    void calibrateHandEyeTsai(const std::vector<Mat>& Hg, const std::vector<Mat>& Hc, Mat& R_cam2gripper, Mat& t_cam2gripper);
    Mat rot2quatMinimal(const Mat& R);
    Mat rot2quat(const Mat& R);
    Mat skew(const Mat& v);
    Mat quatMinimal2rot(const Mat& q);



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
    cv::Mat cameraPosesR;
    cv::Mat cameraPosesT;

    std::vector<Mat> Trpose, Rrpose, Tmpose, Rmpose;


    bool alreadyCalibrated;


public:

    CameraCalibrationNode();
    void broadcastTransform();
    void listenTransform();

};