;; Auto-generated. Do not edit!


(when (boundp 'franka_control::SetCartesianImpedance)
  (if (not (find-package "FRANKA_CONTROL"))
    (make-package "FRANKA_CONTROL"))
  (shadow 'SetCartesianImpedance (find-package "FRANKA_CONTROL")))
(unless (find-package "FRANKA_CONTROL::SETCARTESIANIMPEDANCE")
  (make-package "FRANKA_CONTROL::SETCARTESIANIMPEDANCE"))
(unless (find-package "FRANKA_CONTROL::SETCARTESIANIMPEDANCEREQUEST")
  (make-package "FRANKA_CONTROL::SETCARTESIANIMPEDANCEREQUEST"))
(unless (find-package "FRANKA_CONTROL::SETCARTESIANIMPEDANCERESPONSE")
  (make-package "FRANKA_CONTROL::SETCARTESIANIMPEDANCERESPONSE"))

(in-package "ROS")





(defclass franka_control::SetCartesianImpedanceRequest
  :super ros::object
  :slots (_cartesian_stiffness ))

(defmethod franka_control::SetCartesianImpedanceRequest
  (:init
   (&key
    ((:cartesian_stiffness __cartesian_stiffness) (make-array 6 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _cartesian_stiffness __cartesian_stiffness)
   self)
  (:cartesian_stiffness
   (&optional __cartesian_stiffness)
   (if __cartesian_stiffness (setq _cartesian_stiffness __cartesian_stiffness)) _cartesian_stiffness)
  (:serialization-length
   ()
   (+
    ;; float64[6] _cartesian_stiffness
    (* 8    6)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[6] _cartesian_stiffness
     (dotimes (i 6)
       (sys::poke (elt _cartesian_stiffness i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[6] _cartesian_stiffness
   (dotimes (i (length _cartesian_stiffness))
     (setf (elt _cartesian_stiffness i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(defclass franka_control::SetCartesianImpedanceResponse
  :super ros::object
  :slots (_success _error ))

(defmethod franka_control::SetCartesianImpedanceResponse
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

(defclass franka_control::SetCartesianImpedance
  :super ros::object
  :slots ())

(setf (get franka_control::SetCartesianImpedance :md5sum-) "c648a0b1340a53eac0c535568e9b5c60")
(setf (get franka_control::SetCartesianImpedance :datatype-) "franka_control/SetCartesianImpedance")
(setf (get franka_control::SetCartesianImpedance :request) franka_control::SetCartesianImpedanceRequest)
(setf (get franka_control::SetCartesianImpedance :response) franka_control::SetCartesianImpedanceResponse)

(defmethod franka_control::SetCartesianImpedanceRequest
  (:response () (instance franka_control::SetCartesianImpedanceResponse :init)))

(setf (get franka_control::SetCartesianImpedanceRequest :md5sum-) "c648a0b1340a53eac0c535568e9b5c60")
(setf (get franka_control::SetCartesianImpedanceRequest :datatype-) "franka_control/SetCartesianImpedanceRequest")
(setf (get franka_control::SetCartesianImpedanceRequest :definition-)
      "float64[6] cartesian_stiffness
---
bool success
string error


")

(setf (get franka_control::SetCartesianImpedanceResponse :md5sum-) "c648a0b1340a53eac0c535568e9b5c60")
(setf (get franka_control::SetCartesianImpedanceResponse :datatype-) "franka_control/SetCartesianImpedanceResponse")
(setf (get franka_control::SetCartesianImpedanceResponse :definition-)
      "float64[6] cartesian_stiffness
---
bool success
string error


")



(provide :franka_control/SetCartesianImpedance "c648a0b1340a53eac0c535568e9b5c60")


