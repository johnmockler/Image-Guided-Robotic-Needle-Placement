#include <ros/ros.h>

#include "PCGenNode.h"

int main(int argc, char **argv)
{
    ros::init(argc, argv, "point_cloud_generator");

    PCGenNode node;
    //node.listenTransform();


    ROS_INFO("Point Cloud Generator node initiated!");
    
    while(ros::ok())
    {
        node.broadcastTransform();
        ros::spinOnce();
    }


    return EXIT_SUCCESS;

}