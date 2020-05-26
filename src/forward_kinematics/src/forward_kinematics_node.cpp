#include <ros/ros.h>
#include <sensor_msgs/JointState.h>


void jointStateCallback(const sensor_msgs::JointState::ConstPtr& msg)
{
  for (size_t i = 0; i < msg->position.size(); i++)
  {
    std::cout << msg->position[i]*180.0/M_PI << " ";
  }
  std::cout << std::endl;
}

int main(int argc, char** argv)
{

  ros::init(argc, argv, "forward_kinematics_node");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("/joint_states", 1, jointStateCallback);
  ros::spin();

  return 0;
}