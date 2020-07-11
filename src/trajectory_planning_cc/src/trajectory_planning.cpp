#include <ros/ros.h>
#include <vector>
#include <std_msgs/String.h>
#include <std_msgs/Float64MultiArray.h>
#include <stdlib.h>
#include <math.h>

class TrajectoryPlanningCC
{
    private:
    std::vector<std::vector<float>> jointAngleSet;
    ros::NodeHandle n;
    ros::Publisher traj_pub= n.advertise<std_msgs::Float64MultiArray>("/joint_position_example_controller_sim/joint_command", 1000);
    ros::Subscriber jp_sub;


    public:

    TrajectoryPlanningCC(ros::NodeHandle nh):n(nh)
    {
        

    }
    void angleCallback(const std_msgs::Float64MultiArray::ConstPtr& msg)
    {
        std::cout<<"entered callback"<<std::endl;
        if(jointAngleSet.size()>29)
        {
            setAngles();

        }
        else if(jointAngleSet.size()<=29)
        {
            std::vector<float> jointAngle;
            for(int i=0;i<7;i++)
           {
             jointAngle.push_back(msg->data[i]);
             std::cout<<"joint Angles :"<<jointAngle[i] <<std::endl;
            }
             jointAngleSet.push_back(jointAngle);
             std::cout<<"Joint set size :"<<jointAngleSet.size()<<std::endl;
        }
    
        
    }


     void setAngles()
    {
        
            std::cout<<"size of set achieved"<<std::endl;
            for(int i=0;i<30;i++)
           {
               std::cout<<"set :"<<i<<std::endl;
             std::vector<float> goal_position;
             for(int j=0;j<7;j++)
             {
                std::cout<<jointAngleSet[i][j]<<std::endl;
                goal_position.push_back(jointAngleSet[i][j]);
                
             }
             std_msgs::Float64MultiArray msg;
             msg.data.clear();
             msg.data.insert(msg.data.end(), goal_position.begin(), goal_position.end());
             traj_pub.publish(msg);

             ros::Duration(5.0).sleep();
           }        

    }
    void setFlow()
    {
        std::cout<<"entered flow"<<std::endl;
        if(jointAngleSet.size()>29)
        {
             std::cout<<"entered if"<<std::endl;
            setAngles();

        }
        else if(jointAngleSet.size()<=29)
        {
            jp_sub= n.subscribe("/joint_AnglesIK", 1, &TrajectoryPlanningCC::angleCallback,this);
            
        }
        
        
    }

};

int main(int argc, char** argv)
{

  ros::init(argc, argv, "trajectory_planning");
  ros::NodeHandle n;
  TrajectoryPlanningCC tpObj(n);
  tpObj.setFlow();
  ros::spin();
  
  return 0;
}