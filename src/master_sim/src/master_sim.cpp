#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <messages/ImageCapture.h>



int main(int argc, char** argv)
{

  ros::init(argc, argv, "master_sim");
  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<messages::ImageCapture>("capture_image");
  messages::ImageCapture srv;

  std::vector<float> times = {5.0,15.0,27.0,36.0,45.0,61.0,72.0,82.0,93.0,107.0,117.0,127.0,137.0,147.0,155.0,161.0,167.0,176.0,186.0,196.0,206.0,217.0,225.0,233.0,247.0,260.0,271.0,280.0,290.0,300.0};
  
  double begin = ros::Time::now().toSec();
  double now;
  double elapsedTime;
  float currentPt;
  int i = 0;

  
  while (ros::ok()) {
    now = ros::Time::now().toSec();
    elapsedTime = now - begin;
    currentPt = times[i];

    if (i > times.size()){
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