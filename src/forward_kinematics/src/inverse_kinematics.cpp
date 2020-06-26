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
     std::vector<float> joint_angles;
     std::vector<float> d={-0.107,0,-0.384,0,-0.316,0,-0.333};
     std::vector<float> alpha={-M_PI/2,-M_PI/2,M_PI/2,-M_PI/2,-M_PI/2,M_PI/2,0};
     std::vector<float> a={-0.088,0,0.0825,-0.0825,0,0,0};
     float gamma;
     float alph;
     float zeta;
     float epsilon;
     float delta;
     cv::Mat Tf_0;
     cv::Mat Tf_01;
     cv::Mat Tf_1g;
     cv::Mat Tf_02;
     cv::Mat Tf_03;
     cv::Mat Tf_04';
     cv::Mat T_7;
     cv::Mat T_F;
    
    public: 
    InverseKinematics()
    {

    }
void CalculateRotationMatrix()
{

}
cv::Mat TransformationM(float x,float y, float z)
{
    cv::Mat T;
    float mat_data[16]={1,0,0,-x,  
                        0,1,0,-y,  
                        0,0,1,z-0.0333,  
                        0,0,0,1};
    T= cv::Mat(4,4,CV_32F,mat_data);
    return T;

}
void ComputeAngles(cv::Mat T, float j_1)
{
    float l3,l5,l35;
    cv::Mat Tf_10=TMatrixInv(a[0],d[0],alpha[0],j_1);
    Tf_1g= Tf_10 * T;
    std::vector<float> pGoalPos;
    pGoalPos.push_back(Tf_1g.at<float>(0,3));
    pGoalPos.push_back(-Tf_1g.at<float>(1,3));
    pGoalPos.push_back(Tf_1g.at<float>(2,3));
    gamma=atan(a[3]/-d[3]);
    alph=atan(pGoalPos[0]/pGoalPos[1]);
    l3=sqrt(d[2]*d[2]+a[2]*a[2]);
    l5=sqrt(d[4]*d[4]+a[3]*a[3]);
    zeta=atan(-d[2]/a[2]);
    epsilon=atan(-d[4]/-a[3]);
    l35=sqrt(pGoalPos(0)*pGoalPos(0)+pGoalPos(1)*pGoalPos(1));
    beta=acos((pow(l3,2)+pow(l35,2)-pow(l5,2))/(2*l3*l35));
    delta=acos((pow(l3,2)+pow(l5,2)-pow(l35,2))/(2*l3*l5)

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
float CosT(float theta)
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
cv::Mat TMatrix(float a, float d, float alpha, float theta)
{
    cv::Mat T;
    float mat_data[16]={CosT(theta),-CosT(alpha)*SinT(theta),SinT(alpha)*SinT(theta),a*CosT(theta),  
                        SinT(theta),CosT(alpha)*CosT(theta),-SinT(alpha)*CosT(theta),a*SinT(theta),  
                        0,SinT(alpha),CosT(alpha),d,  
                        0,0,0,1};
    T= cv::Mat(4,4,CV_32F,mat_data);
    return T;
}

cv::Mat TMatrixInv(float a, float d, float alpha, float theta)
{
    cv::Mat T;
    float mat_data[16]={CosT(theta),SinT(theta),0,-a,  
                        -CosT(alpha)*SinT(theta),CosT(alpha)*CosT(theta),SinT(alpha),-d*SinT(alpha),  
                        SinT(alpha)*SinT(theta),-SinT(alpha)*CosT(theta),CosT(alpha),-d*CosT(alpha),  
                        0,0,0,1};
    T= cv::Mat(4,4,CV_32F,mat_data);
    return T;
}
std::vector<double> getInversK(std::vector<double> posVector)
{
    float j1,j2,j3,j4,j5,j6,j7;
    std::vector<double> jointAngles;
    Tf_0=TransformationM(posVector[0],posVector[1],posVector[2]);
    j1= atan(-Tf_0.at<float>(1,3)/-Tf_0.at<float>(0,3);
    jointAngles.push_back(j1);
    j2=alph-beta-gamma;
    jointAngles.push_back(j2);
    j3=0;
    jointAngles.push_back(j3);
    j4=2*M_PI-delta-epsilon-zeta;
    jointAngles.push_back(j4);
    
    return jointAngles;

}

};


