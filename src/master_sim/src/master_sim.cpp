#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <messages/ImageCapture.h>



int main(int argc, char** argv)
{

  ROS_INFO("Master node initiated!");
  ros::init(argc, argv, "master_sim");
  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<messages::ImageCapture>("capture_cloud");
  messages::ImageCapture srv;
  
  //std::vector<float> times = {5.0,15.0,27.0,36.0,45.0,61.0,72.0,82.0,93.0,107.0,117.0,127.0,137.0,147.0,155.0,161.0,167.0,176.0,186.0,196.0,206.0,217.0,225.0,233.0,247.0,260.0,271.0,280.0,290.0,300.0};

 // std::vector<float> times = {15.0,27.0,36.0,45.0,61.0,72.0,82.0,93.0,107.0,117.0,127.0,137.0,147.0,155.0,161.0,167.0,176.0,186.0,196.0,206.0,217.0,225.0,233.0,247.0,260.0,271.0,280.0,290.0,300.0};
  std::vector<float> times = {5,0,15.0, 20.0};
  //std::vector<float> times = {5.0};


  double begin = ros::Time::now().toSec();
  double now;
  double elapsedTime;
  int i = 0;
  bool doneSending = false;
  double stopTime = times.at(times.size()-1) + 5.0;

  
  while (ros::ok()) {
    now = ros::Time::now().toSec();
    elapsedTime = now - begin;

    float currentPt = times.at(i);

    //if (i >= times.size() && !doneSending){

    if (elapsedTime > currentPt && !doneSending)
    {
      ROS_INFO("sending capture request.. [%ld]", (int) i);
      srv.request.x = false;
      client.call(srv);
      if (i < times.size() - 2)
      {
        i++;
      }
      else 
      {
        doneSending = true;
      }

    }
    if (elapsedTime > stopTime)
    {
      srv.request.x = true;
      client.call(srv);
      doneSending = true;
    }

  }
  



 // ros::spin();

  return 0;
}