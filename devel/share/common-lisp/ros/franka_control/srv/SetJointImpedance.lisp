; Auto-generated. Do not edit!


(cl:in-package franka_control-srv)


;//! \htmlinclude SetJointImpedance-request.msg.html

(cl:defclass <SetJointImpedance-request> (roslisp-msg-protocol:ros-message)
  ((joint_stiffness
    :reader joint_stiffness
    :initarg :joint_stiffness
    :type (cl:vector cl:float)
   :initform (cl:make-array 7 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SetJointImpedance-request (<SetJointImpedance-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetJointImpedance-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetJointImpedance-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_control-srv:<SetJointImpedance-request> is deprecated: use franka_control-srv:SetJointImpedance-request instead.")))

(cl:ensure-generic-function 'joint_stiffness-val :lambda-list '(m))
(cl:defmethod joint_stiffness-val ((m <SetJointImpedance-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:joint_stiffness-val is deprecated.  Use franka_control-srv:joint_stiffness instead.")
  (joint_stiffness m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetJointImpedance-request>) ostream)
  "Serializes a message object of type '<SetJointImpedance-request>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'joint_stiffness))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetJointImpedance-request>) istream)
  "Deserializes a message object of type '<SetJointImpedance-request>"
  (cl:setf (cl:slot-value msg 'joint_stiffness) (cl:make-array 7))
  (cl:let ((vals (cl:slot-value msg 'joint_stiffness)))
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetJointImpedance-request>)))
  "Returns string type for a service object of type '<SetJointImpedance-request>"
  "franka_control/SetJointImpedanceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetJointImpedance-request)))
  "Returns string type for a service object of type 'SetJointImpedance-request"
  "franka_control/SetJointImpedanceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetJointImpedance-request>)))
  "Returns md5sum for a message object of type '<SetJointImpedance-request>"
  "f11c4defa2a13040512214f9d77dc982")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetJointImpedance-request)))
  "Returns md5sum for a message object of type 'SetJointImpedance-request"
  "f11c4defa2a13040512214f9d77dc982")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetJointImpedance-request>)))
  "Returns full string definition for message of type '<SetJointImpedance-request>"
  (cl:format cl:nil "float64[7] joint_stiffness~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetJointImpedance-request)))
  "Returns full string definition for message of type 'SetJointImpedance-request"
  (cl:format cl:nil "float64[7] joint_stiffness~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetJointImpedance-request>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_stiffness) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetJointImpedance-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetJointImpedance-request
    (cl:cons ':joint_stiffness (joint_stiffness msg))
))
;//! \htmlinclude SetJointImpedance-response.msg.html

(cl:defclass <SetJointImpedance-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetJointImpedance-response (<SetJointImpedance-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetJointImpedance-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetJointImpedance-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_control-srv:<SetJointImpedance-response> is deprecated: use franka_control-srv:SetJointImpedance-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetJointImpedance-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:success-val is deprecated.  Use franka_control-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetJointImpedance-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:error-val is deprecated.  Use franka_control-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetJointImpedance-response>) ostream)
  "Serializes a message object of type '<SetJointImpedance-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetJointImpedance-response>) istream)
  "Deserializes a message object of type '<SetJointImpedance-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetJointImpedance-response>)))
  "Returns string type for a service object of type '<SetJointImpedance-response>"
  "franka_control/SetJointImpedanceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetJointImpedance-response)))
  "Returns string type for a service object of type 'SetJointImpedance-response"
  "franka_control/SetJointImpedanceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetJointImpedance-response>)))
  "Returns md5sum for a message object of type '<SetJointImpedance-response>"
  "f11c4defa2a13040512214f9d77dc982")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetJointImpedance-response)))
  "Returns md5sum for a message object of type 'SetJointImpedance-response"
  "f11c4defa2a13040512214f9d77dc982")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetJointImpedance-response>)))
  "Returns full string definition for message of type '<SetJointImpedance-response>"
  (cl:format cl:nil "bool success~%string error~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetJointImpedance-response)))
  "Returns full string definition for message of type 'SetJointImpedance-response"
  (cl:format cl:nil "bool success~%string error~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetJointImpedance-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetJointImpedance-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetJointImpedance-response
    (cl:cons ':success (success msg))
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetJointImpedance)))
  'SetJointImpedance-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetJointImpedance)))
  'SetJointImpedance-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetJointImpedance)))
  "Returns string type for a service object of type '<SetJointImpedance>"
  "franka_control/SetJointImpedance")