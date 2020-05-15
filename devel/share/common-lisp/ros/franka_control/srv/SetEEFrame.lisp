; Auto-generated. Do not edit!


(cl:in-package franka_control-srv)


;//! \htmlinclude SetEEFrame-request.msg.html

(cl:defclass <SetEEFrame-request> (roslisp-msg-protocol:ros-message)
  ((F_T_EE
    :reader F_T_EE
    :initarg :F_T_EE
    :type (cl:vector cl:float)
   :initform (cl:make-array 16 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SetEEFrame-request (<SetEEFrame-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetEEFrame-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetEEFrame-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_control-srv:<SetEEFrame-request> is deprecated: use franka_control-srv:SetEEFrame-request instead.")))

(cl:ensure-generic-function 'F_T_EE-val :lambda-list '(m))
(cl:defmethod F_T_EE-val ((m <SetEEFrame-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:F_T_EE-val is deprecated.  Use franka_control-srv:F_T_EE instead.")
  (F_T_EE m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetEEFrame-request>) ostream)
  "Serializes a message object of type '<SetEEFrame-request>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'F_T_EE))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetEEFrame-request>) istream)
  "Deserializes a message object of type '<SetEEFrame-request>"
  (cl:setf (cl:slot-value msg 'F_T_EE) (cl:make-array 16))
  (cl:let ((vals (cl:slot-value msg 'F_T_EE)))
    (cl:dotimes (i 16)
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetEEFrame-request>)))
  "Returns string type for a service object of type '<SetEEFrame-request>"
  "franka_control/SetEEFrameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEEFrame-request)))
  "Returns string type for a service object of type 'SetEEFrame-request"
  "franka_control/SetEEFrameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetEEFrame-request>)))
  "Returns md5sum for a message object of type '<SetEEFrame-request>"
  "1e4ea5c444c20450d45357b4d238129b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetEEFrame-request)))
  "Returns md5sum for a message object of type 'SetEEFrame-request"
  "1e4ea5c444c20450d45357b4d238129b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetEEFrame-request>)))
  "Returns full string definition for message of type '<SetEEFrame-request>"
  (cl:format cl:nil "float64[16] F_T_EE~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetEEFrame-request)))
  "Returns full string definition for message of type 'SetEEFrame-request"
  (cl:format cl:nil "float64[16] F_T_EE~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetEEFrame-request>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'F_T_EE) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetEEFrame-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetEEFrame-request
    (cl:cons ':F_T_EE (F_T_EE msg))
))
;//! \htmlinclude SetEEFrame-response.msg.html

(cl:defclass <SetEEFrame-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetEEFrame-response (<SetEEFrame-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetEEFrame-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetEEFrame-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_control-srv:<SetEEFrame-response> is deprecated: use franka_control-srv:SetEEFrame-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetEEFrame-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:success-val is deprecated.  Use franka_control-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetEEFrame-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:error-val is deprecated.  Use franka_control-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetEEFrame-response>) ostream)
  "Serializes a message object of type '<SetEEFrame-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetEEFrame-response>) istream)
  "Deserializes a message object of type '<SetEEFrame-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetEEFrame-response>)))
  "Returns string type for a service object of type '<SetEEFrame-response>"
  "franka_control/SetEEFrameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEEFrame-response)))
  "Returns string type for a service object of type 'SetEEFrame-response"
  "franka_control/SetEEFrameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetEEFrame-response>)))
  "Returns md5sum for a message object of type '<SetEEFrame-response>"
  "1e4ea5c444c20450d45357b4d238129b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetEEFrame-response)))
  "Returns md5sum for a message object of type 'SetEEFrame-response"
  "1e4ea5c444c20450d45357b4d238129b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetEEFrame-response>)))
  "Returns full string definition for message of type '<SetEEFrame-response>"
  (cl:format cl:nil "bool success~%string error~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetEEFrame-response)))
  "Returns full string definition for message of type 'SetEEFrame-response"
  (cl:format cl:nil "bool success~%string error~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetEEFrame-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetEEFrame-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetEEFrame-response
    (cl:cons ':success (success msg))
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetEEFrame)))
  'SetEEFrame-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetEEFrame)))
  'SetEEFrame-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEEFrame)))
  "Returns string type for a service object of type '<SetEEFrame>"
  "franka_control/SetEEFrame")