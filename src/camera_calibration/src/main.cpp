#include <ros/ros.h>

#include "CameraCalibrationNode.h"

int main(int argc, char **argv)
{
    ros::init(argc, argv, "camera_calibration");

    CameraCalibrationNode node;
    //node.listenTransform();
    node.broadcastTransform();

    ROS_INFO("Calibration node initiated!");
    /*
    while(ros::ok())
    {
        if(node.alreadyHandEyeCalibrated == true)
        {
            node.broadcastTransform();

        }
    
        ros::spinOnce();

    }
    */

    ros::spin();

    return EXIT_SUCCESS;

}