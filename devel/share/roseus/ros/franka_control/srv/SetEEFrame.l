;; Auto-generated. Do not edit!


(when (boundp 'franka_control::SetEEFrame)
  (if (not (find-package "FRANKA_CONTROL"))
    (make-package "FRANKA_CONTROL"))
  (shadow 'SetEEFrame (find-package "FRANKA_CONTROL")))
(unless (find-package "FRANKA_CONTROL::SETEEFRAME")
  (make-package "FRANKA_CONTROL::SETEEFRAME"))
(unless (find-package "FRANKA_CONTROL::SETEEFRAMEREQUEST")
  (make-package "FRANKA_CONTROL::SETEEFRAMEREQUEST"))
(unless (find-package "FRANKA_CONTROL::SETEEFRAMERESPONSE")
  (make-package "FRANKA_CONTROL::SETEEFRAMERESPONSE"))

(in-package "ROS")





(defclass franka_control::SetEEFrameRequest
  :super ros::object
  :slots (_F_T_EE ))

(defmethod franka_control::SetEEFrameRequest
  (:init
   (&key
    ((:F_T_EE __F_T_EE) (make-array 16 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _F_T_EE __F_T_EE)
   self)
  (:F_T_EE
   (&optional __F_T_EE)
   (if __F_T_EE (setq _F_T_EE __F_T_EE)) _F_T_EE)
  (:serialization-length
   ()
   (+
    ;; float64[16] _F_T_EE
    (* 8    16)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[16] _F_T_EE
     (dotimes (i 16)
       (sys::poke (elt _F_T_EE i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[16] _F_T_EE
   (dotimes (i (length _F_T_EE))
     (setf (elt _F_T_EE i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(defclass franka_control::SetEEFrameResponse
  :super ros::object
  :slots (_success _error ))

(defmethod franka_control::SetEEFrameResponse
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

(defclass franka_control::SetEEFrame
  :super ros::object
  :slots ())

(setf (get franka_control::SetEEFrame :md5sum-) "1e4ea5c444c20450d45357b4d238129b")
(setf (get franka_control::SetEEFrame :datatype-) "franka_control/SetEEFrame")
(setf (get franka_control::SetEEFrame :request) franka_control::SetEEFrameRequest)
(setf (get franka_control::SetEEFrame :response) franka_control::SetEEFrameResponse)

(defmethod franka_control::SetEEFrameRequest
  (:response () (instance franka_control::SetEEFrameResponse :init)))

(setf (get franka_control::SetEEFrameRequest :md5sum-) "1e4ea5c444c20450d45357b4d238129b")
(setf (get franka_control::SetEEFrameRequest :datatype-) "franka_control/SetEEFrameRequest")
(setf (get franka_control::SetEEFrameRequest :definition-)
      "float64[16] F_T_EE
---
bool success
string error


")

(setf (get franka_control::SetEEFrameResponse :md5sum-) "1e4ea5c444c20450d45357b4d238129b")
(setf (get franka_control::SetEEFrameResponse :datatype-) "franka_control/SetEEFrameResponse")
(setf (get franka_control::SetEEFrameResponse :definition-)
      "float64[16] F_T_EE
---
bool success
string error


")



(provide :franka_control/SetEEFrame "1e4ea5c444c20450d45357b4d238129b")


