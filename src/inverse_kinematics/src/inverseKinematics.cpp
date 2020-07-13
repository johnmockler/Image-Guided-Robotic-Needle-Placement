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
     float mat_dat[16]={0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0};
     float gamma;
     float alph;
     float zeta;
     float epsilon;
     float beta;
     float delta;
     cv::Mat Rf_47;
     cv::Mat R_07;
     cv::Mat goalPf;
     cv::Mat Tf_0g;
     cv::Mat Tf_01;
     cv::Mat Tf_02;
     cv::Mat Tf_03;
     cv::Mat Tf_04;
     cv::Mat T_7;
     cv::Mat T_F;
     ros::NodeHandle nh;
     ros::Publisher command_pub = nh.advertise<std_msgs::Float64MultiArray>("/joint_AnglesIK", 1000);
    
    public: 
    InverseKinematics()
    {

    }

    double SinT(double theta)
    {
        //std::cout<<"entered Sin"<<std::endl;
        float val= sin(theta);
         if(val<0.0001 && val> -0.001)
        {
            return 0.0;
        }
        else if(val>0.99)
        {
            return 1.0;
        }
        else if(val<-0.99)
        {
            return -1.0;
        }
        else
        {
            return val;
        }
        
        
    }
    float CosT(float theta)
    {
        //std::cout<<"entered COS"<<std::endl;
        float val= cos(theta);
         if(val<0.0001 && val> -0.001)
        {
            return 0.0;
        }
        else if(val>0.99)
        {
            return 1.0;
        }
        else if(val<-0.99)
        {
            return -1.0;
        }
        else
        {
            return val;
        }
        
    }
    float aCos(float val)
    {
        float angle;
        angle=acos(val);
         if(angle<0.0001 && angle> -0.001)
        {
            return 0.0;
        }
        else
        {
            return angle;
        }

    }
    float aTan(float a, float b)
    {
        //std::cout<<"entered Tan"<<std::endl;
        float val;
        float angle;
        val= a/b;
        angle= atan(val);
        if(angle<0.0001 && angle> -0.001)
        {
            return 0.0;
        }
        else
        {
            return angle;
        }
        

    }
    void TMatrix(float *p, float a, float d, float alpha, float theta)
    {
        //std::cout<<"entered Tmat"<<std::endl;
        //cv::Mat Tni;
         float mat[16] ={CosT(theta),-CosT(alpha)*SinT(theta),SinT(alpha)*SinT(theta),a*CosT(theta),  
                            SinT(theta),CosT(alpha)*CosT(theta),-SinT(alpha)*CosT(theta),a*SinT(theta),  
                            0,SinT(alpha),CosT(alpha),d,  
                            0,0,0,1};
        //Tni= cv::Mat(4,4,CV_32F,mat_dat);
        for(int i=0;i<16;i++)
        {
            p[i]=mat[i];
        }
        
        
    }

    cv::Mat TMatrixInv(float a, float d, float alpha, float theta)
    {
        //std::cout<<"entered TMatINv"<<std::endl;
        cv::Mat Tin;
        float matData[16]={CosT(theta),SinT(theta),0,-a,  
                            -CosT(alpha)*SinT(theta),CosT(alpha)*CosT(theta),SinT(alpha),-d*SinT(alpha),  
                            SinT(alpha)*SinT(theta),-SinT(alpha)*CosT(theta),CosT(alpha),-d*CosT(alpha),  
                            0,0,0,1};
        Tin= cv::Mat(4,4,CV_32F,matData);
        std::cout<<"Tinv :"<<Tin<<std::endl;
        return Tin;
    }
    void InitialTransformation(std::vector<float> pos, std::vector<float> ori)
    {
        //std::cout<<"Entered transformation"<<std::endl;
        cv::Mat R_z1,R_x,R_z3,goalP;
        float data1[9]={CosT(ori[0]),-SinT(ori[0]),0,
                        SinT(ori[0]), CosT(ori[0]),0,
                        0,0,1};

        float data2[9]={1,0,0,
                        0,CosT(ori[1]),-SinT(ori[1]),
                        0,SinT(ori[1]), CosT(ori[1])};

        float data3[9]={CosT(ori[2]),-SinT(ori[2]),0,
                        SinT(ori[2]), CosT(ori[2]),0,
                        0,0,1};

        R_z1=cv::Mat(3,3,CV_32F,data1);
        R_x=cv::Mat(3,3,CV_32F,data2);
        R_z3=cv::Mat(3,3,CV_32F,data3);

        R_07=R_z1*R_x*R_z3;
        float data4[16]={R_07.at<float>(0,0),R_07.at<float>(0,1),R_07.at<float>(0,2),pos[0],
                        R_07.at<float>(1,0),R_07.at<float>(1,1),R_07.at<float>(1,2),pos[1],
                        R_07.at<float>(2,0),R_07.at<float>(2,1),R_07.at<float>(2,2),pos[2],
                        0,0,0,1};
        goalP=cv::Mat(4,4,CV_32F,data4);
        goalPf=goalP.inv();
        Tf_0g=goalPf;
        Tf_0g.at<float>(2,3)=Tf_0g.at<float>(2,3) - 0.333;

    }
    void CalculateRotationMatrix(float j1, float j2, float j3, float j4)
    {
        //std::cout<<"entered CRM"<<std::endl;
        float p[16];
        TMatrix(&p[0], a[0],d[0], alpha[0], j1);
        Tf_01= cv::Mat(4,4,CV_32F,p);
        
        float p1[16];
        TMatrix(&p1[0],a[1],d[1], alpha[1], j2);
        cv::Mat Tf_12=cv::Mat(4,4,CV_32F,p1);

        float p2[16];
        TMatrix(&p2[0],a[2],d[2], alpha[2], j3);
        cv::Mat Tf_23=cv::Mat(4,4,CV_32F,p2);

        float p3[16];
        TMatrix(&p3[0], a[3],d[3], alpha[3], j4);
        cv::Mat Tf_34=cv::Mat(4,4,CV_32F,p3);

        Tf_02=Tf_01*Tf_12;
        Tf_03=Tf_02*Tf_23;
        Tf_04=Tf_03*Tf_34;
        cv::Mat Rf_04, Rf_07;
        float mat_data[9]={goalPf.at<float>(0,0),goalPf.at<float>(0,1),goalPf.at<float>(0,2),  
                            goalPf.at<float>(1,0),goalPf.at<float>(1,1),goalPf.at<float>(1,2),  
                            goalPf.at<float>(2,0),goalPf.at<float>(2,1),goalPf.at<float>(2,2)};

        float mat_data1[9]={Tf_04.at<float>(0,0),Tf_04.at<float>(0,1),Tf_04.at<float>(0,2),  
                            Tf_04.at<float>(1,0),Tf_04.at<float>(1,1),Tf_04.at<float>(1,2),  
                            Tf_04.at<float>(2,0),Tf_04.at<float>(2,1),Tf_04.at<float>(2,2)};

        Rf_07=cv::Mat(3,3,CV_32F,mat_data);
        Rf_04=cv::Mat(3,3,CV_32F,mat_data1);
        Rf_47= Rf_04.inv()*Rf_07.inv();
                            
    }

    void ComputeAngles(float j_1)
    {
        //std::cout<<"entered Compute"<<std::endl;
        float l3,l5,l35;
        cv::Mat Tf_1g;
        cv::Mat Tf_10;
        float matData[16]={CosT(j_1),SinT(j_1),0,-a[0],  
                            -CosT(alpha[0])*SinT(j_1),CosT(alpha[0])*CosT(j_1),SinT(alpha[0]),-d[0]*SinT(alpha[0]),  
                            SinT(alpha[0])*SinT(j_1),-SinT(alpha[0])*CosT(j_1),CosT(alpha[0]),-d[0]*CosT(alpha[0]),  
                            0,0,0,1};
        Tf_10 = cv::Mat(4,4,CV_32F,matData);
        //std::cout<<"Tf_10 :"<<Tf_10<<std::endl;
        Tf_1g= Tf_10 * Tf_0g;
        //std::cout<<"Tf_1g :"<<Tf_1g<<std::endl;
        std::vector<float> pGoalPos;
        pGoalPos.push_back(Tf_1g.at<float>(0,3));
        pGoalPos.push_back(Tf_1g.at<float>(1,3));
        pGoalPos.push_back(Tf_1g.at<float>(2,3));
        gamma=atan2(a[2],-d[2]);
        alph=atan2(pGoalPos[0],-pGoalPos[1]);
        l3=sqrt(pow(d[2],2)+pow(a[2],2));
        l5=sqrt(pow(d[4],2)+pow(a[3],2));
        zeta=atan2(-d[2],a[2]);
        epsilon=atan2(-d[4],-a[3]);
        l35=sqrt(pGoalPos[0]*pGoalPos[0]+pGoalPos[1]*pGoalPos[1]);
        float num=pow(l3,2)+pow(l35,2)-pow(l5,2);
        //std::cout<<"num :"<<num<<std::endl;
        
        float den=2.0*l3*l35;
       // std::cout<<"den :"<<den<<std::endl;
        beta=aCos(num/den);
        num=pow(l3,2)+pow(l5,2)-pow(l35,2);
        den= 2.0*l3*l5;
        delta=aCos(num/den);
        //std::cout<<"alpha :"<<alph<<" beta :"<<beta<<" gamma :"<<gamma<<" zeta :"<<zeta<<" delta :"<<delta<<" epsilon :"<<epsilon<<std::endl;
        //std::cout<<"l3 :"<<l3<<" l5 :"<<l5<<" l_35 :"<<l35<<std::endl; 

    }
    std::vector<float> getAngles(float JAinv[7])
    {
        std::vector<float> angles;
        for(int i=0;i<7;i++)
        {
            angles.push_back(-JAinv[6-i]);
            //angles.push_back(i);
        }
        return angles;
    }
    std::vector<float> getInversK(std::vector<float> posVector)
    {
        //std::cout<<"entered getInverseK"<<std::endl;
        float j1,j2,j3,j4,j5,j6,j7;
        float jointAngles [7];
        std::vector<float> orientation= {0,M_PI,0};
        InitialTransformation(posVector,orientation);
        jointAngles[0]= atan2(-Tf_0g.at<float>(1,3),-Tf_0g.at<float>(0,3));

        ComputeAngles( jointAngles[0]);
        //jointAngles.push_back(j1);
        jointAngles[1]=alph-beta-gamma;
        //jointAngles.push_back(j2);
       jointAngles[2]=0;
        //jointAngles.push_back(j3);
       jointAngles[3]=2.0*M_PI-delta-epsilon-zeta;
        
        //jointAngles.push_back(j4);

        CalculateRotationMatrix(jointAngles[0], jointAngles[1], jointAngles[2], jointAngles[3]);
       jointAngles[4]= atan2(Rf_47.at<float>(1,2),Rf_47.at<float>(0,3));
       if(jointAngles[4]>3,14)
       {
           jointAngles[4]=0.0;
       }
        //jointAngles.push_back(j5);
        float temp = sqrt(1- pow(Rf_47.at<float>(2,2),2));
        jointAngles[5]= atan2(-temp,Rf_47.at<float>(2,2));
       
       // jointAngles.push_back(j6);
        jointAngles[6]= atan2(Rf_47.at<float>(2,1),-Rf_47.at<float>(2,0));
        //jointAngles.push_back(j7);
        jointAngles[1]=jointAngles[1]+0.423;
        jointAngles[3]=jointAngles[3]-0.934;
        jointAngles[5]=-(jointAngles[5]+0.5108);
        if(jointAngles[6]>0.0)
        {
            jointAngles[6]=jointAngles[6]-1.5707;
        }
        else if(jointAngles[6]<0.0)
        {
            jointAngles[6]=jointAngles[6]+1.5707;
        }
        
        jointAngles[0]=0.0;

        std::vector<float> jointAn= getAngles(jointAngles);
        //std::cout<<jointAngles[0]<<" "<<jointAngles[1]<<" "<<jointAngles[2]<<" "<<jointAngles[3]<<" "<<jointAngles[4]<<" "<<jointAngles[5]<<" "<<jointAngles[6]<<std::endl;

        std_msgs::Float64MultiArray msg;
        msg.data.clear();
        msg.data.insert(msg.data.end(), jointAn.begin(), jointAn.end());
        command_pub.publish(msg);
        return jointAn;

    }
};
void jointStateCallback(const std_msgs::Float64MultiArray::ConstPtr& msg)
{
    //std::cout<<"Entered IK callback"<<std::endl;
    std::vector<float> cordinates;
    std::vector<float> ja;

  for (size_t i = 0; i <3; i++)
  {
    cordinates.push_back(msg->data[i]);
    //std::cout<<msg->data[i]<<std::endl;
  }
  InverseKinematics inKinObj;
  ja=inKinObj.getInversK(cordinates);

}

int main(int argc, char** argv)
{

  ros::init(argc, argv, "inverseKinematics");
  ros::NodeHandle nh;
  InverseKinematics inKinObj; 
  ros::Subscriber sub = nh.subscribe("/target_Cordinate", 1, jointStateCallback);
  ros::spin();
  
  return 0;
}


