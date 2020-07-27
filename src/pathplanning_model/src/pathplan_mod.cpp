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
        //std::cout<<"Angle Set"<<std::endl;
        std::vector <float> pos0 = {-0.014764, -0.23170993, 0.05181498, -2.0479213, -1.54893, 1.52423744, -1.394813};//0
         jointAngleSet.push_back(pos0);
         std::vector <float> pos1 = {-0.014764, -0.23170993, 0.05181498, -2.0479213, -1.54893, 1.52423744, -1.394813};//1
         jointAngleSet.push_back(pos1);
         std::vector <float> pos2 = {-0.0150432, 0.43006, 0.055734858, -1.3854573, -1.60207, 1.611574, -1.3840217};//save pic--2
         jointAngleSet.push_back(pos2);
         std::vector <float> pos3 = {-0.55668, 0.568625, 0.021229, -1.378861, -1.385753, 2.82236, -1.639886};//3
         jointAngleSet.push_back(pos3);
         std::vector <float> pos4 = {-0.586156, 0.853643, 0.087543, -1.266348, -0.351233, 2.4096, -2.216692}; // save pic--4
         jointAngleSet.push_back(pos4);
         std::vector <float> pos5 = {-0.380533, 0.44029644, 0.0871018, -1.454936, -1.401328, 1.84973, -1.63066};//5
         jointAngleSet.push_back(pos5);
         std::vector <float> pos6 = {0.0825584, 0.3584410, 0.1909656, -1.501195, -1.543632, 1.250717, -1.26781};// save pic--6
         jointAngleSet.push_back(pos6);
         std::vector <float> pos7 = {0.47164828, 0.515796, 0.264389, -1.4167907, -1.552264, 1.4619798, -1.33512};//7
         jointAngleSet.push_back(pos7);
         //std::vector <float> pos8 = {0.44547582, 0.8054551, 0.219487, -1.3007, -1.94811624, 2.15483998, -1.881513};
        // jointAngleSet.push_back(pos8);
         std::vector <float> pos9 = {0.4313268, 0.649523, 0.265708, -1.30033723, -1.50686, 1.0903097, -1.2873703};//save pic--8
         jointAngleSet.push_back(pos9);
         std::vector <float> pos10 = {0.357717, -0.12328, 0.653339, -2.23910, -0.892351, 0.72340,-0.249114};//9
         jointAngleSet.push_back(pos10);
         std::vector <float> pos11 = {0.297000, 0.38255, 0.48123, -1.850917, 0.28702, 1.115946, 1.199580};// save pic--10
         jointAngleSet.push_back(pos11);
         jointAngleSet.push_back(pos10);//11
         std::vector <float> pos12 = {-0.023895, -0.62279, 0.2634198, -2.6288, -1.270, 1.6044, -0.53794};// save pic--12
         jointAngleSet.push_back(pos12);
         std::vector <float> pos13 = {-0.2162787, -0.403832, -0.623468, -2.532035, -1.368462, 2.37080085, -0.9596436};//13
         jointAngleSet.push_back(pos13);
         std::vector <float> pos14 = {-0.3799923, 0.2602442, -0.494012, -2.1547895, -0.304500, 2.620299, -2.0891112};//save pic--14
         jointAngleSet.push_back(pos14);
         jointAngleSet.push_back(pos13);//15
         //std::vector <float> pos15 = {-0.15038719, -0.41586273, 0.306434, -2.3228989, -1.384752, 1.5398367, -1.29059};
         //jointAngleSet.push_back(pos15);

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