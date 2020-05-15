; Auto-generated. Do not edit!


(cl:in-package franka_example_controllers-msg)


;//! \htmlinclude JointTorqueComparison.msg.html

(cl:defclass <JointTorqueComparison> (roslisp-msg-protocol:ros-message)
  ((tau_error
    :reader tau_error
    :initarg :tau_error
    :type (cl:vector cl:float)
   :initform (cl:make-array 7 :element-type 'cl:float :initial-element 0.0))
   (tau_commanded
    :reader tau_commanded
    :initarg :tau_commanded
    :type (cl:vector cl:float)
   :initform (cl:make-array 7 :element-type 'cl:float :initial-element 0.0))
   (tau_measured
    :reader tau_measured
    :initarg :tau_measured
    :type (cl:vector cl:float)
   :initform (cl:make-array 7 :element-type 'cl:float :initial-element 0.0))
   (root_mean_square_error
    :reader root_mean_square_error
    :initarg :root_mean_square_error
    :type cl:float
    :initform 0.0))
)

(cl:defclass JointTorqueComparison (<JointTorqueComparison>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointTorqueComparison>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointTorqueComparison)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_example_controllers-msg:<JointTorqueComparison> is deprecated: use franka_example_controllers-msg:JointTorqueComparison instead.")))

(cl:ensure-generic-function 'tau_error-val :lambda-list '(m))
(cl:defmethod tau_error-val ((m <JointTorqueComparison>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_example_controllers-msg:tau_error-val is deprecated.  Use franka_example_controllers-msg:tau_error instead.")
  (tau_error m))

(cl:ensure-generic-function 'tau_commanded-val :lambda-list '(m))
(cl:defmethod tau_commanded-val ((m <JointTorqueComparison>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_example_controllers-msg:tau_commanded-val is deprecated.  Use franka_example_controllers-msg:tau_commanded instead.")
  (tau_commanded m))

(cl:ensure-generic-function 'tau_measured-val :lambda-list '(m))
(cl:defmethod tau_measured-val ((m <JointTorqueComparison>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_example_controllers-msg:tau_measured-val is deprecated.  Use franka_example_controllers-msg:tau_measured instead.")
  (tau_measured m))

(cl:ensure-generic-function 'root_mean_square_error-val :lambda-list '(m))
(cl:defmethod root_mean_square_error-val ((m <JointTorqueComparison>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_example_controllers-msg:root_mean_square_error-val is deprecated.  Use franka_example_controllers-msg:root_mean_square_error instead.")
  (root_mean_square_error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointTorqueComparison>) ostream)
  "Serializes a message object of type '<JointTorqueComparison>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'tau_error))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'tau_commanded))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'tau_measured))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'root_mean_square_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointTorqueComparison>) istream)
  "Deserializes a message object of type '<JointTorqueComparison>"
  (cl:setf (cl:slot-value msg 'tau_error) (cl:make-array 7))
  (cl:let ((vals (cl:slot-value msg 'tau_error)))
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
  (cl:setf (cl:slot-value msg 'tau_commanded) (cl:make-array 7))
  (cl:let ((vals (cl:slot-value msg 'tau_commanded)))
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
  (cl:setf (cl:slot-value msg 'tau_measured) (cl:make-array 7))
  (cl:let ((vals (cl:slot-value msg 'tau_measured)))
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'root_mean_square_error) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointTorqueComparison>)))
  "Returns string type for a message object of type '<JointTorqueComparison>"
  "franka_example_controllers/JointTorqueComparison")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointTorqueComparison)))
  "Returns string type for a message object of type 'JointTorqueComparison"
  "franka_example_controllers/JointTorqueComparison")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointTorqueComparison>)))
  "Returns md5sum for a message object of type '<JointTorqueComparison>"
  "6c09db90263c92a2e4e4d736f67bc033")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointTorqueComparison)))
  "Returns md5sum for a message object of type 'JointTorqueComparison"
  "6c09db90263c92a2e4e4d736f67bc033")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointTorqueComparison>)))
  "Returns full string definition for message of type '<JointTorqueComparison>"
  (cl:format cl:nil "float64[7] tau_error~%float64[7] tau_commanded~%float64[7] tau_measured~%float64 root_mean_square_error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointTorqueComparison)))
  "Returns full string definition for message of type 'JointTorqueComparison"
  (cl:format cl:nil "float64[7] tau_error~%float64[7] tau_commanded~%float64[7] tau_measured~%float64 root_mean_square_error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointTorqueComparison>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'tau_error) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'tau_commanded) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'tau_measured) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointTorqueComparison>))
  "Converts a ROS message object to a list"
  (cl:list 'JointTorqueComparison
    (cl:cons ':tau_error (tau_error msg))
    (cl:cons ':tau_commanded (tau_commanded msg))
    (cl:cons ':tau_measured (tau_measured msg))
    (cl:cons ':root_mean_square_error (root_mean_square_error msg))
))
