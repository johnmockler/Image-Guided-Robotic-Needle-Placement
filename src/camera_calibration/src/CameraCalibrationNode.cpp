#include "CameraCalibrationNode.h"

using namespace cv;

CameraCalibrationNode::CameraCalibrationNode()
    : imageSub(nh.subscribe("/rgb/image_raw", 1, &CameraCalibrationNode::cameraCallback, this))
    , captureService(nh.advertiseService("capture_image", &CameraCalibrationNode::captureImage, this))


{
    alreadyCalibrated = false;
    //testing
    cv::namedWindow("Display window", cv::WINDOW_AUTOSIZE);
}

void CameraCalibrationNode::cameraCallback(const sensor_msgs::ImageConstPtr& msg)
{
    //convert image from sensor_msg to open cv data type "cv::Mat"
    cv_bridge::CvImagePtr cv_ptr;
    try
    {
        cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);

    }
    catch (cv_bridge::Exception& e)
    {
        ROS_ERROR("cv_bridge exception: %s", e.what());
        return;
    }

    mostRecentImage = cv_ptr->image;

    //need to add end effector rotation and coordinates callback function


}

bool CameraCalibrationNode::captureImage(messages::ImageCapture::Request &req, messages::ImageCapture::Response &res)
{
        //false request indicates more calibration images are needed. Save most recent image to calibration image matrix
        //also save end effector position at this time. 
        if (req.x == false)
        {
            calibrationImages.push_back(mostRecentImage);
            ROS_INFO("capturing image number [%ld]", (int) calibrationImages.size());
        }
        //if true, process images and computer K matrix and Hand-eye Calibration
        else if (req.x == true)
        {
            if (!alreadyCalibrated)
            {
                
                alreadyCalibrated = true;
                /*
                calibrateAndPoseEstimation();

                //For Testing
                std::cout << "M= " << std::endl;
                std::cout << cameraMatrix << std::endl;
                std::cout << "Dist Coeff" << std::endl;
                std::cout << distCoeffs << std::endl;

                /*test purposes~~~~~~~~~~~~~~~
                for (int i = 0; i < calibrationImages.size(); i++)
                {
                    cv::Mat temp = calibrationImages[i].clone();
                    cv::undistort(temp, calibrationImages[i], cameraMatrix, distCoeffs);
                    cv::imshow("Display window", calibrationImages[i]);
                    cv::waitKey(0);
                }
                

                ///*
                Mat Rot;
                for (int i = 0; i < cameraPosesR.size(); i++)
                {
                    std::cout<<"R = "<<std::endl;
                    cv::Rodrigues(cameraPosesR[i],Rot);
                    std::cout<<Rot<<std::endl;
                    std::cout<<"T = "<<std::endl;
                    std::cout<<cameraPosesT[i]<<std::endl;
                }
                //*/
                readTextFiles();
                calibrateHandEye(Rrpose, Trpose,Rmpose, Tmpose, cameraPosesR, cameraPosesT);
                std::cout<<cameraPosesR<<std::endl;
                std::cout<<cameraPosesT<<std::endl;

                //computeHandeyeTransform();
            }
        }
    res.y = true;
    return true;
}

void CameraCalibrationNode::calibrateAndPoseEstimation()
{
    ROS_INFO("Processing Calibration Images...");
    std::vector<std::vector<cv::Point2f>> imagePoints;
    std::vector<std::vector<Point3f>> objectPoints(1);
    getChessboardCorners(calibrationImages, imagePoints);
    createKnownBoardPosition(objectPoints[0]);
    objectPoints.resize(imagePoints.size(), objectPoints[0]);

    ROS_INFO("Calibrating Camera...");
    std::vector<cv::Mat> rVectors,tVectors;
    cv::calibrateCamera(objectPoints, imagePoints, cv::Size(calibrationImages[0].rows,calibrationImages[0].cols), cameraMatrix, distCoeffs, rVectors, tVectors);
    
    ROS_INFO("Beginning Pose Estimation...");
    Mat rvec;
    Mat tvec;
    for (int i=0; i < calibrationImages.size(); i++)
    {
        cv::solvePnPRansac(objectPoints[i],  imagePoints[i],  cameraMatrix,  distCoeffs,  rvec,  tvec);
        cameraPosesR.push_back(rvec);
        cameraPosesT.push_back(tvec);
    }

}


