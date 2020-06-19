/*
This code is an implementation of the hand-eye calibration QR24 algorithm by Ernst et al, from the paper "Non-orthogonal tool/flange and robot/world
calibration". the OpenCV function calibrateHandEye is borrowed from and modified to implement this algorithm.
*/

#include "calibrateHandeye.h"

using namespace cv;

namespace calib
{
void calibrateHandEye(InputArrayOfArrays R_gripper2base, InputArrayOfArrays t_gripper2base,
                      InputArrayOfArrays R_target2cam, InputArrayOfArrays t_target2cam,
                      OutputArray R_cam2gripper, OutputArray t_cam2gripper)
{
    CV_Assert(R_gripper2base.isMatVector() && t_gripper2base.isMatVector() &&
              R_target2cam.isMatVector() && t_target2cam.isMatVector());

    std::vector<Mat> R_gripper2base_, t_gripper2base_;
    R_gripper2base.getMatVector(R_gripper2base_);
    t_gripper2base.getMatVector(t_gripper2base_);

    std::vector<Mat> R_target2cam_, t_target2cam_;
    R_target2cam.getMatVector(R_target2cam_);
    t_target2cam.getMatVector(t_target2cam_);

    CV_Assert(R_gripper2base_.size() == t_gripper2base_.size() &&
              R_target2cam_.size() == t_target2cam_.size() &&
              R_gripper2base_.size() == R_target2cam_.size());
    CV_Assert(R_gripper2base_.size() >= 3);

    //Notation used in Tsai paper
    //Defines coordinate transformation from G (gripper) to RW (robot base)
    std::vector<Mat> Hg;
    Hg.reserve(R_gripper2base_.size());
    for (size_t i = 0; i < R_gripper2base_.size(); i++)
    {
        Mat m = Mat::eye(4, 4, CV_64FC1);
        Mat R = m(Rect(0, 0, 3, 3));
        R_gripper2base_[i].convertTo(R, CV_64F);

        Mat t = m(Rect(3, 0, 1, 3));
        t_gripper2base_[i].convertTo(t, CV_64F);

        Hg.push_back(m);
    }

    //Defines coordinate transformation from CW (calibration target) to C (camera)
    std::vector<Mat> Hc;
    Hc.reserve(R_target2cam_.size());
    for (size_t i = 0; i < R_target2cam_.size(); i++)
    {
        Mat m = Mat::eye(4, 4, CV_64FC1);
        Mat R = m(Rect(0, 0, 3, 3));
        R_target2cam_[i].convertTo(R, CV_64F);

        Mat t = m(Rect(3, 0, 1, 3));
        t_target2cam_[i].convertTo(t, CV_64F);

        Hc.push_back(m);
    }

    Mat Rcg = Mat::eye(3, 3, CV_64FC1);
    Mat Tcg = Mat::zeros(3, 1, CV_64FC1);

    
    calibrateHandEyeQR24(Hg, Hc, Rcg, Tcg);
    
    Rcg.copyTo(R_cam2gripper);
    Tcg.copyTo(t_cam2gripper);
}

static calibrateHandEyeQR24const(std::vector<Mat>& Hg, const std::vector<Mat>& Hc,
                                 Mat& R_cam2gripper, Mat& t_cam2gripper)
{
    int K = static_cast<int>(Hg.size());

    Mat A(12*K, 24, CV_64FC1);
    Mat B(12*K, 1, CV_64FC1);

    Mat E12_neg = Mat::eye(12,12,CV_64FC1) * -1;
    Mat Z91 = Mat::eye(9,1, CV_64FC1);
    Mat Z93 = Mat::zeros(9,3, CV_64FC1);


    for (size_t i = 0; i < Hg.size(); i++)
    {
        Mat Hgi = Hg[i];
        Mat Hci = Hc[i];
        Mat Hci_inv = homogeneousInverse(Hci);


        Mat Rgi = Hgi(Rect(0,0,3,3));
        Mat Tgi_neg = Hgi(Rect(3,0,1,3)) * -1;

        //equation 6
        Mat a00 = Rgi * Hci_inv.at<double>(0,0);
        Mat a01 = Rgi * Hci_inv.at<double>(1,0);
        Mat a02 = Rgi * Hci_inv.at<double>(2,0);
        Mat a10 = Rgi * Hci_inv.at<double>(0,1);
        Mat a11 = Rgi * Hci_inv.at<double>(1,1);
        Mat a12 = Rgi * Hci_inv.at<double>(3,1);
        Mat a20 = Rgi * Hci_inv.at<double>(0,2);
        Mat a21 = Rgi * Hci_inv.at<double>(1,2);
        Mat a22 = Rgi * Hci_inv.at<double>(2,2);
        Mat a30 = Rgi * Hci_inv.at<double>(0,3);
        Mat a31 = Rgi * Hci_inv.at<double>(1,3);
        Mat a32 = Rgi * Hci_inv.at<double>(2,3);

        //generate Ai matrix
        a00.copyTo(A(Rect(0,i*12,3,3)));
        a01.copyTo(A(Rect(3,i*12,3,3)));        
        a02.copyTo(A(Rect(6,i*12,3,3)));
        a10.copyTo(A(Rect(0,3 + i*12,3,3)));
        a11.copyTo(A(Rect(3,3 + i*12,3,3)));
        a12.copyTo(A(Rect(6,3 + i*12,3,3)));
        a20.copyTo(A(Rect(0,6 + i*12,3,3)));
        a21.copyTo(A(Rect(3,6 + i*12,3,3)));
        a22.copyTo(A(Rect(6,6 + i*12,3,3)));
        a30.copyTo(A(Rect(0,9 + i*12,3,3)));
        a31.copyTo(A(Rect(3,9 + i*12,3,3)));
        a32.copyTo(A(Rect(6,9 + i*12,3,3)));

        Z93.copyto(A(Rect(9,i*12,3,9)));
        Rgi.copyto(A(Rect(9,9+i*12,3,3)));
        E12_neg.copyto(A(Rect(12,i*12,12,12)));

        //generate bi matrix
        Z91.copyto(B(0,i*12,1,9));
        Tgi_neg.copyto(B(0,9+i*12,1,3));

    }

    Mat X;
    solve(A,B,X,DECOMPY_QR);

    Mat R = X(Rect(0,0,1,9));
    int newSize[] = {3,3};
    R = R.reshape(1,2, newSize);

    R_cam2gripper = R;

    Mat t = X(Rect(0,9,1,3));
    t_cam2gripper = t;



}
static Mat homogeneousInverse(const Mat& T)
{
    CV_Assert(T.rows == 4 && T.cols == 4);

    Mat R = T(Rect(0, 0, 3, 3));
    Mat t = T(Rect(3, 0, 1, 3));
    Mat Rt = R.t();
    Mat tinv = -Rt * t;
    Mat Tinv = Mat::eye(4, 4, T.type());
    Rt.copyTo(Tinv(Rect(0, 0, 3, 3)));
    tinv.copyTo(Tinv(Rect(3, 0, 1, 3)));

    return Tinv;
}











}