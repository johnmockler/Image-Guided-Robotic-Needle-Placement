#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <vector>
#include <std_msgs/String.h>
#include <std_msgs/Float64MultiArray.h>
#include <stdlib.h>
#include <math.h>

class PathPlanningCC
{
    private:

    std::vector<std::vector<float>> jointAngleSet;
    //std::vector <float> Bvec = {0.560,0.560,0.560,0.560,0.560,0.400,0.400,0.400,0.400,0.400,0.240,0.240,0.240,0.240,0.240};
    //std::vector <float> Avec = {0.160,0.080,0.0,-0.080,-0.160,-0.160,-0.080,0.0,0.080,0.160,0.160,0.080,0.0,-0.080,-0.160};
    std::vector <float> Avec = {0.0,0.0,-0.080,-0.160};
    std::vector <float> Bvec = {0.560,0.560,0.560,0.560};
    std::vector <float> Cvec = {0.400};
    ros::NodeHandle n;
    ros::Subscriber inverseSubscriber;
    ros::Publisher cordinate_pub = n.advertise<std_msgs::Float64MultiArray>("/target_Cordinate", 1000);
    ros::Publisher type_pub = n.advertise<std_msgs::String>("/execution_type", 1000);

    public:

    PathPlanningCC(ros::NodeHandle nh): n(nh)
    {

    }
    void getJointAngles()
    {
        
        for(int i=0;i<Cvec.size();i++)
        {
            for(int j=0;j<Avec.size();j++)
            {
                std::vector<float> cord;
                cord.push_back(Avec[j]);
                cord.push_back(Bvec[j]);
                cord.push_back(Cvec[i]);
                
                std_msgs::String id;
                std::stringstream ss;
                ss<<"camCalib";
                id.data = ss.str();
                type_pub.publish(id);

                std_msgs::Float64MultiArray msg;
                msg.data.clear();
                msg.data.insert(msg.data.end(), cord.begin(), cord.end());
                ros::Duration(0.3).sleep();
                cordinate_pub.publish(msg);
                
                
            }
        }
        
    }

};

int main(int argc, char** argv)
{

  ros::init(argc, argv, "pathP_CC");
  ros::NodeHandle n;
  PathPlanningCC obj(n);
  ros::Rate loop_rate(10);
  while (ros::ok())
  {
      obj.getJointAngles();
      loop_rate.sleep();
      ros::spinOnce();
  } 
  return 0;
}