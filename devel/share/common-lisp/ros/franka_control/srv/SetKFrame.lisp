; Auto-generated. Do not edit!


(cl:in-package franka_control-srv)


;//! \htmlinclude SetKFrame-request.msg.html

(cl:defclass <SetKFrame-request> (roslisp-msg-protocol:ros-message)
  ((EE_T_K
    :reader EE_T_K
    :initarg :EE_T_K
    :type (cl:vector cl:float)
   :initform (cl:make-array 16 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SetKFrame-request (<SetKFrame-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetKFrame-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetKFrame-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_control-srv:<SetKFrame-request> is deprecated: use franka_control-srv:SetKFrame-request instead.")))

(cl:ensure-generic-function 'EE_T_K-val :lambda-list '(m))
(cl:defmethod EE_T_K-val ((m <SetKFrame-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:EE_T_K-val is deprecated.  Use franka_control-srv:EE_T_K instead.")
  (EE_T_K m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetKFrame-request>) ostream)
  "Serializes a message object of type '<SetKFrame-request>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'EE_T_K))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetKFrame-request>) istream)
  "Deserializes a message object of type '<SetKFrame-request>"
  (cl:setf (cl:slot-value msg 'EE_T_K) (cl:make-array 16))
  (cl:let ((vals (cl:slot-value msg 'EE_T_K)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetKFrame-request>)))
  "Returns string type for a service object of type '<SetKFrame-request>"
  "franka_control/SetKFrameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetKFrame-request)))
  "Returns string type for a service object of type 'SetKFrame-request"
  "franka_control/SetKFrameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetKFrame-request>)))
  "Returns md5sum for a message object of type '<SetKFrame-request>"
  "11b22d30e6a11a7b51828be575a77359")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetKFrame-request)))
  "Returns md5sum for a message object of type 'SetKFrame-request"
  "11b22d30e6a11a7b51828be575a77359")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetKFrame-request>)))
  "Returns full string definition for message of type '<SetKFrame-request>"
  (cl:format cl:nil "float64[16] EE_T_K~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetKFrame-request)))
  "Returns full string definition for message of type 'SetKFrame-request"
  (cl:format cl:nil "float64[16] EE_T_K~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetKFrame-request>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'EE_T_K) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetKFrame-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetKFrame-request
    (cl:cons ':EE_T_K (EE_T_K msg))
))
;//! \htmlinclude SetKFrame-response.msg.html

(cl:defclass <SetKFrame-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetKFrame-response (<SetKFrame-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetKFrame-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetKFrame-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_control-srv:<SetKFrame-response> is deprecated: use franka_control-srv:SetKFrame-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetKFrame-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:success-val is deprecated.  Use franka_control-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetKFrame-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:error-val is deprecated.  Use franka_control-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetKFrame-response>) ostream)
  "Serializes a message object of type '<SetKFrame-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetKFrame-response>) istream)
  "Deserializes a message object of type '<SetKFrame-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetKFrame-response>)))
  "Returns string type for a service object of type '<SetKFrame-response>"
  "franka_control/SetKFrameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetKFrame-response)))
  "Returns string type for a service object of type 'SetKFrame-response"
  "franka_control/SetKFrameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetKFrame-response>)))
  "Returns md5sum for a message object of type '<SetKFrame-response>"
  "11b22d30e6a11a7b51828be575a77359")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetKFrame-response)))
  "Returns md5sum for a message object of type 'SetKFrame-response"
  "11b22d30e6a11a7b51828be575a77359")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetKFrame-response>)))
  "Returns full string definition for message of type '<SetKFrame-response>"
  (cl:format cl:nil "bool success~%string error~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetKFrame-response)))
  "Returns full string definition for message of type 'SetKFrame-response"
  (cl:format cl:nil "bool success~%string error~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetKFrame-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetKFrame-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetKFrame-response
    (cl:cons ':success (success msg))
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetKFrame)))
  'SetKFrame-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetKFrame)))
  'SetKFrame-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetKFrame)))
  "Returns string type for a service object of type '<SetKFrame>"
  "franka_control/SetKFrame")