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
    Mat frame;
    Mat drawToFrame;
    std::vector<Mat> savedImages;
    std::vector<std::vector<Point2f>> markerCorners, rejectedCandidates;
    int framePerSecond = 20;
    
        //false request indicates more calibration images are needed. Save most recent image to calibration image matrix
        //also save end effector position at this time. 
        if (req.x == false) 
        {
            /*while(true)
            {
                vector<Vec2f> foundPoins;
                bool found = false;
                found = findChessboardCorners(req.x, chessboardDimension, foundPoins, CALIB_CB_ADAPTIVE_THRESH | CALIB_CB_NORMALIZE_IMAGE | CALIB_CB_FAST_CHECK);
                frame.copyTo(drawToFrame);
                drawChessboardCorners(drawToFrame, chessboardDimension, foundPoins, found);
                if (found)
                    imshow("Webcam", drawToFrame);
                else
                    imshow("Webcam", frame);
            }*/
            calibrationImages.push_back(mostRecentImage);
            imagesTaken++;
            ROS_INFO("capturing image number [%ld]", (int) imagesTaken);


        }
        //if true, process images and computer K matrix and Hand-eye Calibration


        else if (req.x == true)
        {
            if (!alreadyCalibrated)
            {
                /*test purposes~~~~~~~~~~~~~~~
                for (int i = 0; i < calibrationImages.size(); i++)
                {
                    cv::imshow("Display window", calibrationImages[i]);
                    cv::waitKey(0);

                }
                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~            
                */
                alreadyCalibrated = true;
                ROS_INFO("processing calibration images...");
                //findCorners(imagePoints,objectPoints);
                calibrateCamera(calibrationImages, chessboardDimension, calibrationSquareDimension, cameraMatrix, distCoeffs);
                
                std::cout << "M= " << std::endl;
                std::cout << cameraMatrix << std::endl;
                std::cout << "Dist Coeff" << std::endl;
                std::cout << distCoeffs << std::endl;
                estimatePoses(  calibrationImages, chessboardDimension, calibrationSquareDimension, cameraMatrix, distCoeffs,cameraPosesR, cameraPosesT);
                for (int i = 0; i < cameraPosesR.size(); i++){
                    std::cout<<"R = "<<std::endl;
                    std::cout<<cameraPosesR[i]<<std::endl;
                    std::cout<<"T = "<<std::endl;
                    std::cout<<cameraPosesT[i]<<std::endl;
                }
                
                computeHandeyeTransform();
            }
        }
    
    res.y = true;

    return true;
}

//
void CameraCalibrationNode::calibrateCamera(std::vector<Mat> calibrationImages, Size chessboardDimension, float calibrationSquareDimension, Mat& cameraMatrix, Mat& distCoeffs)
{
    //vector <vector<Point2f>> checkerboardImageSpacePoints;
    std::vector<std::vector<Point2f>> imagePoints;
    getChessboardCorners(calibrationImages, imagePoints, false);  // found a checkerboardImageSpacePoints = allFoundCorners of each image

    //vector<vector<Point3f>> worldSpaceCornerPoints(1);
    std::vector<std::vector<Point3f>> objectPoints(1);
    createKnownBoardPosition(chessboardDimension, calibrationSquareDimension, objectPoints[0]);  // vector<Point3f>& corners will be returned

    objectPoints.resize(imagePoints.size(), objectPoints[0]);

    std::vector<Mat> rVectors, tVectors;
    //distCoeffs = Mat::zeros(8, 1, CV_64F);

    //C++: double calibrateCamera(InputArrayOfArrays objectPoints,    InputArrayOfArrays imagePoints,     Size imageSize, InputOutputArray cameraMatrix,
    //                              InputOutputArray distCoeffs, OutputArrayOfArrays rvecs, OutputArrayOfArrays tvecs, int flags=0,
    //                              TermCriteria criteria=TermCriteria( TermCriteria::COUNT+TermCriteria::EPS, 30, DBL_EPSILON) )

    //calibrateCamera(worldSpaceCornerPoints, checkerboardImageSpacePoints, boardSize, cameraMatrix, distanceCoefficients, rVectors, tVectors);
    cv::calibrateCamera(objectPoints, imagePoints, chessboardDimension, cameraMatrix, distCoeffs, rVectors, tVectors);


return;
}

