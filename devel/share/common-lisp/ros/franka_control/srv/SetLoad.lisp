; Auto-generated. Do not edit!


(cl:in-package franka_control-srv)


;//! \htmlinclude SetLoad-request.msg.html

(cl:defclass <SetLoad-request> (roslisp-msg-protocol:ros-message)
  ((mass
    :reader mass
    :initarg :mass
    :type cl:float
    :initform 0.0)
   (F_x_center_load
    :reader F_x_center_load
    :initarg :F_x_center_load
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (load_inertia
    :reader load_inertia
    :initarg :load_inertia
    :type (cl:vector cl:float)
   :initform (cl:make-array 9 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SetLoad-request (<SetLoad-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetLoad-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetLoad-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_control-srv:<SetLoad-request> is deprecated: use franka_control-srv:SetLoad-request instead.")))

(cl:ensure-generic-function 'mass-val :lambda-list '(m))
(cl:defmethod mass-val ((m <SetLoad-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:mass-val is deprecated.  Use franka_control-srv:mass instead.")
  (mass m))

(cl:ensure-generic-function 'F_x_center_load-val :lambda-list '(m))
(cl:defmethod F_x_center_load-val ((m <SetLoad-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:F_x_center_load-val is deprecated.  Use franka_control-srv:F_x_center_load instead.")
  (F_x_center_load m))

(cl:ensure-generic-function 'load_inertia-val :lambda-list '(m))
(cl:defmethod load_inertia-val ((m <SetLoad-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:load_inertia-val is deprecated.  Use franka_control-srv:load_inertia instead.")
  (load_inertia m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetLoad-request>) ostream)
  "Serializes a message object of type '<SetLoad-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'mass))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'F_x_center_load))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'load_inertia))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetLoad-request>) istream)
  "Deserializes a message object of type '<SetLoad-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mass) (roslisp-utils:decode-double-float-bits bits)))
  (cl:setf (cl:slot-value msg 'F_x_center_load) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'F_x_center_load)))
    (cl:dotimes (i 3)
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
  (cl:setf (cl:slot-value msg 'load_inertia) (cl:make-array 9))
  (cl:let ((vals (cl:slot-value msg 'load_inertia)))
    (cl:dotimes (i 9)
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetLoad-request>)))
  "Returns string type for a service object of type '<SetLoad-request>"
  "franka_control/SetLoadRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLoad-request)))
  "Returns string type for a service object of type 'SetLoad-request"
  "franka_control/SetLoadRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetLoad-request>)))
  "Returns md5sum for a message object of type '<SetLoad-request>"
  "c9a8ec436164dd9cbc1e5e137d358e0b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetLoad-request)))
  "Returns md5sum for a message object of type 'SetLoad-request"
  "c9a8ec436164dd9cbc1e5e137d358e0b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetLoad-request>)))
  "Returns full string definition for message of type '<SetLoad-request>"
  (cl:format cl:nil "float64 mass~%float64[3] F_x_center_load~%float64[9] load_inertia~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetLoad-request)))
  "Returns full string definition for message of type 'SetLoad-request"
  (cl:format cl:nil "float64 mass~%float64[3] F_x_center_load~%float64[9] load_inertia~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetLoad-request>))
  (cl:+ 0
     8
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'F_x_center_load) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'load_inertia) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetLoad-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetLoad-request
    (cl:cons ':mass (mass msg))
    (cl:cons ':F_x_center_load (F_x_center_load msg))
    (cl:cons ':load_inertia (load_inertia msg))
))
;//! \htmlinclude SetLoad-response.msg.html

(cl:defclass <SetLoad-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetLoad-response (<SetLoad-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetLoad-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetLoad-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_control-srv:<SetLoad-response> is deprecated: use franka_control-srv:SetLoad-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetLoad-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:success-val is deprecated.  Use franka_control-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetLoad-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_control-srv:error-val is deprecated.  Use franka_control-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetLoad-response>) ostream)
  "Serializes a message object of type '<SetLoad-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetLoad-response>) istream)
  "Deserializes a message object of type '<SetLoad-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetLoad-response>)))
  "Returns string type for a service object of type '<SetLoad-response>"
  "franka_control/SetLoadResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLoad-response)))
  "Returns string type for a service object of type 'SetLoad-response"
  "franka_control/SetLoadResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetLoad-response>)))
  "Returns md5sum for a message object of type '<SetLoad-response>"
  "c9a8ec436164dd9cbc1e5e137d358e0b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetLoad-response)))
  "Returns md5sum for a message object of type 'SetLoad-response"
  "c9a8ec436164dd9cbc1e5e137d358e0b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetLoad-response>)))
  "Returns full string definition for message of type '<SetLoad-response>"
  (cl:format cl:nil "bool success~%string error~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetLoad-response)))
  "Returns full string definition for message of type 'SetLoad-response"
  (cl:format cl:nil "bool success~%string error~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetLoad-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetLoad-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetLoad-response
    (cl:cons ':success (success msg))
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetLoad)))
  'SetLoad-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetLoad)))
  'SetLoad-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLoad)))
  "Returns string type for a service object of type '<SetLoad>"
  "franka_control/SetLoad")