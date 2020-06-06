#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <vector>
#include <cv_bridge/cv_bridge.h>
#include "opencv2/opencv.hpp"
#include <opencv2/core/mat.hpp>
#include <std_msgs/String.h>
#include <std_msgs/Float64MultiArray.h>
#include <stdlib.h>
#include <math.h>

class Kinematics{
  
private:
 std::vector<float> joint_angles;
 std::vector<float> d={0.33,0,0.316,0,0.384,0.107};
 std::vector<float> alpha={0,-M_PI/2,M_PI/2,M_PI/2,-M_PI/2,M_PI/2,0};
 std::vector<float> a={0,0,0,0.0825,-0.0825,0.088};
 //ros::NodeHandle n;

 //ros::Publisher EEcord_pub = n.advertise<std_msgs::Float64MultiArray>("/endeffector_Cord", 1000);

public:
Kinematics()
{
  

}

void compute(std::vector<float> angles)
{
   std::vector<cv::Mat> transformations;
  std::cout<<"entered callback"<<std::endl;
  for (size_t i = 0; i < angles.size(); i++)
  {
    //std::cout << msg->position[i]*180.0/M_PI << " ";
    //joint_angles.push_back(msg->position[i]*180.0/M_PI);
    transformations.push_back(forward_kin(alpha[i],angles[i],a[i],d[i]));
  }
  setCoordinates(transformations);
  

}
cv::Mat forward_kin(float alpha, float theta, float ai, float di)
{
  std::cout<<"entered kincalc"<<std::endl;
  float mat_data[16]={cos(theta),-cos(alpha)*sin(theta),sin(alpha)*sin(theta),ai*cos(theta),
                              sin(theta),cos(alpha)*sin(theta),-sin(alpha)*cos(theta), ai*sin(theta),
                              0,sin(alpha),cos(alpha),di,
                              0,0,0,1};
  cv::Mat dhCalc = cv::Mat(4,4,CV_32F,mat_data);
  //std::cout<<dhCalc<<std::endl;

return dhCalc;
  
}
void setCoordinates(std::vector<cv::Mat> transformations)
{
  std::cout<<"entered setcord"<<std::endl;
  cv::Point3f coord;
  cv::Mat finalTrans= cv::Mat::eye(4,4,CV_32F);
  float mat_data1[16]={1,2,3,4,1,2,3,4,1,2,3,4,0,0,0,1};
  cv::Mat temp1 = cv::Mat(4,4,CV_32F,mat_data1);
  for(int i=0;i<transformations.size();i++)
  {
    finalTrans=finalTrans*temp1;
     //finalTrans=finalTrans*transformations[i];
     //std::cout<<transformations[i]<<std::endl;
    
  }
  
  std::cout<<finalTrans<<std::endl;
  coord.x=0;
  coord.y=0;
  coord.z=finalTrans.at<float>(2,3);
  //std::cout<<coord.x<<""<<coord.y<<""<<coord.z<<std::endl;

  //std_msgs::Float64MultiArray msg;
        //msg.data.clear();
        //msg.data.insert(msg.data.end(), coord.begin(), coord.end());
        //EEcord_pub.publish(msg);

}
};
void jointStateCallback(const sensor_msgs::JointState::ConstPtr& msg)
{
   std::vector<float> joint_angles;
  for (size_t i = 0; i < msg->position.size(); i++)
  {
    joint_angles.push_back(msg->position[i]);
   
  } 
  Kinematics kinObj;
  kinObj.compute(joint_angles);

}

int main(int argc, char** argv)
{

  ros::init(argc, argv, "forward_kinematics_node");
  std::cout<<"entered the main"<<std::endl;
  ros::NodeHandle n;
  Kinematics kinObj;
  ros::Subscriber sub = n.subscribe("/joint_states", 1, jointStateCallback);
  ros::spin();

  return 0;
}

