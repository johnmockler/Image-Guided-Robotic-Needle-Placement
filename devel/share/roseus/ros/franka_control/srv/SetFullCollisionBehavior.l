;; Auto-generated. Do not edit!


(when (boundp 'franka_control::SetFullCollisionBehavior)
  (if (not (find-package "FRANKA_CONTROL"))
    (make-package "FRANKA_CONTROL"))
  (shadow 'SetFullCollisionBehavior (find-package "FRANKA_CONTROL")))
(unless (find-package "FRANKA_CONTROL::SETFULLCOLLISIONBEHAVIOR")
  (make-package "FRANKA_CONTROL::SETFULLCOLLISIONBEHAVIOR"))
(unless (find-package "FRANKA_CONTROL::SETFULLCOLLISIONBEHAVIORREQUEST")
  (make-package "FRANKA_CONTROL::SETFULLCOLLISIONBEHAVIORREQUEST"))
(unless (find-package "FRANKA_CONTROL::SETFULLCOLLISIONBEHAVIORRESPONSE")
  (make-package "FRANKA_CONTROL::SETFULLCOLLISIONBEHAVIORRESPONSE"))

(in-package "ROS")





(defclass franka_control::SetFullCollisionBehaviorRequest
  :super ros::object
  :slots (_lower_torque_thresholds_acceleration _upper_torque_thresholds_acceleration _lower_torque_thresholds_nominal _upper_torque_thresholds_nominal _lower_force_thresholds_acceleration _upper_force_thresholds_acceleration _lower_force_thresholds_nominal _upper_force_thresholds_nominal ))

(defmethod franka_control::SetFullCollisionBehaviorRequest
  (:init
   (&key
    ((:lower_torque_thresholds_acceleration __lower_torque_thresholds_acceleration) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:upper_torque_thresholds_acceleration __upper_torque_thresholds_acceleration) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:lower_torque_thresholds_nominal __lower_torque_thresholds_nominal) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:upper_torque_thresholds_nominal __upper_torque_thresholds_nominal) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:lower_force_thresholds_acceleration __lower_force_thresholds_acceleration) (make-array 6 :initial-element 0.0 :element-type :float))
    ((:upper_force_thresholds_acceleration __upper_force_thresholds_acceleration) (make-array 6 :initial-element 0.0 :element-type :float))
    ((:lower_force_thresholds_nominal __lower_force_thresholds_nominal) (make-array 6 :initial-element 0.0 :element-type :float))
    ((:upper_force_thresholds_nominal __upper_force_thresholds_nominal) (make-array 6 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _lower_torque_thresholds_acceleration __lower_torque_thresholds_acceleration)
   (setq _upper_torque_thresholds_acceleration __upper_torque_thresholds_acceleration)
   (setq _lower_torque_thresholds_nominal __lower_torque_thresholds_nominal)
   (setq _upper_torque_thresholds_nominal __upper_torque_thresholds_nominal)
   (setq _lower_force_thresholds_acceleration __lower_force_thresholds_acceleration)
   (setq _upper_force_thresholds_acceleration __upper_force_thresholds_acceleration)
   (setq _lower_force_thresholds_nominal __lower_force_thresholds_nominal)
   (setq _upper_force_thresholds_nominal __upper_force_thresholds_nominal)
   self)
  (:lower_torque_thresholds_acceleration
   (&optional __lower_torque_thresholds_acceleration)
   (if __lower_torque_thresholds_acceleration (setq _lower_torque_thresholds_acceleration __lower_torque_thresholds_acceleration)) _lower_torque_thresholds_acceleration)
  (:upper_torque_thresholds_acceleration
   (&optional __upper_torque_thresholds_acceleration)
   (if __upper_torque_thresholds_acceleration (setq _upper_torque_thresholds_acceleration __upper_torque_thresholds_acceleration)) _upper_torque_thresholds_acceleration)
  (:lower_torque_thresholds_nominal
   (&optional __lower_torque_thresholds_nominal)
   (if __lower_torque_thresholds_nominal (setq _lower_torque_thresholds_nominal __lower_torque_thresholds_nominal)) _lower_torque_thresholds_nominal)
  (:upper_torque_thresholds_nominal
   (&optional __upper_torque_thresholds_nominal)
   (if __upper_torque_thresholds_nominal (setq _upper_torque_thresholds_nominal __upper_torque_thresholds_nominal)) _upper_torque_thresholds_nominal)
  (:lower_force_thresholds_acceleration
   (&optional __lower_force_thresholds_acceleration)
   (if __lower_force_thresholds_acceleration (setq _lower_force_thresholds_acceleration __lower_force_thresholds_acceleration)) _lower_force_thresholds_acceleration)
  (:upper_force_thresholds_acceleration
   (&optional __upper_force_thresholds_acceleration)
   (if __upper_force_thresholds_acceleration (setq _upper_force_thresholds_acceleration __upper_force_thresholds_acceleration)) _upper_force_thresholds_acceleration)
  (:lower_force_thresholds_nominal
   (&optional __lower_force_thresholds_nominal)
   (if __lower_force_thresholds_nominal (setq _lower_force_thresholds_nominal __lower_force_thresholds_nominal)) _lower_force_thresholds_nominal)
  (:upper_force_thresholds_nominal
   (&optional __upper_force_thresholds_nominal)
   (if __upper_force_thresholds_nominal (setq _upper_force_thresholds_nominal __upper_force_thresholds_nominal)) _upper_force_thresholds_nominal)
  (:serialization-length
   ()
   (+
    ;; float64[7] _lower_torque_thresholds_acceleration
    (* 8    7)
    ;; float64[7] _upper_torque_thresholds_acceleration
    (* 8    7)
    ;; float64[7] _lower_torque_thresholds_nominal
    (* 8    7)
    ;; float64[7] _upper_torque_thresholds_nominal
    (* 8    7)
    ;; float64[6] _lower_force_thresholds_acceleration
    (* 8    6)
    ;; float64[6] _upper_force_thresholds_acceleration
    (* 8    6)
    ;; float64[6] _lower_force_thresholds_nominal
    (* 8    6)
    ;; float64[6] _upper_force_thresholds_nominal
    (* 8    6)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[7] _lower_torque_thresholds_acceleration
     (dotimes (i 7)
       (sys::poke (elt _lower_torque_thresholds_acceleration i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _upper_torque_thresholds_acceleration
     (dotimes (i 7)
       (sys::poke (elt _upper_torque_thresholds_acceleration i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _lower_torque_thresholds_nominal
     (dotimes (i 7)
       (sys::poke (elt _lower_torque_thresholds_nominal i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _upper_torque_thresholds_nominal
     (dotimes (i 7)
       (sys::poke (elt _upper_torque_thresholds_nominal i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[6] _lower_force_thresholds_acceleration
     (dotimes (i 6)
       (sys::poke (elt _lower_force_thresholds_acceleration i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[6] _upper_force_thresholds_acceleration
     (dotimes (i 6)
       (sys::poke (elt _upper_force_thresholds_acceleration i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[6] _lower_force_thresholds_nominal
     (dotimes (i 6)
       (sys::poke (elt _lower_force_thresholds_nominal i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[6] _upper_force_thresholds_nominal
     (dotimes (i 6)
       (sys::poke (elt _upper_force_thresholds_nominal i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[7] _lower_torque_thresholds_acceleration
   (dotimes (i (length _lower_torque_thresholds_acceleration))
     (setf (elt _lower_torque_thresholds_acceleration i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _upper_torque_thresholds_acceleration
   (dotimes (i (length _upper_torque_thresholds_acceleration))
     (setf (elt _upper_torque_thresholds_acceleration i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _lower_torque_thresholds_nominal
   (dotimes (i (length _lower_torque_thresholds_nominal))
     (setf (elt _lower_torque_thresholds_nominal i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _upper_torque_thresholds_nominal
   (dotimes (i (length _upper_torque_thresholds_nominal))
     (setf (elt _upper_torque_thresholds_nominal i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[6] _lower_force_thresholds_acceleration
   (dotimes (i (length _lower_force_thresholds_acceleration))
     (setf (elt _lower_force_thresholds_acceleration i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[6] _upper_force_thresholds_acceleration
   (dotimes (i (length _upper_force_thresholds_acceleration))
     (setf (elt _upper_force_thresholds_acceleration i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[6] _lower_force_thresholds_nominal
   (dotimes (i (length _lower_force_thresholds_nominal))
     (setf (elt _lower_force_thresholds_nominal i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[6] _upper_force_thresholds_nominal
   (dotimes (i (length _upper_force_thresholds_nominal))
     (setf (elt _upper_force_thresholds_nominal i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(defclass franka_control::SetFullCollisionBehaviorResponse
  :super ros::object
  :slots (_success _error ))

(defmethod franka_control::SetFullCollisionBehaviorResponse
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

(defclass franka_control::SetFullCollisionBehavior
  :super ros::object
  :slots ())

(setf (get franka_control::SetFullCollisionBehavior :md5sum-) "c6fef9a8ad446db9a39cca3b7bc200d8")
(setf (get franka_control::SetFullCollisionBehavior :datatype-) "franka_control/SetFullCollisionBehavior")
(setf (get franka_control::SetFullCollisionBehavior :request) franka_control::SetFullCollisionBehaviorRequest)
(setf (get franka_control::SetFullCollisionBehavior :response) franka_control::SetFullCollisionBehaviorResponse)

(defmethod franka_control::SetFullCollisionBehaviorRequest
  (:response () (instance franka_control::SetFullCollisionBehaviorResponse :init)))

(setf (get franka_control::SetFullCollisionBehaviorRequest :md5sum-) "c6fef9a8ad446db9a39cca3b7bc200d8")
(setf (get franka_control::SetFullCollisionBehaviorRequest :datatype-) "franka_control/SetFullCollisionBehaviorRequest")
(setf (get franka_control::SetFullCollisionBehaviorRequest :definition-)
      "float64[7] lower_torque_thresholds_acceleration
float64[7] upper_torque_thresholds_acceleration
float64[7] lower_torque_thresholds_nominal
float64[7] upper_torque_thresholds_nominal
float64[6] lower_force_thresholds_acceleration
float64[6] upper_force_thresholds_acceleration
float64[6] lower_force_thresholds_nominal
float64[6] upper_force_thresholds_nominal
---
bool success
string error


")

(setf (get franka_control::SetFullCollisionBehaviorResponse :md5sum-) "c6fef9a8ad446db9a39cca3b7bc200d8")
(setf (get franka_control::SetFullCollisionBehaviorResponse :datatype-) "franka_control/SetFullCollisionBehaviorResponse")
(setf (get franka_control::SetFullCollisionBehaviorResponse :definition-)
      "float64[7] lower_torque_thresholds_acceleration
float64[7] upper_torque_thresholds_acceleration
float64[7] lower_torque_thresholds_nominal
float64[7] upper_torque_thresholds_nominal
float64[6] lower_force_thresholds_acceleration
float64[6] upper_force_thresholds_acceleration
float64[6] lower_force_thresholds_nominal
float64[6] upper_force_thresholds_nominal
---
bool success
string error


")



(provide :franka_control/SetFullCollisionBehavior "c6fef9a8ad446db9a39cca3b7bc200d8")


