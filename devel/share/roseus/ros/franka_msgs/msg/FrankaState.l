;; Auto-generated. Do not edit!


(when (boundp 'franka_msgs::FrankaState)
  (if (not (find-package "FRANKA_MSGS"))
    (make-package "FRANKA_MSGS"))
  (shadow 'FrankaState (find-package "FRANKA_MSGS")))
(unless (find-package "FRANKA_MSGS::FRANKASTATE")
  (make-package "FRANKA_MSGS::FRANKASTATE"))

(in-package "ROS")
;;//! \htmlinclude FrankaState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*ROBOT_MODE_OTHER*" (find-package "FRANKA_MSGS::FRANKASTATE"))
(shadow '*ROBOT_MODE_OTHER* (find-package "FRANKA_MSGS::FRANKASTATE"))
(defconstant franka_msgs::FrankaState::*ROBOT_MODE_OTHER* 0)
(intern "*ROBOT_MODE_IDLE*" (find-package "FRANKA_MSGS::FRANKASTATE"))
(shadow '*ROBOT_MODE_IDLE* (find-package "FRANKA_MSGS::FRANKASTATE"))
(defconstant franka_msgs::FrankaState::*ROBOT_MODE_IDLE* 1)
(intern "*ROBOT_MODE_MOVE*" (find-package "FRANKA_MSGS::FRANKASTATE"))
(shadow '*ROBOT_MODE_MOVE* (find-package "FRANKA_MSGS::FRANKASTATE"))
(defconstant franka_msgs::FrankaState::*ROBOT_MODE_MOVE* 2)
(intern "*ROBOT_MODE_GUIDING*" (find-package "FRANKA_MSGS::FRANKASTATE"))
(shadow '*ROBOT_MODE_GUIDING* (find-package "FRANKA_MSGS::FRANKASTATE"))
(defconstant franka_msgs::FrankaState::*ROBOT_MODE_GUIDING* 3)
(intern "*ROBOT_MODE_REFLEX*" (find-package "FRANKA_MSGS::FRANKASTATE"))
(shadow '*ROBOT_MODE_REFLEX* (find-package "FRANKA_MSGS::FRANKASTATE"))
(defconstant franka_msgs::FrankaState::*ROBOT_MODE_REFLEX* 4)
(intern "*ROBOT_MODE_USER_STOPPED*" (find-package "FRANKA_MSGS::FRANKASTATE"))
(shadow '*ROBOT_MODE_USER_STOPPED* (find-package "FRANKA_MSGS::FRANKASTATE"))
(defconstant franka_msgs::FrankaState::*ROBOT_MODE_USER_STOPPED* 5)
(intern "*ROBOT_MODE_AUTOMATIC_ERROR_RECOVERY*" (find-package "FRANKA_MSGS::FRANKASTATE"))
(shadow '*ROBOT_MODE_AUTOMATIC_ERROR_RECOVERY* (find-package "FRANKA_MSGS::FRANKASTATE"))
(defconstant franka_msgs::FrankaState::*ROBOT_MODE_AUTOMATIC_ERROR_RECOVERY* 6)
(defclass franka_msgs::FrankaState
  :super ros::object
  :slots (_header _cartesian_collision _cartesian_contact _q _q_d _dq _dq_d _theta _dtheta _tau_J _dtau_J _tau_J_d _K_F_ext_hat_K _elbow _elbow_d _joint_collision _joint_contact _O_F_ext_hat_K _tau_ext_hat_filtered _m_ee _F_x_Cee _I_ee _m_load _F_x_Cload _I_load _m_total _F_x_Ctotal _I_total _O_T_EE _O_T_EE_d _F_T_EE _EE_T_K _time _robot_mode _current_errors _last_motion_errors ))

(defmethod franka_msgs::FrankaState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:cartesian_collision __cartesian_collision) (make-array 6 :initial-element 0.0 :element-type :float))
    ((:cartesian_contact __cartesian_contact) (make-array 6 :initial-element 0.0 :element-type :float))
    ((:q __q) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:q_d __q_d) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:dq __dq) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:dq_d __dq_d) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:theta __theta) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:dtheta __dtheta) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:tau_J __tau_J) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:dtau_J __dtau_J) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:tau_J_d __tau_J_d) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:K_F_ext_hat_K __K_F_ext_hat_K) (make-array 6 :initial-element 0.0 :element-type :float))
    ((:elbow __elbow) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:elbow_d __elbow_d) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:joint_collision __joint_collision) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:joint_contact __joint_contact) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:O_F_ext_hat_K __O_F_ext_hat_K) (make-array 6 :initial-element 0.0 :element-type :float))
    ((:tau_ext_hat_filtered __tau_ext_hat_filtered) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:m_ee __m_ee) 0.0)
    ((:F_x_Cee __F_x_Cee) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:I_ee __I_ee) (make-array 9 :initial-element 0.0 :element-type :float))
    ((:m_load __m_load) 0.0)
    ((:F_x_Cload __F_x_Cload) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:I_load __I_load) (make-array 9 :initial-element 0.0 :element-type :float))
    ((:m_total __m_total) 0.0)
    ((:F_x_Ctotal __F_x_Ctotal) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:I_total __I_total) (make-array 9 :initial-element 0.0 :element-type :float))
    ((:O_T_EE __O_T_EE) (make-array 16 :initial-element 0.0 :element-type :float))
    ((:O_T_EE_d __O_T_EE_d) (make-array 16 :initial-element 0.0 :element-type :float))
    ((:F_T_EE __F_T_EE) (make-array 16 :initial-element 0.0 :element-type :float))
    ((:EE_T_K __EE_T_K) (make-array 16 :initial-element 0.0 :element-type :float))
    ((:time __time) 0.0)
    ((:robot_mode __robot_mode) 0)
    ((:current_errors __current_errors) (instance franka_msgs::Errors :init))
    ((:last_motion_errors __last_motion_errors) (instance franka_msgs::Errors :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _cartesian_collision __cartesian_collision)
   (setq _cartesian_contact __cartesian_contact)
   (setq _q __q)
   (setq _q_d __q_d)
   (setq _dq __dq)
   (setq _dq_d __dq_d)
   (setq _theta __theta)
   (setq _dtheta __dtheta)
   (setq _tau_J __tau_J)
   (setq _dtau_J __dtau_J)
   (setq _tau_J_d __tau_J_d)
   (setq _K_F_ext_hat_K __K_F_ext_hat_K)
   (setq _elbow __elbow)
   (setq _elbow_d __elbow_d)
   (setq _joint_collision __joint_collision)
   (setq _joint_contact __joint_contact)
   (setq _O_F_ext_hat_K __O_F_ext_hat_K)
   (setq _tau_ext_hat_filtered __tau_ext_hat_filtered)
   (setq _m_ee (float __m_ee))
   (setq _F_x_Cee __F_x_Cee)
   (setq _I_ee __I_ee)
   (setq _m_load (float __m_load))
   (setq _F_x_Cload __F_x_Cload)
   (setq _I_load __I_load)
   (setq _m_total (float __m_total))
   (setq _F_x_Ctotal __F_x_Ctotal)
   (setq _I_total __I_total)
   (setq _O_T_EE __O_T_EE)
   (setq _O_T_EE_d __O_T_EE_d)
   (setq _F_T_EE __F_T_EE)
   (setq _EE_T_K __EE_T_K)
   (setq _time (float __time))
   (setq _robot_mode (round __robot_mode))
   (setq _current_errors __current_errors)
   (setq _last_motion_errors __last_motion_errors)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:cartesian_collision
   (&optional __cartesian_collision)
   (if __cartesian_collision (setq _cartesian_collision __cartesian_collision)) _cartesian_collision)
  (:cartesian_contact
   (&optional __cartesian_contact)
   (if __cartesian_contact (setq _cartesian_contact __cartesian_contact)) _cartesian_contact)
  (:q
   (&optional __q)
   (if __q (setq _q __q)) _q)
  (:q_d
   (&optional __q_d)
   (if __q_d (setq _q_d __q_d)) _q_d)
  (:dq
   (&optional __dq)
   (if __dq (setq _dq __dq)) _dq)
  (:dq_d
   (&optional __dq_d)
   (if __dq_d (setq _dq_d __dq_d)) _dq_d)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:dtheta
   (&optional __dtheta)
   (if __dtheta (setq _dtheta __dtheta)) _dtheta)
  (:tau_J
   (&optional __tau_J)
   (if __tau_J (setq _tau_J __tau_J)) _tau_J)
  (:dtau_J
   (&optional __dtau_J)
   (if __dtau_J (setq _dtau_J __dtau_J)) _dtau_J)
  (:tau_J_d
   (&optional __tau_J_d)
   (if __tau_J_d (setq _tau_J_d __tau_J_d)) _tau_J_d)
  (:K_F_ext_hat_K
   (&optional __K_F_ext_hat_K)
   (if __K_F_ext_hat_K (setq _K_F_ext_hat_K __K_F_ext_hat_K)) _K_F_ext_hat_K)
  (:elbow
   (&optional __elbow)
   (if __elbow (setq _elbow __elbow)) _elbow)
  (:elbow_d
   (&optional __elbow_d)
   (if __elbow_d (setq _elbow_d __elbow_d)) _elbow_d)
  (:joint_collision
   (&optional __joint_collision)
   (if __joint_collision (setq _joint_collision __joint_collision)) _joint_collision)
  (:joint_contact
   (&optional __joint_contact)
   (if __joint_contact (setq _joint_contact __joint_contact)) _joint_contact)
  (:O_F_ext_hat_K
   (&optional __O_F_ext_hat_K)
   (if __O_F_ext_hat_K (setq _O_F_ext_hat_K __O_F_ext_hat_K)) _O_F_ext_hat_K)
  (:tau_ext_hat_filtered
   (&optional __tau_ext_hat_filtered)
   (if __tau_ext_hat_filtered (setq _tau_ext_hat_filtered __tau_ext_hat_filtered)) _tau_ext_hat_filtered)
  (:m_ee
   (&optional __m_ee)
   (if __m_ee (setq _m_ee __m_ee)) _m_ee)
  (:F_x_Cee
   (&optional __F_x_Cee)
   (if __F_x_Cee (setq _F_x_Cee __F_x_Cee)) _F_x_Cee)
  (:I_ee
   (&optional __I_ee)
   (if __I_ee (setq _I_ee __I_ee)) _I_ee)
  (:m_load
   (&optional __m_load)
   (if __m_load (setq _m_load __m_load)) _m_load)
  (:F_x_Cload
   (&optional __F_x_Cload)
   (if __F_x_Cload (setq _F_x_Cload __F_x_Cload)) _F_x_Cload)
  (:I_load
   (&optional __I_load)
   (if __I_load (setq _I_load __I_load)) _I_load)
  (:m_total
   (&optional __m_total)
   (if __m_total (setq _m_total __m_total)) _m_total)
  (:F_x_Ctotal
   (&optional __F_x_Ctotal)
   (if __F_x_Ctotal (setq _F_x_Ctotal __F_x_Ctotal)) _F_x_Ctotal)
  (:I_total
   (&optional __I_total)
   (if __I_total (setq _I_total __I_total)) _I_total)
  (:O_T_EE
   (&optional __O_T_EE)
   (if __O_T_EE (setq _O_T_EE __O_T_EE)) _O_T_EE)
  (:O_T_EE_d
   (&optional __O_T_EE_d)
   (if __O_T_EE_d (setq _O_T_EE_d __O_T_EE_d)) _O_T_EE_d)
  (:F_T_EE
   (&optional __F_T_EE)
   (if __F_T_EE (setq _F_T_EE __F_T_EE)) _F_T_EE)
  (:EE_T_K
   (&optional __EE_T_K)
   (if __EE_T_K (setq _EE_T_K __EE_T_K)) _EE_T_K)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:robot_mode
   (&optional __robot_mode)
   (if __robot_mode (setq _robot_mode __robot_mode)) _robot_mode)
  (:current_errors
   (&rest __current_errors)
   (if (keywordp (car __current_errors))
       (send* _current_errors __current_errors)
     (progn
       (if __current_errors (setq _current_errors (car __current_errors)))
       _current_errors)))
  (:last_motion_errors
   (&rest __last_motion_errors)
   (if (keywordp (car __last_motion_errors))
       (send* _last_motion_errors __last_motion_errors)
     (progn
       (if __last_motion_errors (setq _last_motion_errors (car __last_motion_errors)))
       _last_motion_errors)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[6] _cartesian_collision
    (* 8    6)
    ;; float64[6] _cartesian_contact
    (* 8    6)
    ;; float64[7] _q
    (* 8    7)
    ;; float64[7] _q_d
    (* 8    7)
    ;; float64[7] _dq
    (* 8    7)
    ;; float64[7] _dq_d
    (* 8    7)
    ;; float64[7] _theta
    (* 8    7)
    ;; float64[7] _dtheta
    (* 8    7)
    ;; float64[7] _tau_J
    (* 8    7)
    ;; float64[7] _dtau_J
    (* 8    7)
    ;; float64[7] _tau_J_d
    (* 8    7)
    ;; float64[6] _K_F_ext_hat_K
    (* 8    6)
    ;; float64[2] _elbow
    (* 8    2)
    ;; float64[2] _elbow_d
    (* 8    2)
    ;; float64[7] _joint_collision
    (* 8    7)
    ;; float64[7] _joint_contact
    (* 8    7)
    ;; float64[6] _O_F_ext_hat_K
    (* 8    6)
    ;; float64[7] _tau_ext_hat_filtered
    (* 8    7)
    ;; float64 _m_ee
    8
    ;; float64[3] _F_x_Cee
    (* 8    3)
    ;; float64[9] _I_ee
    (* 8    9)
    ;; float64 _m_load
    8
    ;; float64[3] _F_x_Cload
    (* 8    3)
    ;; float64[9] _I_load
    (* 8    9)
    ;; float64 _m_total
    8
    ;; float64[3] _F_x_Ctotal
    (* 8    3)
    ;; float64[9] _I_total
    (* 8    9)
    ;; float64[16] _O_T_EE
    (* 8    16)
    ;; float64[16] _O_T_EE_d
    (* 8    16)
    ;; float64[16] _F_T_EE
    (* 8    16)
    ;; float64[16] _EE_T_K
    (* 8    16)
    ;; float64 _time
    8
    ;; uint8 _robot_mode
    1
    ;; franka_msgs/Errors _current_errors
    (send _current_errors :serialization-length)
    ;; franka_msgs/Errors _last_motion_errors
    (send _last_motion_errors :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64[6] _cartesian_collision
     (dotimes (i 6)
       (sys::poke (elt _cartesian_collision i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[6] _cartesian_contact
     (dotimes (i 6)
       (sys::poke (elt _cartesian_contact i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _q
     (dotimes (i 7)
       (sys::poke (elt _q i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _q_d
     (dotimes (i 7)
       (sys::poke (elt _q_d i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _dq
     (dotimes (i 7)
       (sys::poke (elt _dq i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _dq_d
     (dotimes (i 7)
       (sys::poke (elt _dq_d i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _theta
     (dotimes (i 7)
       (sys::poke (elt _theta i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _dtheta
     (dotimes (i 7)
       (sys::poke (elt _dtheta i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _tau_J
     (dotimes (i 7)
       (sys::poke (elt _tau_J i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _dtau_J
     (dotimes (i 7)
       (sys::poke (elt _dtau_J i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _tau_J_d
     (dotimes (i 7)
       (sys::poke (elt _tau_J_d i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[6] _K_F_ext_hat_K
     (dotimes (i 6)
       (sys::poke (elt _K_F_ext_hat_K i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[2] _elbow
     (dotimes (i 2)
       (sys::poke (elt _elbow i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[2] _elbow_d
     (dotimes (i 2)
       (sys::poke (elt _elbow_d i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _joint_collision
     (dotimes (i 7)
       (sys::poke (elt _joint_collision i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _joint_contact
     (dotimes (i 7)
       (sys::poke (elt _joint_contact i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[6] _O_F_ext_hat_K
     (dotimes (i 6)
       (sys::poke (elt _O_F_ext_hat_K i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[7] _tau_ext_hat_filtered
     (dotimes (i 7)
       (sys::poke (elt _tau_ext_hat_filtered i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _m_ee
       (sys::poke _m_ee (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[3] _F_x_Cee
     (dotimes (i 3)
       (sys::poke (elt _F_x_Cee i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[9] _I_ee
     (dotimes (i 9)
       (sys::poke (elt _I_ee i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _m_load
       (sys::poke _m_load (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[3] _F_x_Cload
     (dotimes (i 3)
       (sys::poke (elt _F_x_Cload i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[9] _I_load
     (dotimes (i 9)
       (sys::poke (elt _I_load i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _m_total
       (sys::poke _m_total (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[3] _F_x_Ctotal
     (dotimes (i 3)
       (sys::poke (elt _F_x_Ctotal i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[9] _I_total
     (dotimes (i 9)
       (sys::poke (elt _I_total i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[16] _O_T_EE
     (dotimes (i 16)
       (sys::poke (elt _O_T_EE i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[16] _O_T_EE_d
     (dotimes (i 16)
       (sys::poke (elt _O_T_EE_d i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[16] _F_T_EE
     (dotimes (i 16)
       (sys::poke (elt _F_T_EE i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[16] _EE_T_K
     (dotimes (i 16)
       (sys::poke (elt _EE_T_K i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _time
       (sys::poke _time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _robot_mode
       (write-byte _robot_mode s)
     ;; franka_msgs/Errors _current_errors
       (send _current_errors :serialize s)
     ;; franka_msgs/Errors _last_motion_errors
       (send _last_motion_errors :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64[6] _cartesian_collision
   (dotimes (i (length _cartesian_collision))
     (setf (elt _cartesian_collision i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[6] _cartesian_contact
   (dotimes (i (length _cartesian_contact))
     (setf (elt _cartesian_contact i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _q
   (dotimes (i (length _q))
     (setf (elt _q i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _q_d
   (dotimes (i (length _q_d))
     (setf (elt _q_d i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _dq
   (dotimes (i (length _dq))
     (setf (elt _dq i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _dq_d
   (dotimes (i (length _dq_d))
     (setf (elt _dq_d i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _theta
   (dotimes (i (length _theta))
     (setf (elt _theta i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _dtheta
   (dotimes (i (length _dtheta))
     (setf (elt _dtheta i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _tau_J
   (dotimes (i (length _tau_J))
     (setf (elt _tau_J i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _dtau_J
   (dotimes (i (length _dtau_J))
     (setf (elt _dtau_J i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _tau_J_d
   (dotimes (i (length _tau_J_d))
     (setf (elt _tau_J_d i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[6] _K_F_ext_hat_K
   (dotimes (i (length _K_F_ext_hat_K))
     (setf (elt _K_F_ext_hat_K i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[2] _elbow
   (dotimes (i (length _elbow))
     (setf (elt _elbow i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[2] _elbow_d
   (dotimes (i (length _elbow_d))
     (setf (elt _elbow_d i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _joint_collision
   (dotimes (i (length _joint_collision))
     (setf (elt _joint_collision i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _joint_contact
   (dotimes (i (length _joint_contact))
     (setf (elt _joint_contact i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[6] _O_F_ext_hat_K
   (dotimes (i (length _O_F_ext_hat_K))
     (setf (elt _O_F_ext_hat_K i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[7] _tau_ext_hat_filtered
   (dotimes (i (length _tau_ext_hat_filtered))
     (setf (elt _tau_ext_hat_filtered i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64 _m_ee
     (setq _m_ee (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[3] _F_x_Cee
   (dotimes (i (length _F_x_Cee))
     (setf (elt _F_x_Cee i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[9] _I_ee
   (dotimes (i (length _I_ee))
     (setf (elt _I_ee i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64 _m_load
     (setq _m_load (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[3] _F_x_Cload
   (dotimes (i (length _F_x_Cload))
     (setf (elt _F_x_Cload i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[9] _I_load
   (dotimes (i (length _I_load))
     (setf (elt _I_load i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64 _m_total
     (setq _m_total (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[3] _F_x_Ctotal
   (dotimes (i (length _F_x_Ctotal))
     (setf (elt _F_x_Ctotal i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[9] _I_total
   (dotimes (i (length _I_total))
     (setf (elt _I_total i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[16] _O_T_EE
   (dotimes (i (length _O_T_EE))
     (setf (elt _O_T_EE i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[16] _O_T_EE_d
   (dotimes (i (length _O_T_EE_d))
     (setf (elt _O_T_EE_d i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[16] _F_T_EE
   (dotimes (i (length _F_T_EE))
     (setf (elt _F_T_EE i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[16] _EE_T_K
   (dotimes (i (length _EE_T_K))
     (setf (elt _EE_T_K i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64 _time
     (setq _time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _robot_mode
     (setq _robot_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; franka_msgs/Errors _current_errors
     (send _current_errors :deserialize buf ptr-) (incf ptr- (send _current_errors :serialization-length))
   ;; franka_msgs/Errors _last_motion_errors
     (send _last_motion_errors :deserialize buf ptr-) (incf ptr- (send _last_motion_errors :serialization-length))
   ;;
   self)
  )

(setf (get franka_msgs::FrankaState :md5sum-) "7782ef1d208d3efc42f6a4cc3c41c065")
(setf (get franka_msgs::FrankaState :datatype-) "franka_msgs/FrankaState")
(setf (get franka_msgs::FrankaState :definition-)
      "std_msgs/Header header
float64[6] cartesian_collision
float64[6] cartesian_contact
float64[7] q
float64[7] q_d
float64[7] dq
float64[7] dq_d
float64[7] theta
float64[7] dtheta
float64[7] tau_J
float64[7] dtau_J
float64[7] tau_J_d
float64[6] K_F_ext_hat_K
float64[2] elbow
float64[2] elbow_d
float64[7] joint_collision
float64[7] joint_contact
float64[6] O_F_ext_hat_K
float64[7] tau_ext_hat_filtered
float64 m_ee
float64[3] F_x_Cee
float64[9] I_ee
float64 m_load
float64[3] F_x_Cload
float64[9] I_load
float64 m_total
float64[3] F_x_Ctotal
float64[9] I_total
float64[16] O_T_EE
float64[16] O_T_EE_d
float64[16] F_T_EE
float64[16] EE_T_K
float64 time
uint8 ROBOT_MODE_OTHER=0
uint8 ROBOT_MODE_IDLE=1
uint8 ROBOT_MODE_MOVE=2
uint8 ROBOT_MODE_GUIDING=3
uint8 ROBOT_MODE_REFLEX=4
uint8 ROBOT_MODE_USER_STOPPED=5
uint8 ROBOT_MODE_AUTOMATIC_ERROR_RECOVERY=6
uint8 robot_mode
franka_msgs/Errors current_errors
franka_msgs/Errors last_motion_errors

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: franka_msgs/Errors
bool joint_position_limits_violation
bool cartesian_position_limits_violation
bool self_collision_avoidance_violation
bool joint_velocity_violation
bool cartesian_velocity_violation
bool force_control_safety_violation
bool joint_reflex
bool cartesian_reflex
bool max_goal_pose_deviation_violation
bool max_path_pose_deviation_violation
bool cartesian_velocity_profile_safety_violation
bool joint_position_motion_generator_start_pose_invalid
bool joint_motion_generator_position_limits_violation
bool joint_motion_generator_velocity_limits_violation
bool joint_motion_generator_velocity_discontinuity
bool joint_motion_generator_acceleration_discontinuity
bool cartesian_position_motion_generator_start_pose_invalid
bool cartesian_motion_generator_elbow_limit_violation
bool cartesian_motion_generator_velocity_limits_violation
bool cartesian_motion_generator_velocity_discontinuity
bool cartesian_motion_generator_acceleration_discontinuity
bool cartesian_motion_generator_elbow_sign_inconsistent
bool cartesian_motion_generator_start_elbow_invalid
bool cartesian_motion_generator_joint_position_limits_violation
bool cartesian_motion_generator_joint_velocity_limits_violation
bool cartesian_motion_generator_joint_velocity_discontinuity
bool cartesian_motion_generator_joint_acceleration_discontinuity
bool cartesian_position_motion_generator_invalid_frame
bool force_controller_desired_force_tolerance_violation
bool controller_torque_discontinuity
bool start_elbow_sign_inconsistent
bool communication_constraints_violation
bool power_limit_violation
bool joint_p2p_insufficient_torque_for_planning
bool tau_j_range_violation
bool instability_detected

")



(provide :franka_msgs/FrankaState "7782ef1d208d3efc42f6a4cc3c41c065")


