#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <messages/ImageCapture.h>



int main(int argc, char** argv)
{


  ros::init(argc, argv, "master_sim");
  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<messages::ImageCapture>("capture_image");
  messages::ImageCapture srv;

  std::vector<float> times = {3.0,12.0, 24.0, 35.0, 44.0, 54.0,63.0,70.0,77.0,84.0,92.0,103.0,113.0,123.0,133.0,141.0,152.0,164.0,174.0,188.0,196.0,208.0,217.0,230.0};
  double begin = ros::Time::now().toSec();
  double now;
  double elapsedTime;
  float currentPt;
  int i = 0;

  
  while (ros::ok()) {
    now = ros::Time::now().toSec();
    elapsedTime = now - begin;
    currentPt = times[i];

    if (i > 22){
      srv.request.x = true;
      client.call(srv);
    }
    else if (elapsedTime > currentPt){
      srv.request.x = false;
      client.call(srv);
      ROS_INFO("sending capture request..");
      i++;
    }

  }
  



 // ros::spin();

  return 0;
}