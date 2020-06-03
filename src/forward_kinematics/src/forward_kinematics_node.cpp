#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <vector>
#include <opencv2/opencv.hpp>
#include <std_msgs/String.h>
#include <std_msgs/Float64MultiArray.h>
#include <stdlib.h>
#include <math.h>


class Kinematics
{
  private:
 std::vector<double> joint_angles;
 std::vector<double> d={0.33,0,0.316,0,0.384,0.107};
 std::vector<double> alpha={0,-M_PI/2,M_PI/2,M_PI/2,-M_PI/2,M_PI/2,0};
 std::vector<double> a={0,0,0,0.0825,-0.0825,0.088};
 ros::NodeHandle n;
 std::vector<Mat> transformations;
 ros::Publisher EEcord_pub = n.advertise<std_msgs::Float64MultiArray>("/endeffector_Cord", 1000);

public:
void jointStateCallback(const sensor_msgs::JointState::ConstPtr& msg)
{
  for (size_t i = 0; i < msg->position.size(); i++)
  {
    std::cout << msg->position[i]*180.0/M_PI << " ";
    joint_angles.push_back(msg->position[i]*180.0/M_PI);
    transformations.push_back(forward_kin(alpha[i],joint_angles[i],a[i],d[i]);
  }
  setCoordinates()
  std::cout << std::endl;

}
cv::Mat forward_kin(double alpha, double theta, double ai, double di)
{
  cv::Mat dhCalc = (Mat_<float>(4,4)<<cos(theta),-cos(alpha)*sin(theta),sin(alpha)*sin(theta),ai*cos(theta),
                              sin(theta),cos(alpha)*sin(theta),-sin(alpha)*cos(theta), ai*sin(theta),
                              0,sin(alpha),cos(alpha),di,
                              0,0,0,1);

return dhCalc;
  
}
void setCoordinates()
{
   std::vector<Point3f> coord;
  cv::Mat finalTrans(4,4,float);
  finalTrans=transformations[0]*transformations[1]*transformations[2]*transformations[3]*transformations[4]*transformations[5]*transformations[6];
  coord.x=finalTrans.at<float>(0,3);
  coord.y=finalTrans.at<float>(1,3);
  coord.z=finalTrans.at<float>(2,3);

  std_msgs::Float64MultiArray msg;
        msg.data.clear();
        msg.data.insert(msg.data.end(), coord.begin(), coord.end());
        EEcord_pub.publish(msg);

}

int main(int argc, char** argv)
{

  ros::init(argc, argv, "forward_kinematics_node");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("/joint_states", 1, jointStateCallback);
  ros::spin();

  return 0;
}
}