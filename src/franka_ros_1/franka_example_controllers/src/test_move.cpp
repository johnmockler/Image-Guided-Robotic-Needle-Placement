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
    
public:

    // Initialize
    RobotArm(ros::NodeHandle nh, double joint_move_dist): nh_(nh), num_joints_(7), joint_move_dist_(joint_move_dist)
    {

    }

    void sendStepCommand()
    {
        // calculate new joint angles
        std::vector<double> goal_position;
        double delta_angle = joint_move_dist_/180.*M_PI * (std::sin(counter/10.));
        for (size_t i = 0; i < 7; ++i) {
          if (i == 4) {
              goal_position.push_back(init_position[i] - delta_angle);
          } else {
              goal_position.push_back(init_position[i] + delta_angle);
          }
        }
        counter++;

        // create message and publish it
        std_msgs::Float64MultiArray msg;
        msg.data.clear();
        msg.data.insert(msg.data.end(), goal_position.begin(), goal_position.end());
        command_pub.publish(msg);

    }
};

int main(int argc, char** argv)
{
  // Init the ROS node
  ros::init(argc, argv, "simple_trajectory_player");
  ros::NodeHandle nh;

  // Amount of movement in each joint
  double joint_move_dist = 15.0;
  ros::param::get("~joint_move_dist", joint_move_dist);
  ROS_INFO_STREAM("joint_move_dist: " << joint_move_dist << " degrees.");

  // create RobotArm object
  RobotArm arm(nh, joint_move_dist);

  // loop infinitely with a fixed frequency and send our commands
  ros::Rate loop_rate(10);
  while (ros::ok())
  {
      arm.sendStepCommand();
      loop_rate.sleep();
      ros::spinOnce();
  }

  return 0;
}



