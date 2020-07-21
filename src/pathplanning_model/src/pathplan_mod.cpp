#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <std_msgs/String.h>
#include <std_msgs/Float64MultiArray.h>
#include <vector>
#include <stdlib.h>
#include <math.h>

class PathPlanningM
{
    private:

    std::vector<std::vector<float>> jointAngleSet;
    //std::vector <float> Avec = {0.400,0.400,0.0,-0.400,-0.400,-0.400,-0.400,-0.400,-0.400,0.0,0.400,0.400,0.400};
    //std::vector <float> Bvec = {0.500,0.150};
    //std::vector <float> Cvec = {0.300,0.500,0.500,0.500,0.300,0.500,0.500,0.300,0.500,0.500,0.500,0.300,0.500};
    std::vector <float> Avec = {0.0,0.0,0.200,0.400,0.400};
    std::vector <float> Bvec = {0.250,0.500,0.500,0.500,0.500};
    std::vector <float> Cvec = {0.500,0.500,0.500,0.500,0.300};
    ros::NodeHandle n;
    ros::Subscriber inverseSubscriber;
    ros::Publisher cordinate_pub = n.advertise<std_msgs::Float64MultiArray>("/target_Cordinate", 1000);
    ros::Publisher type_pub = n.advertise<std_msgs::String>("/execution_type", 1000);

    public:

    PathPlanningM(ros::NodeHandle nh): n(nh)
    {

    }
    void getJointAngles()
    {
        //std::cout<<"entered get joint Angles"<<std::endl;
        //for(int i=0;i<Bvec.size();i++)
        //{
            for(int j=0;j<Avec.size();j++)
            {
                std::vector<float> cord;
                cord.push_back(Avec[j]);
                cord.push_back(Bvec[j]);
                cord.push_back(Cvec[j]);

                std_msgs::String id;
                std::stringstream ss;
                ss<<"modScan";
                id.data = ss.str();
                type_pub.publish(id);

                std_msgs::Float64MultiArray msg;
                msg.data.clear();
                msg.data.insert(msg.data.end(), cord.begin(), cord.end());
                cordinate_pub.publish(msg);
                ros::Duration(0.2).sleep();
                
            }
       // }
  
    }

};

int main(int argc, char** argv)
{

  ros::init(argc, argv, "pathplan_mod");
  ros::NodeHandle n;
  PathPlanningM obj(n);
  ros::Rate loop_rate(10);
  while (ros::ok())
  {
      obj.getJointAngles();
      loop_rate.sleep();
      ros::spinOnce();
  } 
  return 0;
}