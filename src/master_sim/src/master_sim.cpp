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
  //ros::ServiceClient *clientPtr;
  //messages::ImageCapture srv;
  std::vector<std::vector<double>> positionSet;
  double currentPos[7]={0};
  int count = 1;
  bool reached = false;
  double error;
  bool imagesCollected = false;

public:
MasterSim(ros::NodeHandle n):nh(n)
{
  jointSet();
  jointSubscriber = nh.subscribe("/joint_states",10,&MasterSim::checkPosition,this);
  //client = nh.serviceClient<messages::ImageCapture>("capture_image",this);
  //clientPtr = &client;
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
  //ros::ServiceClient client = (ros::ServiceClient)*clientPtr;
  
  if(count < positionSet.size())
  {
    error = 0.0;
    for(int i =0;i<7;i++)
    {
    currentPos[i] = msg->position[i];
    double temp = currentPos[i]- positionSet[count][i];
    std::cout<<"posSet: "<<positionSet[count][i]<<"         currentPos: "<<currentPos[i]<<std::endl;
    error = error + std::pow(temp,2);
    
    }
    
    error = std::sqrt(error);
    ROS_INFO("Count inside: %ld; Error: %f",count,error);
    if(error < 0.01)
    {
      reached = true;
      //count++;
      //ros::Duration(3.0).sleep();
    }
    else
    {
      reached = false;
    }

  }
  else
  {
    imagesCollected = true;
  }




}

void setCount(bool var)
{
  
  if(var)
    {
      count++;
      reached = false;
      ROS_INFO("Count: %ld",count);
    }
}


bool getStatus()
{
  return reached;
}

bool getImagesCollected()
{
  return imagesCollected;
}

};


int main(int argc, char** argv)
{

  ros::init(argc, argv, "master_sim");
  ROS_INFO("Master Sim node initiated"); 
  ros::NodeHandle n;
  ros::NodeHandle ns;
  ros::ServiceClient client = ns.serviceClient<messages::ImageCapture>("capture_image");
  messages::ImageCapture srv;
  MasterSim obj(n);
  //obj.run();
  ros::Rate r(2);
  while(ros::ok())
  {
    if(!obj.getStatus() && !obj.getImagesCollected())
    {
      ros::spinOnce();
      r.sleep();
    }
    else if(obj.getStatus() && !obj.getImagesCollected()) 
    {
      //bool result = calibrate();
      bool result;
      ROS_INFO("Bot Reached position");
      srv.request.x = false;
      if(client.call(srv))
        {
          //count++;
          ROS_INFO("Got response");
          result = true;
        }
      else
        {
          ROS_INFO("Got no response"); 
          result = false;
        }
      obj.setCount(result);
    }
    else
    {
      
      srv.request.x = true;
      if(client.call(srv))
      {
        ROS_INFO("Calibration Done");
      }
      else
      {
        ROS_INFO("Calibration Failed");
      }
      ros::shutdown(); 
    }

    //r.sleep();
  }
  return 0;
}

