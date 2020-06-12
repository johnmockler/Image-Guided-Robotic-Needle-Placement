#include "CameraCalibrationNode.h"

using namespace cv;

CameraCalibrationNode::CameraCalibrationNode()
    : imageSub(nh.subscribe("/rgb/image_raw", 1, &CameraCalibrationNode::cameraCallback, this))
    , captureService(nh.advertiseService("capture_image", &CameraCalibrationNode::captureImage, this))


{
    alreadyProcessed = false;
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
        imagesTaken++;
        ROS_INFO("capturing image number [%ld]", (int) imagesTaken);


    }
    //if true, process images and computer K matrix and Hand-eye Calibration
    else if (req.x == true)
    {
        if (!alreadyProcessed){
            //test purposes~~~~~~~~~~~~~~~
            for (int i = 0; i < calibrationImages.size(); i++)
            {
                cv::imshow("Display window", calibrationImages[i]);
                cv::waitKey(0);
            }
            //~~~~~~~~~~~~~~~~~~~~~~~~~~~~            

            ROS_INFO("processing calibration images...");
            calibrateCamera();
            estimatePoses();
            computeHandeyeTransform();
            alreadyProcessed = true;
        }

    }
    
    res.y = true;

    return true;
}

void CameraCalibrationNode::calibrateCamera()
{


    return;
}

void CameraCalibrationNode::estimatePoses()
{
    return;
}

void CameraCalibrationNode::computeHandeyeTransform()
{
    Mat R_cam2gripper;
    Mat t_cam2gripper;

    //cv::CalibrateHandEye(endEffectorPosesR,endEffectorPosesT, cameraPosesR, cameraPosesT, R_cam2gripper, t_cam2gripper);

    //conver R_cam2gripper and t_cam2gripper to Point3f or Vector3, and publish or something

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