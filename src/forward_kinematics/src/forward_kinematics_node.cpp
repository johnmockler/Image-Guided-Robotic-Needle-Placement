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
#include <tf/transform_listener.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/Point.h>
#include <tf2_msgs/TFMessage.h>


class Kinematics{
  
private:
 std::vector<float> joint_angles;
 std::vector<float> d={0.33,0,0.316,0,0.384,0,0.107};
 std::vector<float> alpha={0,-M_PI/2,M_PI/2,M_PI/2,-M_PI/2,M_PI/2,M_PI/2};
 std::vector<float> a={0,0,0,0.0825,-0.0825,0,0.088};
 cv::Mat T_1;
 cv::Mat T_2;
 cv::Mat T_3;
 cv::Mat T_4;
 cv::Mat T_5;
 cv::Mat T_6;
 cv::Mat T_7;
 cv::Mat T_F;
 ros::NodeHandle n;

 ros::Publisher EEcord_pub = n.advertise<std_msgs::Float64MultiArray>("/endeffector_Cord", 1000);
 ros::Publisher test_pub = n.advertise<tf2_msgs::TFMessage>("/tf_publisher", 1000);

public:
Kinematics()
{
  

}

void compute(std::vector<float> theta)
{
  std::vector<cv::Mat> transformations;
  std::cout<<"entered callback"<<std::endl;
  float mat_data1[16]={cos(theta[0]),-sin(theta[0]),0,0,  sin(theta[0]),cos(theta[0]),0,0,  0,0,1,d[0],  0,0,0,1};
  T_1= cv::Mat(4,4,CV_32F,mat_data1);
  transformations.push_back(T_1);

  float mat_data2[16]={cos(theta[1]),0,-sin(theta[1]),0,  sin(theta[1]),0,cos(theta[1]),0,  0,-1,0,0,  0,0,0,1};
  T_2= cv::Mat(4,4,CV_32F,mat_data2);
  transformations.push_back(T_2);

  float mat_data3[16]={cos(theta[2]),0,sin(theta[2]),0,  -sin(theta[2]),0,-cos(theta[2]),0,  0,1,0,d[2],  0,0,0,1};
  T_3= cv::Mat(4,4,CV_32F,mat_data3);
  transformations.push_back(T_3);

  float mat_data4[16]={cos(theta[3]),0,sin(theta[3]),a[3]*cos(theta[3]),  sin(theta[3]),0,-cos(theta[3]),a[3]*sin(theta[3]),  0,1,0,0,  0,0,0,1};
  T_4= cv::Mat(4,4,CV_32F,mat_data4);
  transformations.push_back(T_4);

  float mat_data5[16]={cos(theta[4]),0,-sin(theta[4]),a[4]*cos(theta[4]),  sin(theta[4]),0,cos(theta[4]),a[4]*sin(theta[4]),  0,-1,0,d[4],  0,0,0,1};
  T_5= cv::Mat(4,4,CV_32F,mat_data5);
  transformations.push_back(T_5);

  float mat_data6[16]={cos(theta[5]),0,sin(theta[5]),0,  sin(theta[5]),0,-cos(theta[5]),0,  0,1,0,0,  0,0,0,1};
   T_6= cv::Mat(4,4,CV_32F,mat_data6);
  transformations.push_back(T_6);

  float mat_data7[16]={cos(theta[6]),0,sin(theta[6]),a[6]*cos(theta[6]),  sin(theta[6]),0,-cos(theta[6]),a[6]*sin(theta[6]),  0,1,0,0,  0,0,0,1};
  T_7= cv::Mat(4,4,CV_32F,mat_data7);
  transformations.push_back(T_7);
  
  float mat_dataF[16]={1,0,0,0,  0,1,0,0,  0,0,1,d[6],  0,0,0,1};
  T_F= cv::Mat(4,4,CV_32F,mat_dataF);
  transformations.push_back(T_F);

  setCoordinates(transformations);
  
}

void setCoordinates(std::vector<cv::Mat> transformations)
{
  std::vector<double> coord;
  cv::Mat finalTrans= cv::Mat::eye(4,4,CV_32F);
  float mat_data1[16]={1,2,3,4,1,2,3,4,1,2,3,4,0,0,0,1};
  cv::Mat temp1 = cv::Mat(4,4,CV_32F,mat_data1);
  
  tf2_msgs::TFMessage mesg;
  for(int i=0;i<transformations.size();i++)
  {
     finalTrans=finalTrans*transformations[i];

     geometry_msgs::TransformStamped trans;
     trans.transform.translation.x=finalTrans.at<float>(0,3);
     trans.transform.translation.y=finalTrans.at<float>(1,3);
     trans.transform.translation.z=finalTrans.at<float>(2,3);
     trans.transform.rotation.x=0.0;
     trans.transform.rotation.y=0.0;
     trans.transform.rotation.z=0.0;
     trans.transform.rotation.w=0.0;
      
      
      mesg.transforms.push_back(trans);
       
  }
  
  //std::cout<<finalTrans<<std::endl;
  coord.push_back(finalTrans.at<float>(0,3));
  coord.push_back(finalTrans.at<float>(1,3));
  coord.push_back(finalTrans.at<float>(2,3));
 
  test_pub.publish(mesg);

/*geometry_msgs::Point newCord;
newCord.x=25.0;
newCord.y=10.0;
newCord.z=12.0;
test_pub.publish(newCord);*/

  std_msgs::Float64MultiArray msg;
        msg.data.clear();
        msg.data.insert(msg.data.end(), coord.begin(), coord.end());
        EEcord_pub.publish(msg);

}
};
void jointStateCallback(const sensor_msgs::JointState::ConstPtr& msg)
{
   std::vector<float> joint_angles;
  for (size_t i = 0; i < msg->position.size(); i++)
  {
    //joint_angles.push_back(msg->position[i]);
    joint_angles.push_back(0);
    std::cout<<"angles :"<<joint_angles[i]<<std::endl;
   
  } 
  Kinematics kinObj;
  kinObj.compute(joint_angles);

}

int main(int argc, char** argv)
{

  ros::init(argc, argv, "forward_kinematics_node");
  ros::NodeHandle n;
  Kinematics kinObj;
  ros::Subscriber sub = n.subscribe("/joint_states", 1, jointStateCallback);
  ros::spin();

  return 0;
}

