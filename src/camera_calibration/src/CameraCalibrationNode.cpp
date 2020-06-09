#include "CameraCalibrationNode.h"
#include "messages/ImageCapture.h"

using namespace cv, std;

CameraCalibrationNode::CameraCalibrationNode()
    : imageSub(nh.subscribe("/rgb/image_raw", 1, &CameraCalibrationNode::cameraCallback, this))
    , cameraMatrix(Mat::eye(3,3, CV_64F))
{
    int imagesTaken = 0;
    const int CALIB_IMAGES = 15;
    Mat mostRecentImage;
    vector<Mat>> calibrationImages(CALIB_IMAGES);

    vector<Mat>> endEffectorPosesR;
    vector<<Mat>> endEffectorPosesT;
    vector<Mat>> cameraPosesR;
    vector<Mat>> cameraPosesT;

    tf::TransformBroadcaster br;
    tf::Transform transform;

    tf::TransformListener listener;

    ros::ServiceServer service = n.advertiseService("capture_image", captureImage);



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

bool CameraCalibrationNode::captureImage(camera_calibration::ImageCapture::Request &req,
    camera_calibration::ImageCapture::Response &res)
{
    
    //false request indicates more calibration images are needed. Save most recent image to calibration image matrix
    //also save end effector position at this time. 
    if (req.x == false) 
    {
        calibrationImages.push_back(mostRecentImage);
        imagesTaken++;
        ROS_INFO("capturing image number [%ld]", (int) imagesTaken);
    }
    //if true, process images and computer K matrix and Hand-eye Calibration
    else if (req.x == true)
    {
        ROS_INFO("processing calibration images...");
        calibrateCamera();
        estimatePoses();
        computeHandeyeTransform();


    }
    
    res.x = true;

    return true;
}

void CameraCalibrationNode::calibrateCamera()
{


    return;
}

void CameraCalibrationNode::estimatePoses();
{
    return;
}

void CameraCalibration::computeHandeyeTransform()
{
    Mat R_cam2gripper;
    Mat t_cam2gripper;

    calibrateHandEye(endEffectorPosesR,endEffectorPosesT, cameraPosesR, cameraPosesT, R_cam2gripper, t_cam2gripper);

    //conver R_cam2gripper and t_cam2gripper to Point3f or Vector3, and publish or something

    return;
}

void CameraCalibration::broadcastTransform()
{
    //fill matrices with correct vectors
    transform.setOrigin( tf::Vector3(0.0, 2.0, 0.0) );
    transform.setRotation( tf::Quaternion(0, 0, 0, 1));
    br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "end effector", "camera"));

}

void CameraCalibration::listenTransform()
{
    tf::StampedTransform base2gripper;
    try{
        listener.lookupTransform("end_effector", "base", ros::Time(0), transform);
        //add store transform to class variables
    }
    catch (tf::TransformException ex){
        ROS_ERROR("%s", ex.what());
        ros::Duration(1.0).sleep();
    }



}