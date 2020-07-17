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
    std::vector <float> Bvec = {0.560,0.560,0.560,0.560,0.560,0.400,0.400,0.400,0.400,0.400,0.240,0.240,0.240,0.240,0.240};
    std::vector <float> Avec = {0.160,0.080,0.0,-0.080,-0.160,0.160,0.080,0.0,-0.080,-0.160,0.160,0.080,0.0,-0.080,-0.160};
    //std::vector <float> Avec = {0.0,0.080,0.160};
    //std::vector <float> Bvec = {0.560,0.560,0.560};
    std::vector <float> Cvec = {0.450, 0.400};
    ros::NodeHandle n;
    ros::Subscriber inverseSubscriber;
    ros::Publisher cordinate_pub = n.advertise<std_msgs::Float64MultiArray>("/target_Cordinate", 1000);
    ros::Publisher angles_pub = n.advertise<std_msgs::Float64MultiArray>("/joint_position_example_controller_sim/joint_command", 1000);

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

                std_msgs::Float64MultiArray msg;
                msg.data.clear();
                msg.data.insert(msg.data.end(), cord.begin(), cord.end());
                ros::Duration(0.2).sleep();
                cordinate_pub.publish(msg);
                
                
            }
        }
        
    }
    void TargetAngCallback(const std_msgs::Float64MultiArray::ConstPtr& msg)
    {
        //std::cout<<"entered call back"<<std::endl;
        std::vector<float> jointAngle;
        for(int i=0;i<7;i++)
        {
            jointAngle.push_back(msg->data[i]);
            //std::cout<<"joint Angles :"<<jointAngle[i] <<std::endl;

        }
        jointAngleSet.push_back(jointAngle);
        
    }
    void executePP()
    {

        //std::cout<<"PP entered"<<std::endl;
        for(int i=0;i<30;i++)
        {
            std::vector<float> goal_position;
            for(int j=0;j<7;j++)
            {
                //std::cout<<"goal pos :"<<jointAngleSet[i][j]<<std::endl;
                goal_position.push_back(jointAngleSet[i][j]);
                

            }
            std_msgs::Float64MultiArray msg;
            msg.data.clear();
            msg.data.insert(msg.data.end(), goal_position.begin(), goal_position.end());
            angles_pub.publish(msg);
            //ros::Duration(5.0).sleep();

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