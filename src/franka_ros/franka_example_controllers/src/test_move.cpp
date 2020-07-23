#include <ros/ros.h>
#include <std_msgs/String.h>
#include <std_msgs/Float64MultiArray.h>
#include <stdlib.h>
#include <math.h>
#include <sensor_msgs/JointState.h>

class RobotArm
{

private:
    ros::NodeHandle nh_;
    std::vector<std::string> joint_names_;
    unsigned int num_joints_;
    double joint_move_dist_;
    std::string command_topic_;
    long counter = 0;
    std::array<double, 7> init_position{};
    ros::Publisher command_pub; 

public:

    // Initialize
    RobotArm(ros::NodeHandle nh, double joint_move_dist, std::string command_topic): nh_(nh), num_joints_(7), joint_move_dist_(joint_move_dist), command_topic_(command_topic_)
    {
	sensor_msgs::JointState joint_state_msg;

        if (command_topic.find("sim") != std::string::npos) {
	    for (size_t i = 0; i < 7; ++i) {
	        init_position[i] = 0.;
	    }
        } 
        else {
	    joint_state_msg  = *(ros::topic::waitForMessage<sensor_msgs::JointState>("/franka_state_controller/joint_states_desired",ros::Duration(10)));
	    for (size_t i = 0; i < 7; ++i) {
	        init_position[i] = joint_state_msg.position[i];
	    }
        }

	command_pub = nh_.advertise<std_msgs::Float64MultiArray>(command_topic, 1);
    }

    void sendStepCommand()
    {
        // calculate new joint angles
        std::vector<double> goal_position;
        //double delta_angle = joint_move_dist_/180.*M_PI * (std::sin(counter/1000.));
        double delta_angle = M_PI / 16 * (1 - std::cos(M_PI / 5.0 * counter/1000.)) * 0.2;
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
  double joint_move_dist = 5;
  ros::param::get("~joint_move_dist", joint_move_dist);
  ROS_INFO_STREAM("joint_move_dist: " << joint_move_dist << " degrees.");

  // Amount of movement in each joint
  std::string command_topic = "/joint_position_example_controller_sim/joint_command";
  ros::param::get("~command_topic", command_topic);
  ROS_INFO_STREAM("command_topic: " << command_topic);

  // create RobotArm object
  RobotArm arm(nh, joint_move_dist,command_topic);

  // loop infinitely with a fixed frequency and send our commands
  ros::Rate loop_rate(1000);
  while (ros::ok())
  {
      arm.sendStepCommand();
      loop_rate.sleep();
      ros::spinOnce();
  }

  return 0;
}



