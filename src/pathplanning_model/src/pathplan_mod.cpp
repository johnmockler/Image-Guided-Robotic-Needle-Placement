#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <std_msgs/String.h>
#include <std_msgs/Float64MultiArray.h>
#include <vector>
#include <stdlib.h>
#include <math.h>

class PathPlanningM
{
    private:

    std::vector<std::vector<float>> jointAngleSet;
    //std::vector <float> Avec = {0.400,0.400,0.0,-0.400,-0.400,-0.400,-0.400,-0.400,-0.400,0.0,0.400,0.400,0.400};
    //std::vector <float> Bvec = {0.500,0.150};
    //std::vector <float> Cvec = {0.300,0.500,0.500,0.500,0.300,0.500,0.500,0.300,0.500,0.500,0.500,0.300,0.500};
    std::vector <float> Avec = {0.0,0.0,0.200,0.400,0.400};
    std::vector <float> Bvec = {0.250,0.500,0.500,0.500,0.500};
    std::vector <float> Cvec = {0.500,0.500,0.500,0.500,0.300};
    ros::NodeHandle n;
    ros::Subscriber inverseSubscriber;
    ros::Publisher cordinate_pub = n.advertise<std_msgs::Float64MultiArray>("/joint_AnglesIK", 1000);
    ros::Publisher type_pub = n.advertise<std_msgs::String>("/execution_type", 1000);

    public:

    PathPlanningM(ros::NodeHandle nh): n(nh)
    {
        setJointAngles();

    }
    void getJointAngles()
    {
            for(int i=0;i<jointAngleSet.size();i++)
            {
                

                std_msgs::Float64MultiArray msg;
                msg.data.clear();
                msg.data.insert(msg.data.end(), jointAngleSet[i].begin(), jointAngleSet[i].end());
                cordinate_pub.publish(msg);
                ros::Duration(0.2).sleep();
                
            }
       
  
    }
      void setJointAngles()
    {
        std::cout<<"Angle Set"<<std::endl;
         std::vector <float> pos1 = {0.030525, -0.1569, 0.00543, -2.04827, -1.511428, 1.50407, -1.263967};
         jointAngleSet.push_back(pos1);
         std::vector <float> pos2 = {-0.11194, 0.185898, -0.951134, -2.47058, -0.5011734, 2.7499887, -1.840970};
         jointAngleSet.push_back(pos2);
         std::vector <float> pos3 = {-0.127346, -0.89997, 0.7862128, -2.430445, -0.833805, 1.23556, -0.84614679};
         jointAngleSet.push_back(pos3);
         std::vector <float> pos4 = {-0.8479007, -1.089440, 1.81952, -2.0095914, 1.421915, 1.8340413, 1.410234};
         jointAngleSet.push_back(pos4);
         std::vector <float> pos5 = {-2.864878, -0.4638232, 2.6686572, -1.520757, 1.5852838, 1.599405, 1.765395};
         jointAngleSet.push_back(pos5);
         std::vector <float> pos6 = {-2.8250744, -0.678798, 2.207051, -1.9668214, 0.4210820, 2.7636913, -2.4785283};
         jointAngleSet.push_back(pos6);

    }

};

int main(int argc, char** argv)
{

  ros::init(argc, argv, "pathplan_mod");
  ros::NodeHandle n;
  PathPlanningM obj(n);
  ros::Rate loop_rate(10);
  while (ros::ok())
  {
      obj.getJointAngles();
      loop_rate.sleep();
      ros::spinOnce();
  } 
  return 0;
}