
(cl:in-package :asdf)

(defsystem "messages-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ImageCapture" :depends-on ("_package_ImageCapture"))
    (:file "_package_ImageCapture" :depends-on ("_package"))
  ))