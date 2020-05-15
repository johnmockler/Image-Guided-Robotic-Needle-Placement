#include "ros/ros.h"
#include "sensor_msgs/JointState.h"
#include "string"
void jointStateCallback(const sensor_msgs::JointStateConstPtr& msg) {
    for (size_t i = 0; i < msg->position.size(); i++) {
        std::cout <<"the joints are ";
        std::cout << msg->position[i] * 180.0 / M_PI << " ";
        std::cout << std::endl;
    }
}
int main(int argc, char **argv)
{
    std::string topic_name = "/joint_states";
    int queue_size = 1;

    ros::init(argc, argv, "panda_joint_reader");

    ros::NodeHandle nh;

    nh.getParam("joint_state_topic_name", topic_name);
    nh.getParam("subscriber_queue_size", queue_size);

    ros::Subscriber sub = nh.subscribe(topic_name, queue_size, jointStateCallback);

    ros::spin();

    return 0;

}



