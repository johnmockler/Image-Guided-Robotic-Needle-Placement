#include <ros/ros.h>

#include "CameraCalibrationNode.h"

int main(int argc, char **argv)
{
    ros::init(argc, argv, "camera_calibration");

    CameraCalibrationNode node;
    
    ROS_INFO("Calibration node initiated!");
    
    while(ros::ok())
    {
        if(node.alreadyHandEyeCalibrated == true)
        {
            node.listenTransform();
            node.broadcastTransform();
        }
        ros::spinOnce();
    }

    return EXIT_SUCCESS;

}