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

class InverseKinematics
{
    private:
    
    
    
    public: 
    InverseKinematics()
    {

    }
void CalculateRotationMatrix()
{

}
void TransformationM()
{

}
double SinT(double theta)
{
    if(theta > 1.5705)//for angles closer to 90deg
    {
        return 1.0;
    }
    else
    {
        return sin(theta);
    }
}
double CosT(double theta)
{
    if(theta > 1.5705)//for angles closer to 90deg
    {
        return 0.0;
    }
    else
    {
        return cos(theta);
    }
}
std::vector<double> getInversK(std::vector<double> posVector)
{
    std::vector<double> jointAngles;


    return jointAngles;

}

};


