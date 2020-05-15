;; Auto-generated. Do not edit!


(when (boundp 'franka_control::SetLoad)
  (if (not (find-package "FRANKA_CONTROL"))
    (make-package "FRANKA_CONTROL"))
  (shadow 'SetLoad (find-package "FRANKA_CONTROL")))
(unless (find-package "FRANKA_CONTROL::SETLOAD")
  (make-package "FRANKA_CONTROL::SETLOAD"))
(unless (find-package "FRANKA_CONTROL::SETLOADREQUEST")
  (make-package "FRANKA_CONTROL::SETLOADREQUEST"))
(unless (find-package "FRANKA_CONTROL::SETLOADRESPONSE")
  (make-package "FRANKA_CONTROL::SETLOADRESPONSE"))

(in-package "ROS")





(defclass franka_control::SetLoadRequest
  :super ros::object
  :slots (_mass _F_x_center_load _load_inertia ))

(defmethod franka_control::SetLoadRequest
  (:init
   (&key
    ((:mass __mass) 0.0)
    ((:F_x_center_load __F_x_center_load) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:load_inertia __load_inertia) (make-array 9 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _mass (float __mass))
   (setq _F_x_center_load __F_x_center_load)
   (setq _load_inertia __load_inertia)
   self)
  (:mass
   (&optional __mass)
   (if __mass (setq _mass __mass)) _mass)
  (:F_x_center_load
   (&optional __F_x_center_load)
   (if __F_x_center_load (setq _F_x_center_load __F_x_center_load)) _F_x_center_load)
  (:load_inertia
   (&optional __load_inertia)
   (if __load_inertia (setq _load_inertia __load_inertia)) _load_inertia)
  (:serialization-length
   ()
   (+
    ;; float64 _mass
    8
    ;; float64[3] _F_x_center_load
    (* 8    3)
    ;; float64[9] _load_inertia
    (* 8    9)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _mass
       (sys::poke _mass (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[3] _F_x_center_load
     (dotimes (i 3)
       (sys::poke (elt _F_x_center_load i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[9] _load_inertia
     (dotimes (i 9)
       (sys::poke (elt _load_inertia i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _mass
     (setq _mass (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[3] _F_x_center_load
   (dotimes (i (length _F_x_center_load))
     (setf (elt _F_x_center_load i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[9] _load_inertia
   (dotimes (i (length _load_inertia))
     (setf (elt _load_inertia i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(defclass franka_control::SetLoadResponse
  :super ros::object
  :slots (_success _error ))

(defmethod franka_control::SetLoadResponse
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

(defclass franka_control::SetLoad
  :super ros::object
  :slots ())

(setf (get franka_control::SetLoad :md5sum-) "c9a8ec436164dd9cbc1e5e137d358e0b")
(setf (get franka_control::SetLoad :datatype-) "franka_control/SetLoad")
(setf (get franka_control::SetLoad :request) franka_control::SetLoadRequest)
(setf (get franka_control::SetLoad :response) franka_control::SetLoadResponse)

(defmethod franka_control::SetLoadRequest
  (:response () (instance franka_control::SetLoadResponse :init)))

(setf (get franka_control::SetLoadRequest :md5sum-) "c9a8ec436164dd9cbc1e5e137d358e0b")
(setf (get franka_control::SetLoadRequest :datatype-) "franka_control/SetLoadRequest")
(setf (get franka_control::SetLoadRequest :definition-)
      "float64 mass
float64[3] F_x_center_load
float64[9] load_inertia
---
bool success
string error


")

(setf (get franka_control::SetLoadResponse :md5sum-) "c9a8ec436164dd9cbc1e5e137d358e0b")
(setf (get franka_control::SetLoadResponse :datatype-) "franka_control/SetLoadResponse")
(setf (get franka_control::SetLoadResponse :definition-)
      "float64 mass
float64[3] F_x_center_load
float64[9] load_inertia
---
bool success
string error


")



(provide :franka_control/SetLoad "c9a8ec436164dd9cbc1e5e137d358e0b")