void CameraCalibrationNode::computeHandeyeTransform()
{
    Mat R_cam2gripper;
    Mat t_cam2gripper;

    //cv::CalibrateHandEye(endEffectorPosesR,endEffectorPosesT, cameraPosesR, cameraPosesT, R_cam2gripper, t_cam2gripper);

    //convert R_cam2gripper and t_cam2gripper to Point3f or Vector3, and publish or something

    //cv::calibrateHandEye (InputArrayOfArrays R_gripper2base,
    //                      InputArrayOfArrays t_gripper2base,
    //                      InputArrayOfArrays R_target2cam,
    //                      InputArrayOfArrays t_target2cam,
    //
    //                      OutputArray R_cam2gripper,
    //                      OutputArray t_cam2gripper,
    //
    //                      HandEyeCalibrationMethod method=CALIB_HAND_EYE_TSAI)
}

void CameraCalibrationNode::broadcastTransform()
{
    //fill matrices with correct vectors
    transform.setOrigin( tf::Vector3(0.0, 2.0, 0.0) );
    transform.setRotation( tf::Quaternion(0, 0, 0, 1));
    br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "end effector", "camera"));
}

void CameraCalibrationNode::listenTransform()
{
    tf::StampedTransform base2gripper;
    try
    {
        listener.lookupTransform("end_effector", "base", ros::Time(0), base2gripper);
        //add store transform to class variables
    }
    catch (tf::TransformException ex)
    {
        ROS_ERROR("%s", ex.what());
        ros::Duration(1.0).sleep();
    }
}

// Additional Function for camera calibration
void CameraCalibrationNode::getChessboardCorners(std::vector<Mat> images, std::vector<std::vector<Point2f>>& allFoundCorners)
{
    cv::Mat gray;

    for (std::vector<Mat>::iterator iter = images.begin(); iter != images.end(); iter++)
    {
        cv::cvtColor(*iter, gray, cv::COLOR_BGR2GRAY);
        std::vector<Point2f> pointBuf;
        bool found = findChessboardCorners(gray, chessboardDimension, pointBuf, CALIB_CB_ADAPTIVE_THRESH | CALIB_CB_NORMALIZE_IMAGE);
        //void cornerSubPix(InputArray image, InputOutputArray corners, Size winSize, Size zeroZone, TermCriteria criteria)
        if (found)
        {
            cornerSubPix(gray, pointBuf, cv::Size(5, 5), cv::Size(-1, -1), TermCriteria(CV_TERMCRIT_EPS | CV_TERMCRIT_ITER, 30, 0.1));
            allFoundCorners.push_back(pointBuf);
        }
    }
}

void CameraCalibrationNode::createKnownBoardPosition(std::vector<Point3f>& corners)
{
    ROS_INFO("Creating board position");
    for (int i =0 ; i <chessboardDimension.height; i++)
    {
        for (int j =0 ; j<chessboardDimension.width; j++)
        {
            corners.push_back(Point3f(j * calibrationSquareDimension, i * calibrationSquareDimension, 0.0f));
            //corners.push_back(Point3f(j, i, 0.0f));
        }
    }
}

