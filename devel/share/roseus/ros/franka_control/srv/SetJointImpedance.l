;; Auto-generated. Do not edit!


(when (boundp 'franka_control::SetJointImpedance)
  (if (not (find-package "FRANKA_CONTROL"))
    (make-package "FRANKA_CONTROL"))
  (shadow 'SetJointImpedance (find-package "FRANKA_CONTROL")))
(unless (find-package "FRANKA_CONTROL::SETJOINTIMPEDANCE")
  (make-package "FRANKA_CONTROL::SETJOINTIMPEDANCE"))
(unless (find-package "FRANKA_CONTROL::SETJOINTIMPEDANCEREQUEST")
  (make-package "FRANKA_CONTROL::SETJOINTIMPEDANCEREQUEST"))
(unless (find-package "FRANKA_CONTROL::SETJOINTIMPEDANCERESPONSE")
  (make-package "FRANKA_CONTROL::SETJOINTIMPEDANCERESPONSE"))

(in-package "ROS")





(defclass franka_control::SetJointImpedanceRequest
  :super ros::object
  :slots (_joint_stiffness ))

(defmethod franka_control::SetJointImpedanceRequest
  (:init
   (&key
    ((:joint_stiffness __joint_stiffness) (make-array 7 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _joint_stiffness __joint_stiffness)
   self)
  (:joint_stiffness
   (&optional __joint_stiffness)
   (if __joint_stiffness (setq _joint_stiffness __joint_stiffness)) _joint_stiffness)
  (:serialization-length
   ()
   (+
    ;; float64[7] _joint_stiffness
    (* 8    7)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[7] _joint_stiffness
     (dotimes (i 7)
       (sys::poke (elt _joint_stiffness i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[7] _joint_stiffness
   (dotimes (i (length _joint_stiffness))
     (setf (elt _joint_stiffness i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(defclass franka_control::SetJointImpedanceResponse
  :super ros::object
  :slots (_success _error ))

(defmethod franka_control::SetJointImpedanceResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:error __error) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _error (string __error))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:error
   (&optional __error)
   (if __error (setq _error __error)) _error)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _error
    4 (length _error)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _error
       (write-long (length _error) s) (princ _error s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _error
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _error (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass franka_control::SetJointImpedance
  :super ros::object
  :slots ())

(setf (get franka_control::SetJointImpedance :md5sum-) "f11c4defa2a13040512214f9d77dc982")
(setf (get franka_control::SetJointImpedance :datatype-) "franka_control/SetJointImpedance")
(setf (get franka_control::SetJointImpedance :request) franka_control::SetJointImpedanceRequest)
(setf (get franka_control::SetJointImpedance :response) franka_control::SetJointImpedanceResponse)

(defmethod franka_control::SetJointImpedanceRequest
  (:response () (instance franka_control::SetJointImpedanceResponse :init)))

(setf (get franka_control::SetJointImpedanceRequest :md5sum-) "f11c4defa2a13040512214f9d77dc982")
(setf (get franka_control::SetJointImpedanceRequest :datatype-) "franka_control/SetJointImpedanceRequest")
(setf (get franka_control::SetJointImpedanceRequest :definition-)
      "float64[7] joint_stiffness
---
bool success
string error


")

(setf (get franka_control::SetJointImpedanceResponse :md5sum-) "f11c4defa2a13040512214f9d77dc982")
(setf (get franka_control::SetJointImpedanceResponse :datatype-) "franka_control/SetJointImpedanceResponse")
(setf (get franka_control::SetJointImpedanceResponse :definition-)
      "float64[7] joint_stiffness
---
bool success
string error


")



(provide :franka_control/SetJointImpedance "f11c4defa2a13040512214f9d77dc982")


