#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <vector>
#include <cv_bridge/cv_bridge.h>
#include "opencv2/opencv.hpp"
#include <opencv2/core/mat.hpp>
#include <std_msgs/String.h>
#include <std_msgs/Float64MultiArray.h>
#include <stdlib.h>
#include <math.h>
#include <tf/transform_listener.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/Point.h>

class PathPlanningCC
{
    private:
    std::vector<std::vector<float>> jointAngleSet;
    std::vector<float> A = {};
    std::vector<float> B = {};
    std::vector<float> C = {};
    ros::NodeHandle n;
    ros::Publisher cordinate_pub = n.advertise<std_msgs::Float64MultiArray>("/target_Cordinate", 1000);
    ros::Publisher angles_pub = n.advertise<std_msgs::Float64MultiArray>("/joint_position_example_controller_sim/joint_command", 1000);




    public:
    PathPlanningCC()
    {

    }
    void getJointAngles()
    {
        for(int i=0.0;i<2;i++)
        {
            for(int j=0.0;j<15;j++)
            {
                std::vector<float> cord;
                cord.push_back(A(j));
                cord.push_back(B(j));
                cord.push_back(C(i));

                std_msgs::Float64MultiArray msg;
                msg.data.clear();
                msg.data.insert(msg.data.end(), cord.begin(), cord.end());
                cordinate_pub.publish(msg);

                ros::Subscriber sub = nh.subscribe("/joint_AnglesIK", 1, TargetAngCallback);
            }
        }


    }
    void TargetAngCallback(const std_msgs::Float64MultiArray::ConstPtr& msg)
    {
        std::vector<float> jointAngle;
        for(int i=0;i<7;i++)
        {
            jointAngle.push_back(msg.dat(i))

        }
        jointAngleSet.push_back(jointAngle);
    }
    void executePP()
    {
        std::vector<float> ja;
        for(int i=0;i<jointAngleSet.size();i++)
        {
            ja=jointAngleSet(i);


        }

    }

};

int main(int argc, char** argv)
{

  ros::init(argc, argv, "pathPlanning_CameraCalib");
  ros::NodeHandle n;
  PathPlanningCC obj;
  obj.getJointAngles();

  ros::spinOnce();

  return 0;
}