#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <messages/ImageCapture.h>
/*
class masterSim 
{
  private: 
    ros::NodeHandle n;
    ros::ServiceClient client; //= n.serviceClient<messages::ImageCapture>("capture_cloud");
    //ros::Subscriber jointSubscriber; //= n.subscribe("/joint_states",10, jointCallback,this);
    messages::ImageCapture srv;
  
    float currentVel = 100.0;
    bool doneSending = false;
    int pics_taken = 0;
    float TOL = 0.01; 
    double BEGIN = ros::Time::now().toSec();
    int PICS_NEEDED = 5;
    std::vector<float> times = {5.0, 10.0, 15.0, 20.0, 25.0, 30.0};
    double stopTime = times.at(times.size()-1) + 5.0;

    int i = 0;

    //void jointCallback(const sensor_msgs::JointStateConstPtr& msg);


  public:
    masterSim();

    void checkPosition();

};
masterSim::masterSim()
{
  client = n.serviceClient<messages::ImageCapture>("capture_cloud");
  //jointSubscriber = n.subscribe("/joint_states",10, &masterSim::jointCallback,this);
}
/*
void masterSim::jointCallback(const sensor_msgs::JointStateConstPtr& msg)
{
  float tempVel = 0.0;
  for(int i=0; i < msg->velocity.size(); i++)
  {
    tempVel += std::pow(msg->velocity[i],2);
  }
  currentVel = tempVel;
  //std::cout<<"current velocity: " << currentVel <<std::endl;

}


void masterSim::checkPosition()
{
  //std::cout<<"current velocity: " << currentVel <<std::endl;
  //std::cout<<"pics taken: " << pics_taken <<std::endl;
  double now = ros::Time::now().toSec();
  float elapsedTime = now - BEGIN;
  float currentPt = times.at(i);


  //if (currentVel < TOL && pics_taken < PICS_NEEDED)
  if (i >= times.size() && !doneSending)
  {
    //ros::Duration(0.5).sleep();
    ROS_INFO("sending capture request.. [%ld]", (int) pics_taken);
    srv.request.x = false;
    client.call(srv);
    pics_taken++;
    if (i < times.size() - 2)
      {
        i++;
      }
      else 
      {
        doneSending = true;
      }
    //ros::Duration(3.0).sleep();

  }
  //else if ((pics_taken == PICS_NEEDED || now - BEGIN > 20.0) && doneSending == false )
  else if (elapsedTime > stopTime)
  {
    ROS_INFO("sending processing request");
    srv.request.x = true;
    client.call(srv);
    doneSending = true;
  }

}
*/
int main(int argc, char** argv)
{

  ROS_INFO("Master node initiated!");
  ros::init(argc, argv, "master_sim");

  /*
  masterSim ms_node;
  ros::Duration(1).sleep();
  while (ros::ok()) {
    ms_node.checkPosition();
    ros::spinOnce();
  }

  //ros::spin();

  return 0;
  /

*/
  
  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<messages::ImageCapture>("capture_cloud");
  //ros::Subscriber jointSubscriber = n.subscribe("/joint_states",10, jointCallback,this);

  messages::ImageCapture srv;
  
  //std::vector<float> times = {5.0,15.0,27.0,36.0,45.0,61.0,72.0,82.0,93.0,107.0,117.0,127.0,137.0,147.0,155.0,161.0,167.0,176.0,186.0,196.0,206.0,217.0,225.0,233.0,247.0,260.0,271.0,280.0,290.0,300.0};

 // std::vector<float> times = {15.0,27.0,36.0,45.0,61.0,72.0,82.0,93.0,107.0,117.0,127.0,137.0,147.0,155.0,161.0,167.0,176.0,186.0,196.0,206.0,217.0,225.0,233.0,247.0,260.0,271.0,280.0,290.0,300.0};
  std::vector<float> times = {2.0, 5.0, 10.0, 15.0, 20.0, 25.0, 30.0};
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