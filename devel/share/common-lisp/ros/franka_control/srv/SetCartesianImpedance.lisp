; Auto-generated. Do not edit!


(cl:in-package franka_control-srv)


;//! \htmlinclude SetCartesianImpedance-request.msg.html

(cl:defclass <SetCartesianImpedance-request> (roslisp-msg-protocol:ros-message)
  ((cartesian_stiffness
    :reader cartesian_stiffness
    :initarg :cartesian_stiffness
    :type (cl:vector cl:float)
   :initform (cl:make-array 6 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SetCartesianImpedance-request (<SetCartesianImpedance-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetCartesianImpedance-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetCartesianImpedance-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_control-srv:<SetCartesianImpedance-request> is deprecated: use franka_control-srv:SetCartesianImpedance-request instead.")))

(cl:ensure-generic-function 'cartesian_stiffness-val :lambda-list '(m))
(cl:defmethod cartesian_stiffness-val ((m <SetCartesianImpedance-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:cartesian_stiffness-val is deprecated.  Use franka_control-srv:cartesian_stiffness instead.")
  (cartesian_stiffness m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetCartesianImpedance-request>) ostream)
  "Serializes a message object of type '<SetCartesianImpedance-request>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'cartesian_stiffness))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetCartesianImpedance-request>) istream)
  "Deserializes a message object of type '<SetCartesianImpedance-request>"
  (cl:setf (cl:slot-value msg 'cartesian_stiffness) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 'cartesian_stiffness)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetCartesianImpedance-request>)))
  "Returns string type for a service object of type '<SetCartesianImpedance-request>"
  "franka_control/SetCartesianImpedanceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetCartesianImpedance-request)))
  "Returns string type for a service object of type 'SetCartesianImpedance-request"
  "franka_control/SetCartesianImpedanceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetCartesianImpedance-request>)))
  "Returns md5sum for a message object of type '<SetCartesianImpedance-request>"
  "c648a0b1340a53eac0c535568e9b5c60")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetCartesianImpedance-request)))
  "Returns md5sum for a message object of type 'SetCartesianImpedance-request"
  "c648a0b1340a53eac0c535568e9b5c60")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetCartesianImpedance-request>)))
  "Returns full string definition for message of type '<SetCartesianImpedance-request>"
  (cl:format cl:nil "float64[6] cartesian_stiffness~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetCartesianImpedance-request)))
  "Returns full string definition for message of type 'SetCartesianImpedance-request"
  (cl:format cl:nil "float64[6] cartesian_stiffness~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetCartesianImpedance-request>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'cartesian_stiffness) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetCartesianImpedance-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetCartesianImpedance-request
    (cl:cons ':cartesian_stiffness (cartesian_stiffness msg))
))
;//! \htmlinclude SetCartesianImpedance-response.msg.html

(cl:defclass <SetCartesianImpedance-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetCartesianImpedance-response (<SetCartesianImpedance-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetCartesianImpedance-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetCartesianImpedance-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_control-srv:<SetCartesianImpedance-response> is deprecated: use franka_control-srv:SetCartesianImpedance-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetCartesianImpedance-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:success-val is deprecated.  Use franka_control-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetCartesianImpedance-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:error-val is deprecated.  Use franka_control-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetCartesianImpedance-response>) ostream)
  "Serializes a message object of type '<SetCartesianImpedance-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetCartesianImpedance-response>) istream)
  "Deserializes a message object of type '<SetCartesianImpedance-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetCartesianImpedance-response>)))
  "Returns string type for a service object of type '<SetCartesianImpedance-response>"
  "franka_control/SetCartesianImpedanceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetCartesianImpedance-response)))
  "Returns string type for a service object of type 'SetCartesianImpedance-response"
  "franka_control/SetCartesianImpedanceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetCartesianImpedance-response>)))
  "Returns md5sum for a message object of type '<SetCartesianImpedance-response>"
  "c648a0b1340a53eac0c535568e9b5c60")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetCartesianImpedance-response)))
  "Returns md5sum for a message object of type 'SetCartesianImpedance-response"
  "c648a0b1340a53eac0c535568e9b5c60")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetCartesianImpedance-response>)))
  "Returns full string definition for message of type '<SetCartesianImpedance-response>"
  (cl:format cl:nil "bool success~%string error~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetCartesianImpedance-response)))
  "Returns full string definition for message of type 'SetCartesianImpedance-response"
  (cl:format cl:nil "bool success~%string error~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetCartesianImpedance-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetCartesianImpedance-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetCartesianImpedance-response
    (cl:cons ':success (success msg))
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetCartesianImpedance)))
  'SetCartesianImpedance-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetCartesianImpedance)))
  'SetCartesianImpedance-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetCartesianImpedance)))
  "Returns string type for a service object of type '<SetCartesianImpedance>"
  "franka_control/SetCartesianImpedance")