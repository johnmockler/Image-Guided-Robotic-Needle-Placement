#include <ros/ros.h>
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
    ros::NodeHandle n;
    ros::Publisher traj_pub= n.advertise<std_msgs::Float64MultiArray>("/joint_position_example_controller_sim/joint_command", 1000);
    ros::Publisher goal_pos_pub= n.advertise<std_msgs::Float64MultiArray>("/goal_position", 1000);
    ros::Subscriber jp_sub;
    int count=1;
    std::vector<float> init_position = {0,0,0,-0.08,0,0.0,0};


    public:

   TrajectoryPlanningCC(ros::NodeHandle nh):n(nh)
    {
        jointAngleSet.push_back(init_position);
        jp_sub= n.subscribe("/joint_AnglesIK", 1, &TrajectoryPlanningCC::angleCallback,this);

    }
    void angleCallback(const std_msgs::Float64MultiArray::ConstPtr& msg)
    {
        
        if(jointAngleSet.size()>30)
        {
            jointAngleSet.push_back(init_position);
            setAngles();
        }
        else if(jointAngleSet.size()<=30)
        {
            std::vector<float> jointAngle;
            for(int i=0;i<7;i++)
            {
                jointAngle.push_back(msg->data[i]);
                
            }
            jointAngleSet.push_back(jointAngle);
            
        } 
        
    }


     void setAngles()
    {
       Trajectory traj;
       for(int i=0;i<31;i++)
        {
            //std::cout<<"Set :"<<i<<std::endl;
            std::vector<std::vector<float>> trajectory = traj.computeTrajectory(jointAngleSet[i],jointAngleSet[i+1]);
            for(int j=0; j< trajectory[0].size(); j++)
            {
                std::vector<float> goal_position;
                for(int k=0; k<7; k++)
                {
                    goal_position.push_back(trajectory[k][j]);
                    //std::cout<<trajectory[k][j]<<" ";

                }
                //std::cout<<std::endl;
                std_msgs::Float64MultiArray msg;
                msg.data.clear();
                msg.data.insert(msg.data.end(), goal_position.begin(), goal_position.end());
                traj_pub.publish(msg);

            }


            std_msgs::Float64MultiArray msgs;
            msgs.data.clear();
            msgs.data.insert(msgs.data.end(), jointAngleSet[i+1].begin(), jointAngleSet[i+1].end());
            //msgs.data.insert(msgs.data.end(), jointAngleSet[i].begin(), jointAngleSet[i].end());
            //traj_pub.publish(msgs);
            goal_pos_pub.publish(msgs);
            ros::Duration(2).sleep();
        } 
        ros::shutdown();       

    }

};

int main(int argc, char** argv)
{

  ros::init(argc, argv, "trajectory_planning");
  ros::NodeHandle n;
  TrajectoryPlanningCC tpObj(n);
  ros::Rate loop(500);
  while(ros::ok())
  {
    ros::spinOnce();
    loop.sleep();
  }
  return 0;
}