#include <ros/ros.h>

#include "CameraCalibrationNode.h"

int main(int argc, char **argv)
{
    ros::init(argc, argv, "camera_calibration");

    CameraCalibrationNode node;
    node.listenTransform();
    node.broadcastTransform();

    ROS_INFO("Calibration node initiated!");

    ros::spin();

    return EXIT_SUCCESS;

}