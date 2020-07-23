#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <vector>
#include <std_msgs/String.h>
#include <std_msgs/Float64MultiArray.h>
#include <stdlib.h>
#include <math.h>
#include "trajectory.h"

class TrajectoryPlanningCC
{
    private:
    std::vector<std::vector<float>> jointAngleSet;
    std::vector<float> jointStates;
    int pos=0;
    int setSize;
    ros::NodeHandle n;
    ros::Publisher traj_pub= n.advertise<std_msgs::Float64MultiArray>("/joint_position_example_controller/joint_command", 1000);
    ros::Publisher goal_pos_pub= n.advertise<std_msgs::Float64MultiArray>("/goal_position", 1000);
    ros::Subscriber jp_sub;
    ros::Subscriber js_sub;
    int count=1;
    std::vector<float> init_position = {0,0,0,-0.08,0,0.0,0};


    public:

   TrajectoryPlanningCC():n()
   ,js_sub(n.subscribe("/joint_states", 1, &TrajectoryPlanningCC::jointStateCallback,this))
   ,jp_sub( n.subscribe("/joint_AnglesIK", 1, &TrajectoryPlanningCC::angleCallback,this))
   ,setSize(0)
    {
        updateParam();
        
        
    }
    void angleCallback(const std_msgs::Float64MultiArray::ConstPtr& msg)
    {       
        if(jointAngleSet.size()>setSize)
        {
            jointAngleSet.push_back(init_position);
            setAngles();
        }
        else if(jointAngleSet.size()<=setSize)
        {
            
            std::vector<float> jointAngle;
            for(int i=0;i<7;i++)
            {
                jointAngle.push_back(msg->data[i]);                           
            }
            //std::cout<<jointAngle[0]<<" "<<jointAngle[1]<<" "<<jointAngle[2]<<" "<<jointAngle[3]<<" "<<jointAngle[4]<<" "<<jointAngle[5]<<" "<<jointAngle[6]<<std::endl;
            jointAngleSet.push_back(jointAngle);       
            
        } 
        
    }
    void jointStateCallback(const sensor_msgs::JointState::ConstPtr& msg)
    {
        jointStates.clear();
        for (size_t i = 0; i < msg->position.size(); i++)
        {
            jointStates.push_back(msg->position[i]);
            if(jointStates[i] >-0.001 && jointStates[i] < 0.001)
            {
                jointStates[i]=0.0;
            }
            //std::cout<<"joint state"<<jointStates[i]<<std::endl;
        }
            
    }

     void setAngles()
    {
       Trajectory traj;
       if(pos<jointAngleSet.size())
        {
           // std::cout<<"Set Time :"<<ros::Time::now().toSec()<<std::endl;
           //std::cout<<"Set :"<<i<<std::endl;
            std::vector<std::vector<float>> trajectory = traj.computeTrajectory(jointStates,jointAngleSet[pos]);
            for(int j=0; j< trajectory[0].size(); j++)
            {
                std::vector<float> goal_position;
                ros::Rate loop_rate(1000);
                bool launch=true;
                while (launch)
                {
                    for(int k=0; k<7; k++)
                    {
                    goal_position.push_back(trajectory[k][j]);
                    
                    }
              
                    std_msgs::Float64MultiArray msg;
                    msg.data.clear();
                    msg.data.insert(msg.data.end(), goal_position.begin(), goal_position.end());
                    traj_pub.publish(msg);
                    loop_rate.sleep();
                   // double time = ros::Time::now().toSec();
                    //std::cout<<"Time :"<<time<<std::endl;
                    launch=false;

                }
                

            }
            //std::cout<<"Set Time :"<<ros::Time::now().toSec()<<std::endl;

            std_msgs::Float64MultiArray msgs;
            msgs.data.clear();
            msgs.data.insert(msgs.data.end(), jointAngleSet[pos].begin(), jointAngleSet[pos].end());
            //msgs.data.insert(msgs.data.end(), jointAngleSet[i].begin(), jointAngleSet[i].end());
            //traj_pub.publish(msgs);
            goal_pos_pub.publish(msgs);
            ros::Duration(1).sleep();
            pos++;
        } 
        else
        {
            ros::shutdown();   
        
        }
                  

    }
    void updateParam(void)
    {
        n.param<int>("/trajectory_planning/setSize",setSize,2);
    }
    void spin()
    {
       

    }


};

int main(int argc, char** argv)
{

  ros::init(argc, argv, "trajectory_planning");

  TrajectoryPlanningCC tpObj;
   ros::Rate loop_rate(10);
    while (ros::ok())
  {
      ros::spinOnce();
      tpObj.spin();
      loop_rate.sleep();
      
  } 
 
  return 0;
}