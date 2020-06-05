#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <vector> 
#include <opencv2/opencv.hpp>
#include <cv_bridge/cv_bridge.h>
#include <std_msgs/String.h>
#include <std_msgs/Float64MultiArray.h>


class CameraCalibrationNode
{
private:

    //all subscribers here
    ros::NodeHandle nh;
    ros::Subscriber imageSub;

    //all global class variables here
    cv::Mat cameraMatrix;
    std::vector<std::vector<cv::Point2f>> imagePoints;
    std::vector<std::vector<cv::Point3f>> objectPoints;


    void cameraCallback(const sensor_msgs::ImageConstPtr& msg);

public:

    CameraCalibrationNode();

};