void CameraCalibrationNode::estimatePoses(std::vector<Mat> calibrationImages, Size chessboardDimension, float calibrationSquareDimension, Mat cameraMatrix, Mat distCoeffs, std::vector<cv::Mat>& cameraPosesR, std::vector<cv::Mat>& cameraPosesT)
{
    std::cout<<"Beginning Pose estimation..."<<std::endl;
    std::vector <std::vector<Point2f>> imagePoints;
    getChessboardCorners(calibrationImages, imagePoints, false);  // found a checkerboardImageSpacePoints = allFoundCorners of each image

    std::vector<std::vector<Point3f>> objectPoints(1);
    createKnownBoardPosition(chessboardDimension, calibrationSquareDimension, objectPoints[0]);  // vector<Point3f>& corners will be returned

    objectPoints.resize(imagePoints.size(), objectPoints[0]);

    std::cout<<"beginning loop..."<<std::endl;
    for (int i=0; i < calibrationImages.size(); i++){
        std::cout<<"hey im in this loop"<<std::endl;
        Mat rvec;
        Mat tvec;
        // bool solvePnP(InputArray objectPoints, InputArray imagePoints, InputArray cameraMatrix, InputArray distCoeffs, OutputArray rvec, OutputArray tvec, bool useExtrinsicGuess=false, int flags=ITERATIVE )
        bool Position =  cv::solvePnP(objectPoints[i],  imagePoints[i],  cameraMatrix,  distCoeffs,  rvec,  tvec);   // will populate cameraPosesR, cameraPosesT
        
        std::cout<<"in a loop"<<std::endl;
        if (Position)
        {
            std::cout<<"Found a marker"<<std::endl;
        }
        cameraPosesR.push_back(rvec);
        cameraPosesT.push_back(tvec);

    }

    //vector<Mat> rVectors, tVectors;
    //std::vector<cv::Mat> cameraPosesR;
    //std::vector<cv::Mat> cameraPosesT;

    return;
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

    return;
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
    try{
        listener.lookupTransform("end_effector", "base", ros::Time(0), base2gripper);
        //add store transform to class variables
    }
    catch (tf::TransformException ex){
        ROS_ERROR("%s", ex.what());
        ros::Duration(1.0).sleep();
    }

}

// Additional Function for camera calibration

void CameraCalibrationNode::getChessboardCorners(std::vector<Mat> images, std::vector<std::vector<Point2f>>& allFoundCorners, bool showResults)
{
    for (std::vector<Mat>::iterator iter = images.begin(); iter != images.end(); iter++)
    {
        std::vector<Point2f> pointBuf;
        //bool findChessboardCorners(InputArray image, Size patternSize, OutputArray corners, int flags=CALIB_CB_ADAPTIVE_THRESH+CALIB_CB_NORMALIZE_IMAGE )
        bool found = findChessboardCorners(*iter, chessboardDimension, pointBuf, CALIB_CB_ADAPTIVE_THRESH | CALIB_CB_NORMALIZE_IMAGE);

        //void cornerSubPix(InputArray image, InputOutputArray corners, Size winSize, Size zeroZone, TermCriteria criteria)

        if (found)
        {
            std::cout <<"checkerboard found" <<std::endl;
            allFoundCorners.push_back(pointBuf);
        }


    }
}

void CameraCalibrationNode::createKnownBoardPosition(Size boardSize, float squareEdgeLength, std::vector<Point3f>& corners)
{
    for (int i =0 ; i <boardSize.height ; i++)
    {
        for (int j =0 ; j<boardSize.width ;j ++)
        {
            std::cout << "I am in " << std::endl;
            corners.push_back(Point3f(j * squareEdgeLength, i * squareEdgeLength, 0.0f));

        }
    }
}