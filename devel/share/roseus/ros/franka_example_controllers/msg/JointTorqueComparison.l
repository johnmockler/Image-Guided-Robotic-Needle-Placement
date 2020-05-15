;; Auto-generated. Do not edit!


(when (boundp 'franka_example_controllers::JointTorqueComparison)
  (if (not (find-package "FRANKA_EXAMPLE_CONTROLLERS"))
    (make-package "FRANKA_EXAMPLE_CONTROLLERS"))
  (shadow 'JointTorqueComparison (find-package "FRANKA_EXAMPLE_CONTROLLERS")))
(unless (find-package "FRANKA_EXAMPLE_CONTROLLERS::JOINTTORQUECOMPARISON")
  (make-package "FRANKA_EXAMPLE_CONTROLLERS::JOINTTORQUECOMPARISON"))

(in-package "ROS")
;;//! \htmlinclude JointTorqueComparison.msg.html


(defclass franka_example_controllers::JointTorqueComparison
  :super ros::object
  :slots (_tau_error _tau_commanded _tau_measured _root_mean_square_error ))

(defmethod franka_example_controllers::JointTorqueComparison
  (:init
   (&key
    ((:tau_error __tau_error) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:tau_commanded __tau_commanded) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:tau_measured __tau_measured) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:root_mean_square_error __root_mean_square_error) 0.0)
    )
   (send-super :init)
   (setq _tau_error __tau_error)
   (setq _tau_commanded __tau_commanded)
   (setq _tau_measured __tau_measured)
   (setq _root_mean_square_error (float __root_mean_square_error))
   self)
  (:tau_error
   (&optional __tau_error)
   (if __tau_error (setq _tau_error __tau_error)) _tau_error)
  (:tau_commanded
   (&optional __tau_commanded)
   (if __tau_commanded (setq _tau_commanded __tau_commanded)) _tau_commanded)
  (:tau_measured
   (&optional __tau_measured)
   (if __tau_measured (setq _tau_measured __tau_measured)) _tau_measured)
  (:root_mean_square_error
   (&optional __root_mean_square_error)
   (if __root_mean_square_error (setq _root_mean_square_error __root_mean_square_error)) _root_mean_square_error)
  (:serialization-length
   ()
   (+
    ;; float64[7] _tau_error
    (* 8    7)
    ;; float64[7] _tau_commanded
    (* 8    7)
    ;; float64[7] _tau_measured
    (* 8    7)
    ;; float64 _root_mean_square_error
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[7] _tau_error
     (dotimes (i 7)
       (sys::poke (elt _tau_error i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _tau_commanded
     (dotimes (i 7)
       (sys::poke (elt _tau_commanded i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _tau_measured
     (dotimes (i 7)
       (sys::poke (elt _tau_measured i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _root_mean_square_error
       (sys::poke _root_mean_square_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[7] _tau_error
   (dotimes (i (length _tau_error))
     (setf (elt _tau_error i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _tau_commanded
   (dotimes (i (length _tau_commanded))
     (setf (elt _tau_commanded i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _tau_measured
   (dotimes (i (length _tau_measured))
     (setf (elt _tau_measured i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64 _root_mean_square_error
     (setq _root_mean_square_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get franka_example_controllers::JointTorqueComparison :md5sum-) "6c09db90263c92a2e4e4d736f67bc033")
(setf (get franka_example_controllers::JointTorqueComparison :datatype-) "franka_example_controllers/JointTorqueComparison")
(setf (get franka_example_controllers::JointTorqueComparison :definition-)
      "float64[7] tau_error
float64[7] tau_commanded
float64[7] tau_measured
float64 root_mean_square_error

")



(provide :franka_example_controllers/JointTorqueComparison "6c09db90263c92a2e4e4d736f67bc033")


