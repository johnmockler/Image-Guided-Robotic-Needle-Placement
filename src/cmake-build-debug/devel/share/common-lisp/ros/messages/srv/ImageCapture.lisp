; Auto-generated. Do not edit!


(cl:in-package messages-srv)


;//! \htmlinclude ImageCapture-request.msg.html

(cl:defclass <ImageCapture-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ImageCapture-request (<ImageCapture-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImageCapture-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImageCapture-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name messages-srv:<ImageCapture-request> is deprecated: use messages-srv:ImageCapture-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <ImageCapture-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader messages-srv:x-val is deprecated.  Use messages-srv:x instead.")
  (x m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImageCapture-request>) ostream)
  "Serializes a message object of type '<ImageCapture-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'x) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImageCapture-request>) istream)
  "Deserializes a message object of type '<ImageCapture-request>"
    (cl:setf (cl:slot-value msg 'x) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImageCapture-request>)))
  "Returns string type for a service object of type '<ImageCapture-request>"
  "messages/ImageCaptureRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImageCapture-request)))
  "Returns string type for a service object of type 'ImageCapture-request"
  "messages/ImageCaptureRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImageCapture-request>)))
  "Returns md5sum for a message object of type '<ImageCapture-request>"
  "049e540a757cae7de9e26696e82f8da7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImageCapture-request)))
  "Returns md5sum for a message object of type 'ImageCapture-request"
  "049e540a757cae7de9e26696e82f8da7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImageCapture-request>)))
  "Returns full string definition for message of type '<ImageCapture-request>"
  (cl:format cl:nil "bool x~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImageCapture-request)))
  "Returns full string definition for message of type 'ImageCapture-request"
  (cl:format cl:nil "bool x~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImageCapture-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImageCapture-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ImageCapture-request
    (cl:cons ':x (x msg))
))
;//! \htmlinclude ImageCapture-response.msg.html

(cl:defclass <ImageCapture-response> (roslisp-msg-protocol:ros-message)
  ((y
    :reader y
    :initarg :y
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ImageCapture-response (<ImageCapture-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImageCapture-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImageCapture-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name messages-srv:<ImageCapture-response> is deprecated: use messages-srv:ImageCapture-response instead.")))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <ImageCapture-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader messages-srv:y-val is deprecated.  Use messages-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImageCapture-response>) ostream)
  "Serializes a message object of type '<ImageCapture-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'y) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImageCapture-response>) istream)
  "Deserializes a message object of type '<ImageCapture-response>"
    (cl:setf (cl:slot-value msg 'y) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImageCapture-response>)))
  "Returns string type for a service object of type '<ImageCapture-response>"
  "messages/ImageCaptureResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImageCapture-response)))
  "Returns string type for a service object of type 'ImageCapture-response"
  "messages/ImageCaptureResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImageCapture-response>)))
  "Returns md5sum for a message object of type '<ImageCapture-response>"
  "049e540a757cae7de9e26696e82f8da7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImageCapture-response)))
  "Returns md5sum for a message object of type 'ImageCapture-response"
  "049e540a757cae7de9e26696e82f8da7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImageCapture-response>)))
  "Returns full string definition for message of type '<ImageCapture-response>"
  (cl:format cl:nil "bool y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImageCapture-response)))
  "Returns full string definition for message of type 'ImageCapture-response"
  (cl:format cl:nil "bool y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImageCapture-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImageCapture-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ImageCapture-response
    (cl:cons ':y (y msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ImageCapture)))
  'ImageCapture-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ImageCapture)))
  'ImageCapture-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImageCapture)))
  "Returns string type for a service object of type '<ImageCapture>"
  "messages/ImageCapture")