#include <ros/ros.h>
#include <std_msgs/String.h>
#include <std_msgs/Float64MultiArray.h>
#include <stdlib.h>
#include <math.h>

class RobotArm
{

private:
    ros::NodeHandle nh_;
    std::vector<std::string> joint_names_;
    unsigned int num_joints_;
    double joint_move_dist_;
    int counter = 0;
    ros::Publisher command_pub = nh_.advertise<std_msgs::Float64MultiArray>("/joint_position_example_controller_sim/joint_command", 1000);
    std::vector<double> init_position = {0,-0.5,0,-2.5,0,2,0};
    std::vector<double> new_pos = {0.5,0,0,-1.6,0,1.6,0};
    std::vector<std::vector<double>> positionSet;
    
public:

    // Initialize
    RobotArm(ros::NodeHandle nh): nh_(nh)
    {

    }
    void jointSet()
    {
        
        std::vector<double> J1={-0.5,0,0,-0.8,0.7,1.5,0};
        positionSet.push_back(J1);
        std::vector<double> J2={0,0,0,-0.8,0,1.5,0};
         positionSet.push_back(J2);
        std::vector<double> J3={0.5,0,0,-0.8,-0.7,1.5,0};
         positionSet.push_back(J3);
        std::vector<double> J4={-0.5,-0.9,0,-1.5,0.7,1.2,0};
        positionSet.push_back(J4);
        std::vector<double> J5={0,-0.9,0,-1.5,0,1.2,0};
         positionSet.push_back(J5);
        std::vector<double> J6={0.5,-0.9,0,-1.5,-0.7,1.2,0};
         positionSet.push_back(J6);
        std::vector<double> J7={-0.5,0.5,0,-0.6,0.7,0.9,0};
        positionSet.push_back(J7);
        std::vector<double> J8={0,0.5,0,-0.6,0,0.9,0};
         positionSet.push_back(J8);
        std::vector<double> J9={0.5,0.5,0,-0.6,-0.7,0.9,0};
         positionSet.push_back(J9);
        

        
    }

    void sendStepCommand()
    {
      ros::Rate rate(1);
        //std::vector<double> jangle={0,1.2,0,0,0,0,0};
        // calculate new joint angles
        jointSet();
       for(int j=0;j<positionSet.size();j++)
       {
            std::vector<double> goal_position;
            for (size_t i = 0; i < 7; i++) 
            {
              goal_position.push_back(positionSet[j][i]);
              //goal_position.push_back(jangle[i]);       
            }

            // create message and publish it
            std_msgs::Float64MultiArray msg;
            msg.data.clear();
            msg.data.insert(msg.data.end(), goal_position.begin(), goal_position.end());
            command_pub.publish(msg);
            int num;
            //std::cin>>num;
            ros::spinOnce();
            ros::Duration(5.0).sleep();
       }

        
        
    }
};

int main(int argc, char** argv)
{
  // Init the ROS node
  ros::init(argc, argv, "simple_trajectory_player");
  ros::NodeHandle nh;

  // Amount of movement in each joint
  

  // create RobotArm object
  RobotArm arm(nh);

  // loop infinitely with a fixed frequency and send our commands
  //ros::Rate loop_rate(20);
  while (ros::ok())
  {
  ROS_INFO("new code works");
  arm.sendStepCommand();
  ros::shutdown();
  //loop_rate.sleep();
  //ros::spinOnce();
      
  }

  return 0;
}