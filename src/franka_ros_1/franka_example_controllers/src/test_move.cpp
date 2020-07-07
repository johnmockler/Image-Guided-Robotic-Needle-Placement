#include <ros/ros.h>
#include <std_msgs/String.h>
#include <std_msgs/Float64MultiArray.h>
#include <stdlib.h>
#include <math.h>

class RobotArm
{

private:
    ros::NodeHandle nh_;
    std::vector<std::vector<float>> jointAngleSet;
    std::vector<std::string> joint_names_;
    unsigned int num_joints_;
    double joint_move_dist_;
    int counter = 0;
    ros::Subscriber inSub;
    ros::Publisher command_pub = nh_.advertise<std_msgs::Float64MultiArray>("/joint_position_example_controller_sim/joint_command", 1000);
    std::vector<double> init_position = {0,-0.5,0,-2.5,0,2,0};
    
public:

    // Initialize
    RobotArm(ros::NodeHandle nh, double joint_move_dist): nh_(nh), num_joints_(7), joint_move_dist_(joint_move_dist),inSub(nh_.subscribe("/joint_AnglesIK", 1, &RobotArm::AngleCallback,this))
    {

    }
    void AngleCallback(const std_msgs::Float64MultiArray::ConstPtr& msg)
    {
        std::cout<<"entered call back"<<std::endl;
        std::vector<float> jointAngle;
        for(int i=0;i<7;i++)
        {
            jointAngle.push_back(msg->data[i]);
            std::cout<<"joint Angles :"<<jointAngle[i] <<std::endl;

        }
        jointAngleSet.push_back(jointAngle);

    }

    void sendStepCommand()
    {
        if(jointAngleSet.size()>29)
        {
            for(int i=0;i<30;i++)
           {
             std::vector<float> goal_position;
             for(int j=0;j<7;j++)
             {
                std::cout<<"goal pos :"<<jointAngleSet[i][j]<<std::endl;
                goal_position.push_back(jointAngleSet[i][j]);
                

             }
             std_msgs::Float64MultiArray msg;
             msg.data.clear();
             msg.data.insert(msg.data.end(), goal_position.begin(), goal_position.end());
             command_pub.publish(msg);

             ros::Duration(5.0).sleep();
           }

        }
 // create message and publish it
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



