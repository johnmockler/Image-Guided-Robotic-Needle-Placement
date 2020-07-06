;; Auto-generated. Do not edit!


(when (boundp 'messages::ImageCapture)
  (if (not (find-package "MESSAGES"))
    (make-package "MESSAGES"))
  (shadow 'ImageCapture (find-package "MESSAGES")))
(unless (find-package "MESSAGES::IMAGECAPTURE")
  (make-package "MESSAGES::IMAGECAPTURE"))
(unless (find-package "MESSAGES::IMAGECAPTUREREQUEST")
  (make-package "MESSAGES::IMAGECAPTUREREQUEST"))
(unless (find-package "MESSAGES::IMAGECAPTURERESPONSE")
  (make-package "MESSAGES::IMAGECAPTURERESPONSE"))

(in-package "ROS")





(defclass messages::ImageCaptureRequest
  :super ros::object
  :slots (_x ))

(defmethod messages::ImageCaptureRequest
  (:init
   (&key
    ((:x __x) nil)
    )
   (send-super :init)
   (setq _x __x)
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:serialization-length
   ()
   (+
    ;; bool _x
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _x
       (if _x (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _x
     (setq _x (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass messages::ImageCaptureResponse
  :super ros::object
  :slots (_y ))

(defmethod messages::ImageCaptureResponse
  (:init
   (&key
    ((:y __y) nil)
    )
   (send-super :init)
   (setq _y __y)
   self)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; bool _y
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _y
       (if _y (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _y
     (setq _y (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass messages::ImageCapture
  :super ros::object
  :slots ())

(setf (get messages::ImageCapture :md5sum-) "049e540a757cae7de9e26696e82f8da7")
(setf (get messages::ImageCapture :datatype-) "messages/ImageCapture")
(setf (get messages::ImageCapture :request) messages::ImageCaptureRequest)
(setf (get messages::ImageCapture :response) messages::ImageCaptureResponse)

(defmethod messages::ImageCaptureRequest
  (:response () (instance messages::ImageCaptureResponse :init)))

(setf (get messages::ImageCaptureRequest :md5sum-) "049e540a757cae7de9e26696e82f8da7")
(setf (get messages::ImageCaptureRequest :datatype-) "messages/ImageCaptureRequest")
(setf (get messages::ImageCaptureRequest :definition-)
      "bool x
---
bool y
")

(setf (get messages::ImageCaptureResponse :md5sum-) "049e540a757cae7de9e26696e82f8da7")
(setf (get messages::ImageCaptureResponse :datatype-) "messages/ImageCaptureResponse")
(setf (get messages::ImageCaptureResponse :definition-)
      "bool x
---
bool y
")



(provide :messages/ImageCapture "049e540a757cae7de9e26696e82f8da7")


