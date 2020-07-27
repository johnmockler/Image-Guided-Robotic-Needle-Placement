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
  ros::Subscriber goalSubscriber;
  ros::ServiceClient client;
  //ros::ServiceClient *clientPtr;
  //messages::ImageCapture srv;
  std::vector<std::vector<double>> positionSet;
  double currentPos[7]={0};
  double goalPos[7];
  double pastGoalPos[7];
  int count = 0; //was 1 previously
  bool reached = false;
  double error;
  bool imagesCollected = false;
  bool goalPosRecorded = false;
  int clickCount = 0;
  std::vector<std::vector<float>> jointAngleSet;

public:
MasterSim(ros::NodeHandle n):nh(n)
{
  jointSet();
  goalSubscriber =  nh.subscribe("/joint_AnglesIK", 1, &MasterSim::angleCallback,this);
  jointSubscriber = nh.subscribe("/joint_states",1,&MasterSim::checkPosition,this);
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

void angleCallback(const std_msgs::Float64MultiArray::ConstPtr& msg)
  {
        
        if(jointAngleSet.size()>=16)
        {
            //jointAngleSet.push_back(init_position);
            //setAngles();
          ROS_INFO("All goal pos recieved.");
          goalSubscriber.shutdown();
        }
        else if(jointAngleSet.size()<=15)
        {
            //std::cout<<"Set :"<<std::endl;
            std::vector<float> jointAngle;
            for(int i=0;i<7;i++)
            {
                jointAngle.push_back(msg->data[i]);
                //std::cout<<jointAngle[i]<<std::endl;
                            
            }
            jointAngleSet.push_back(jointAngle);       
            
        } 
        
    }

void checkPosition(const sensor_msgs::JointStateConstPtr& msg)
{
  //ROS_INFO("In sub callback");
  //ros::ServiceClient client = (ros::ServiceClient)*clientPtr;
  if(jointAngleSet.size() == 16)
  {
    if(count < jointAngleSet.size())
    {
      error = 0.0;
      for(int i =0;i<7;i++)
      {
      currentPos[i] = msg->position[i];
      double temp = currentPos[i]- jointAngleSet[count][i];
      //std::cout<<"posSet: "<<jointAngleSet[count][i]<<"         currentPos: "<<currentPos[i]<<std::endl;
      error = error + std::pow(temp,2);
      }
      error = std::sqrt(error);
      //ROS_INFO("Count inside: %ld; Error: %f",count,error);
      if(error < 0.005)
      {
        
        if((count != 0) && (count %2 == 0))
        {
          reached = true;
        }
        count++;
        //ros::Duration(3.0).sleep();
      }
      else
      {
        
        reached = false;
      }

    }
    else
    {
      ROS_INFO("In sub callback");
      imagesCollected = true;
    }
}
}

void setCount(bool var)
{
  
  if(var)
    {
      clickCount++;
      reached = false;
      ROS_INFO("Click Count: %ld",clickCount);
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

int getCount()
{
  return count;
}


};



int main(int argc, char** argv)
{

  ros::init(argc, argv, "master_sim");
  ROS_INFO("Master Sim node initiated"); 
  ros::NodeHandle n;
  ros::NodeHandle ns;
  ros::ServiceClient client = ns.serviceClient<messages::ImageCapture>("capture_cloud");
  messages::ImageCapture srv;
  MasterSim obj(n);
  //obj.run();
  ros::Rate r(10);
  while(ros::ok())
  {
    if(!obj.getStatus() && !obj.getImagesCollected())
    {
      ros::spinOnce();
      //r.sleep();
    }
    else if(obj.getStatus() && !obj.getImagesCollected()) 
    {
      //bool result = calibrate();
      bool result;
      ROS_INFO("Bot Reached position");
      //int temp = obj.getCount();
      //if(temp%2 != 0)
      //{
        srv.request.x = false;
        //ros::Duration(1).sleep();
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
      //}
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