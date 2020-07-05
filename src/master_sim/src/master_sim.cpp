#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <std_msgs/String.h>
#include <std_msgs/Float64MultiArray.h>
#include <messages/ImageCapture.h>
#include <math.h>


class MasterSim
{
private:
  ros::NodeHandle nh;
  std::vector<std::string> joint_names_;
  ros::Subscriber jointSubscriber;
  ros::ServiceClient client;
  messages::ImageCapture srv;
  std::vector<std::vector<double>> positionSet;
  double currentPos[7]={0};
  int count = 0;
  double error;

public:
MasterSim(ros::NodeHandle n):nh(n)
{
  jointSet();
  jointSubscriber = nh.subscribe("/joint_states",10,&MasterSim::checkPosition,this);
  client = nh.serviceClient<messages::ImageCapture>("capture_image",this);
  ROS_INFO("sUSCRIBED"); 
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

void checkPosition(const sensor_msgs::JointStateConstPtr& msg)
{
  ROS_INFO("In sub callback");
  for(int i =0;i<7;i++)
  {
  currentPos[i] = msg->position[i];
  }
}

void calibrate()
{
  ROS_INFO("In Calibrate() within mastersim");

  count++;
  error = 0.0;
  bool reached = false;
  if(count <= positionSet.size())
  {
    ROS_INFO("In IF");
    while(!reached)
    {
      
      //ROS_INFO("In while");
      //ros::spin();
      for(int i  = 0;i<7;i++)
      {
        int temp = currentPos[i]- positionSet[count][i];
        error = error + std::pow(temp,2.0);
        //ROS_INFO("In error calc");
      }
      error = std::sqrt(error);
      if(error <0.01 )
      {
        ROS_INFO("Bot Reached position");
        srv.request.x = false;
        while(!client.call(srv))
        {
          ROS_INFO("Waiting on response");
        }
      reached = true;

      }
      //ros::Rate r(10);
      //ros::spin();
    }
  }
  else
  {
    ROS_INFO("Calibration Done");
    ros::shutdown();
  }
}

void run()
{
  while(ros::ok())
  {
    ROS_INFO("Entered run()");
    calibrate();
  }
}

};

int main(int argc, char** argv)
{

  ros::init(argc, argv, "master_sim");
  ROS_INFO("Master Sim node initiated"); 
  ros::NodeHandle n;
  MasterSim obj(n);
  obj.run();
  ros::Rate r(10);
  



 ros::spin();

  return 0;
}