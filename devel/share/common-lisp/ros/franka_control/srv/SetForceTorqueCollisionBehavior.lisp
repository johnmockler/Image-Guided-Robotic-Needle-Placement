; Auto-generated. Do not edit!


(cl:in-package franka_control-srv)


;//! \htmlinclude SetForceTorqueCollisionBehavior-request.msg.html

(cl:defclass <SetForceTorqueCollisionBehavior-request> (roslisp-msg-protocol:ros-message)
  ((lower_torque_thresholds_nominal
    :reader lower_torque_thresholds_nominal
    :initarg :lower_torque_thresholds_nominal
    :type (cl:vector cl:float)
   :initform (cl:make-array 7 :element-type 'cl:float :initial-element 0.0))
   (upper_torque_thresholds_nominal
    :reader upper_torque_thresholds_nominal
    :initarg :upper_torque_thresholds_nominal
    :type (cl:vector cl:float)
   :initform (cl:make-array 7 :element-type 'cl:float :initial-element 0.0))
   (lower_force_thresholds_nominal
    :reader lower_force_thresholds_nominal
    :initarg :lower_force_thresholds_nominal
    :type (cl:vector cl:float)
   :initform (cl:make-array 6 :element-type 'cl:float :initial-element 0.0))
   (upper_force_thresholds_nominal
    :reader upper_force_thresholds_nominal
    :initarg :upper_force_thresholds_nominal
    :type (cl:vector cl:float)
   :initform (cl:make-array 6 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SetForceTorqueCollisionBehavior-request (<SetForceTorqueCollisionBehavior-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetForceTorqueCollisionBehavior-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetForceTorqueCollisionBehavior-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_control-srv:<SetForceTorqueCollisionBehavior-request> is deprecated: use franka_control-srv:SetForceTorqueCollisionBehavior-request instead.")))

(cl:ensure-generic-function 'lower_torque_thresholds_nominal-val :lambda-list '(m))
(cl:defmethod lower_torque_thresholds_nominal-val ((m <SetForceTorqueCollisionBehavior-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:lower_torque_thresholds_nominal-val is deprecated.  Use franka_control-srv:lower_torque_thresholds_nominal instead.")
  (lower_torque_thresholds_nominal m))

(cl:ensure-generic-function 'upper_torque_thresholds_nominal-val :lambda-list '(m))
(cl:defmethod upper_torque_thresholds_nominal-val ((m <SetForceTorqueCollisionBehavior-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:upper_torque_thresholds_nominal-val is deprecated.  Use franka_control-srv:upper_torque_thresholds_nominal instead.")
  (upper_torque_thresholds_nominal m))

(cl:ensure-generic-function 'lower_force_thresholds_nominal-val :lambda-list '(m))
(cl:defmethod lower_force_thresholds_nominal-val ((m <SetForceTorqueCollisionBehavior-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:lower_force_thresholds_nominal-val is deprecated.  Use franka_control-srv:lower_force_thresholds_nominal instead.")
  (lower_force_thresholds_nominal m))

(cl:ensure-generic-function 'upper_force_thresholds_nominal-val :lambda-list '(m))
(cl:defmethod upper_force_thresholds_nominal-val ((m <SetForceTorqueCollisionBehavior-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:upper_force_thresholds_nominal-val is deprecated.  Use franka_control-srv:upper_force_thresholds_nominal instead.")
  (upper_force_thresholds_nominal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetForceTorqueCollisionBehavior-request>) ostream)
  "Serializes a message object of type '<SetForceTorqueCollisionBehavior-request>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'lower_torque_thresholds_nominal))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'upper_torque_thresholds_nominal))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'lower_force_thresholds_nominal))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'upper_force_thresholds_nominal))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetForceTorqueCollisionBehavior-request>) istream)
  "Deserializes a message object of type '<SetForceTorqueCollisionBehavior-request>"
  (cl:setf (cl:slot-value msg 'lower_torque_thresholds_nominal) (cl:make-array 7))
  (cl:let ((vals (cl:slot-value msg 'lower_torque_thresholds_nominal)))
    (cl:dotimes (i 7)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'upper_torque_thresholds_nominal) (cl:make-array 7))
  (cl:let ((vals (cl:slot-value msg 'upper_torque_thresholds_nominal)))
    (cl:dotimes (i 7)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'lower_force_thresholds_nominal) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 'lower_force_thresholds_nominal)))
    (cl:dotimes (i 6)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'upper_force_thresholds_nominal) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 'upper_force_thresholds_nominal)))
    (cl:dotimes (i 6)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetForceTorqueCollisionBehavior-request>)))
  "Returns string type for a service object of type '<SetForceTorqueCollisionBehavior-request>"
  "franka_control/SetForceTorqueCollisionBehaviorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetForceTorqueCollisionBehavior-request)))
  "Returns string type for a service object of type 'SetForceTorqueCollisionBehavior-request"
  "franka_control/SetForceTorqueCollisionBehaviorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetForceTorqueCollisionBehavior-request>)))
  "Returns md5sum for a message object of type '<SetForceTorqueCollisionBehavior-request>"
  "b1e592d1b6960bc05e6e3cba1eb02349")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetForceTorqueCollisionBehavior-request)))
  "Returns md5sum for a message object of type 'SetForceTorqueCollisionBehavior-request"
  "b1e592d1b6960bc05e6e3cba1eb02349")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetForceTorqueCollisionBehavior-request>)))
  "Returns full string definition for message of type '<SetForceTorqueCollisionBehavior-request>"
  (cl:format cl:nil "float64[7] lower_torque_thresholds_nominal~%float64[7] upper_torque_thresholds_nominal~%float64[6] lower_force_thresholds_nominal~%float64[6] upper_force_thresholds_nominal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetForceTorqueCollisionBehavior-request)))
  "Returns full string definition for message of type 'SetForceTorqueCollisionBehavior-request"
  (cl:format cl:nil "float64[7] lower_torque_thresholds_nominal~%float64[7] upper_torque_thresholds_nominal~%float64[6] lower_force_thresholds_nominal~%float64[6] upper_force_thresholds_nominal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetForceTorqueCollisionBehavior-request>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'lower_torque_thresholds_nominal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'upper_torque_thresholds_nominal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'lower_force_thresholds_nominal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'upper_force_thresholds_nominal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetForceTorqueCollisionBehavior-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetForceTorqueCollisionBehavior-request
    (cl:cons ':lower_torque_thresholds_nominal (lower_torque_thresholds_nominal msg))
    (cl:cons ':upper_torque_thresholds_nominal (upper_torque_thresholds_nominal msg))
    (cl:cons ':lower_force_thresholds_nominal (lower_force_thresholds_nominal msg))
    (cl:cons ':upper_force_thresholds_nominal (upper_force_thresholds_nominal msg))
))
;//! \htmlinclude SetForceTorqueCollisionBehavior-response.msg.html

(cl:defclass <SetForceTorqueCollisionBehavior-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (error
    :reader error
    :initarg :error
    :type cl:string
    :initform ""))
)

(cl:defclass SetForceTorqueCollisionBehavior-response (<SetForceTorqueCollisionBehavior-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetForceTorqueCollisionBehavior-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetForceTorqueCollisionBehavior-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_control-srv:<SetForceTorqueCollisionBehavior-response> is deprecated: use franka_control-srv:SetForceTorqueCollisionBehavior-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetForceTorqueCollisionBehavior-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:success-val is deprecated.  Use franka_control-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetForceTorqueCollisionBehavior-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:error-val is deprecated.  Use franka_control-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetForceTorqueCollisionBehavior-response>) ostream)
  "Serializes a message object of type '<SetForceTorqueCollisionBehavior-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetForceTorqueCollisionBehavior-response>) istream)
  "Deserializes a message object of type '<SetForceTorqueCollisionBehavior-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'error) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetForceTorqueCollisionBehavior-response>)))
  "Returns string type for a service object of type '<SetForceTorqueCollisionBehavior-response>"
  "franka_control/SetForceTorqueCollisionBehaviorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetForceTorqueCollisionBehavior-response)))
  "Returns string type for a service object of type 'SetForceTorqueCollisionBehavior-response"
  "franka_control/SetForceTorqueCollisionBehaviorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetForceTorqueCollisionBehavior-response>)))
  "Returns md5sum for a message object of type '<SetForceTorqueCollisionBehavior-response>"
  "b1e592d1b6960bc05e6e3cba1eb02349")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetForceTorqueCollisionBehavior-response)))
  "Returns md5sum for a message object of type 'SetForceTorqueCollisionBehavior-response"
  "b1e592d1b6960bc05e6e3cba1eb02349")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetForceTorqueCollisionBehavior-response>)))
  "Returns full string definition for message of type '<SetForceTorqueCollisionBehavior-response>"
  (cl:format cl:nil "bool success~%string error~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetForceTorqueCollisionBehavior-response)))
  "Returns full string definition for message of type 'SetForceTorqueCollisionBehavior-response"
  (cl:format cl:nil "bool success~%string error~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetForceTorqueCollisionBehavior-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetForceTorqueCollisionBehavior-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetForceTorqueCollisionBehavior-response
    (cl:cons ':success (success msg))
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetForceTorqueCollisionBehavior)))
  'SetForceTorqueCollisionBehavior-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetForceTorqueCollisionBehavior)))
  'SetForceTorqueCollisionBehavior-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetForceTorqueCollisionBehavior)))
  "Returns string type for a service object of type '<SetForceTorqueCollisionBehavior>"
  "franka_control/SetForceTorqueCollisionBehavior")