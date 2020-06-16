#include "CameraCalibrationNode.h"

//using namespace cv;

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
                */

                ///*
                for (int i = 0; i < cameraPosesR.size(); i++)
                {
                    std::cout<<"R = "<<std::endl;
                    std::cout<<cameraPosesR[i]<<std::endl;
                    std::cout<<"T = "<<std::endl;
                    std::cout<<cameraPosesT[i]<<std::endl;
                }
                //*/

                computeHandeyeTransform();
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
            //corners.push_back(Point3f(j * calibrationSquareDimension, i * calibrationSquareDimension, 0.0f));
            corners.push_back(Point3f(j, i, 0.0f));
        }
    }
}