void CameraCalibrationNode::calibrateHandEye(InputArrayOfArrays R_gripper2base, InputArrayOfArrays t_gripper2base,
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

void CameraCalibrationNode::calibrateHandEyeQR24(std::vector<Mat>& Hg, const std::vector<Mat>& Hc,
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
        //Mat Hci_inv = homogeneousInverse(Hci);
        Mat Hci_inv = Hci;

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

        Z93.copyTo(A(Rect(9,i*12,3,9)));
        Rgi.copyTo(A(Rect(9,9+i*12,3,3)));
        E12_neg.copyTo(A(Rect(12,i*12,12,12)));

        //generate bi matrix
        Z91.copyTo(B(Rect(0,i*12,1,9)));
        Tgi_neg.copyTo(B(Rect(0,9+i*12,1,3)));

    }

    Mat X;
    solve(A,B,X,DECOMP_QR);



//    Mat R = X(Rect(0,12,1,9));

    Mat R = X(Rect(0,0,1,9));
    int newSize[] = {3,3};
    R = R.reshape(1,2, newSize);

    R_cam2gripper = R;

 //   Mat t = X(Rect(0,21,1,3));
    Mat t = X(Rect(0,9,1,3));
    t_cam2gripper = t;



}
Mat CameraCalibrationNode::homogeneousInverse(const Mat& T)
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

void CameraCalibrationNode::readTextFiles()
{
    String robot_poses = "/home/rnm/robot_poses.txt";
    String  marker_poses = "/home/rnm/marker_poses.txt";
    


    std::ifstream myfile;
    myfile.open(robot_poses);
    std::cout << myfile.is_open() << std::endl;

    if (myfile.is_open())
    {
        std::string line;

        int i = 0;
        int j = 0;
        int n = 0;
        Mat Rtemp = Mat::zeros(3,3, CV_64F);
        Mat Ttemp = Mat::zeros(3,1,CV_64F);
        while(std::getline(myfile,line))
        {

            if (j < 3)
            {

                if (i < 3)
                {
                    Rtemp.at<double>(i,j) = std::stod(line);
                }

            }
            else
            {
                if (i < 3)
                {
                    Ttemp.at<double>(i,0) = std::stod(line);
                }

            }

            if (i < 3)
            {
                i++;

            }
            else if (i == 3 && j < 3)
            {
                i = 0;
                j++;
            }
            else
            {
                Mat Rtemp1, Ttemp1;
                Rtemp.copyTo(Rtemp1);
                Ttemp.copyTo(Ttemp1);
                i = 0;
                j = 0;
                Rrpose.push_back(Rtemp1);
                Trpose.push_back(Ttemp1);
            }
        }
        myfile.close();
    }

    
    std::ifstream myfile1;
    myfile1.open(marker_poses);
    if (myfile1.is_open())
    {
        std::string line;

        int i = 0;
        int j = 0;
        int n = 0;

        Mat Rtemp = Mat::zeros(3,3, CV_64F);
        Mat Ttemp = Mat::zeros(3,1,CV_64F);

        while(std::getline(myfile1,line))
        {

            if (j < 3)
            {
                if (i < 3)
                {
                    Rtemp.at<double>(i,j) = std::stod(line);
                }
            }
            else
            {
                if (i < 3)
                {
                    Ttemp.at<double>(i,0) = std::stod(line);
                }
            }

            if (i < 3)
            {
                i++;

            }
            else if (i == 3 && j < 3)
            {
                i = 0;
                j++;
            }
            else
            {
                Mat Rtemp1, Ttemp1;
                Rtemp.copyTo(Rtemp1);
                Ttemp.copyTo(Ttemp1);
                i = 0;
                j = 0;
                Rmpose.push_back(Rtemp1);
                Tmpose.push_back(Ttemp1);
            }
        }
        myfile1.close();
    }

    std::cout << "Rr" << std::endl;
    
    std::cout << Rrpose[15] << std::endl;
    
    std::cout << "Tr" << std::endl;
    std::cout << Trpose[15] << std::endl;
    std::cout << "Rm" << std::endl;
    std::cout << Rmpose[15] << std::endl;
    std::cout << "Tm" << std::endl;
    std::cout << Tmpose[15] << std::endl;
    
    
}