
(cl:in-package :asdf)

(defsystem "franka_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Errors" :depends-on ("_package_Errors"))
    (:file "_package_Errors" :depends-on ("_package"))
    (:file "FrankaState" :depends-on ("_package_FrankaState"))
    (:file "_package_FrankaState" :depends-on ("_package"))
  ))