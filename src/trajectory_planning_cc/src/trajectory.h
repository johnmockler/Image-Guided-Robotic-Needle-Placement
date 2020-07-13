


#include <vector>
#include <stdlib.h>
#include <math.h>

class Trajectory
{
    private:
    float T_g = 1.0;
    float V_MAX = 2.00 ;
    float A_MAX = 7.0;
    float T_i = 0.1;

    public:
    Trajectory()
    {

    }
    std::vector<std::vector<float>> computeTrajectory(std::vector<float>initialA, std::vector<float>finalA)
    {
        std::vector<std::vector<float>> AngleSet;
        for(int i=0;i<7;i++)
        {
            std::vector<float> temp;
            if(initialA[i] == finalA[i])
            {
                temp.assign(7,initialA[i]);
                AngleSet.push_back(temp);
            }
            else
            {
                temp = getAngles(initialA[i], finalA[i]);
                AngleSet.push_back(temp);

            }

        }
        return AngleSet;

    }
    std::vector<float> getAngles(float thetaS, float thetaG)
    {
        float d = thetaG-thetaS;
        std::vector<float> interSet;

        //Time considerations
        if(T_g/d <0.02 && T_g/d > -0.02)
        {
            T_g = (d/T_g)/30;
        }

        // max acceleration 
        float a = d/pow((T_g/2),2);
        if(a>A_MAX)
        {
            a=A_MAX;

        }
        else if(a<-A_MAX)
        {
            a=A_MAX;
        }

        // speed limitation

        float t_sw = sqrt(d/a);
        T_g=t_sw*2;
        float v_sw= d/(T_g-t_sw);

        if(v_sw > V_MAX)
        {
            t_sw= (d/V_MAX);
            T_g=t_sw*2;
            a=d/(pow(t_sw,2));
        }

        float t_gm = T_g/T_i;
        t_gm= t_gm - fmod(t_gm,1);
        interSet = AcDc(t_gm, v_sw, t_sw, thetaS, thetaG);

        return interSet;
    }
    std::vector<float> AcDc(float t_gm, float v_sw, float t_sw, float theta_s, float theta_g)
    {

        //accelecration sec
        std::vector<float> angles;
        float t = 0;
        float c_0 = theta_s;
        float c_1 = 0;
        float temp;
        float c_2 = v_sw / (2*t_sw);

        while(t<=t_sw)
        {
            temp = c_0 + c_1 + c_2 * pow(t,2);
            angles.push_back(temp);
            t= t + T_i;
        }

        // deceleration sec
        float c_2n = v_sw / (2* (t - t_sw-T_g));
        float c_1n = -2 * c_2n * T_g;
        float c_0n = ((theta_g + theta_s)/2)- (c_2n * pow(t_sw,2) - 2* c_2n * t_sw);

        while(t>t_sw && t< (T_g + T_i))
        {
            temp = c_0n + c_1n * t + c_2n * pow(t,2);
            angles.push_back(temp);
            t= t + T_i;
        }

        return angles;
    }

};

