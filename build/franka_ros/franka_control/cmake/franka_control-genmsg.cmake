# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "franka_control: 7 messages, 7 services")

set(MSG_I_FLAGS "-Ifranka_control:/home/suyashs/rnm_group_2/devel/share/franka_control/msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(franka_control_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg" NAME_WE)
add_custom_target(_franka_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_control" "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg" ""
)

get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetForceTorqueCollisionBehavior.srv" NAME_WE)
add_custom_target(_franka_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_control" "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetForceTorqueCollisionBehavior.srv" ""
)

get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetFullCollisionBehavior.srv" NAME_WE)
add_custom_target(_franka_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_control" "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetFullCollisionBehavior.srv" ""
)

get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryAction.msg" NAME_WE)
add_custom_target(_franka_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_control" "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryAction.msg" "franka_control/ErrorRecoveryActionResult:actionlib_msgs/GoalID:franka_control/ErrorRecoveryActionGoal:actionlib_msgs/GoalStatus:franka_control/ErrorRecoveryFeedback:franka_control/ErrorRecoveryResult:std_msgs/Header:franka_control/ErrorRecoveryGoal:franka_control/ErrorRecoveryActionFeedback"
)

get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg" NAME_WE)
add_custom_target(_franka_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_control" "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg" ""
)

get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetKFrame.srv" NAME_WE)
add_custom_target(_franka_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_control" "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetKFrame.srv" ""
)

get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg" NAME_WE)
add_custom_target(_franka_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_control" "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:franka_control/ErrorRecoveryFeedback:std_msgs/Header"
)

get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetLoad.srv" NAME_WE)
add_custom_target(_franka_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_control" "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetLoad.srv" ""
)

get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetJointImpedance.srv" NAME_WE)
add_custom_target(_franka_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_control" "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetJointImpedance.srv" ""
)

get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetEEFrame.srv" NAME_WE)
add_custom_target(_franka_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_control" "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetEEFrame.srv" ""
)

get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg" NAME_WE)
add_custom_target(_franka_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_control" "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg" ""
)

get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg" NAME_WE)
add_custom_target(_franka_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_control" "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg" "actionlib_msgs/GoalID:franka_control/ErrorRecoveryGoal:std_msgs/Header"
)

get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg" NAME_WE)
add_custom_target(_franka_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_control" "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg" "franka_control/ErrorRecoveryResult:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:std_msgs/Header"
)

get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetCartesianImpedance.srv" NAME_WE)
add_custom_target(_franka_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_control" "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetCartesianImpedance.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
)
_generate_msg_cpp(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
)
_generate_msg_cpp(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
)
_generate_msg_cpp(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
)
_generate_msg_cpp(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
)
_generate_msg_cpp(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
)
_generate_msg_cpp(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
)

### Generating Services
_generate_srv_cpp(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetKFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
)
_generate_srv_cpp(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetForceTorqueCollisionBehavior.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
)
_generate_srv_cpp(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetJointImpedance.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
)
_generate_srv_cpp(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetFullCollisionBehavior.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
)
_generate_srv_cpp(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetEEFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
)
_generate_srv_cpp(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetCartesianImpedance.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
)
_generate_srv_cpp(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetLoad.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
)

### Generating Module File
_generate_module_cpp(franka_control
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(franka_control_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(franka_control_generate_messages franka_control_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_cpp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetForceTorqueCollisionBehavior.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_cpp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetFullCollisionBehavior.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_cpp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryAction.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_cpp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_cpp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetKFrame.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_cpp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_cpp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetLoad.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_cpp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetJointImpedance.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_cpp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetEEFrame.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_cpp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_cpp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_cpp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_cpp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetCartesianImpedance.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_cpp _franka_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(franka_control_gencpp)
add_dependencies(franka_control_gencpp franka_control_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS franka_control_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
)
_generate_msg_eus(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
)
_generate_msg_eus(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
)
_generate_msg_eus(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
)
_generate_msg_eus(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
)
_generate_msg_eus(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
)
_generate_msg_eus(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
)

### Generating Services
_generate_srv_eus(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetKFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
)
_generate_srv_eus(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetForceTorqueCollisionBehavior.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
)
_generate_srv_eus(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetJointImpedance.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
)
_generate_srv_eus(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetFullCollisionBehavior.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
)
_generate_srv_eus(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetEEFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
)
_generate_srv_eus(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetCartesianImpedance.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
)
_generate_srv_eus(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetLoad.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
)

### Generating Module File
_generate_module_eus(franka_control
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(franka_control_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(franka_control_generate_messages franka_control_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_eus _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetForceTorqueCollisionBehavior.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_eus _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetFullCollisionBehavior.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_eus _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryAction.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_eus _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_eus _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetKFrame.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_eus _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_eus _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetLoad.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_eus _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetJointImpedance.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_eus _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetEEFrame.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_eus _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_eus _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_eus _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_eus _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetCartesianImpedance.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_eus _franka_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(franka_control_geneus)
add_dependencies(franka_control_geneus franka_control_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS franka_control_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
)
_generate_msg_lisp(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
)
_generate_msg_lisp(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
)
_generate_msg_lisp(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
)
_generate_msg_lisp(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
)
_generate_msg_lisp(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
)
_generate_msg_lisp(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
)

### Generating Services
_generate_srv_lisp(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetKFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
)
_generate_srv_lisp(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetForceTorqueCollisionBehavior.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
)
_generate_srv_lisp(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetJointImpedance.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
)
_generate_srv_lisp(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetFullCollisionBehavior.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
)
_generate_srv_lisp(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetEEFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
)
_generate_srv_lisp(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetCartesianImpedance.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
)
_generate_srv_lisp(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetLoad.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
)

### Generating Module File
_generate_module_lisp(franka_control
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(franka_control_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(franka_control_generate_messages franka_control_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_lisp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetForceTorqueCollisionBehavior.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_lisp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetFullCollisionBehavior.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_lisp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryAction.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_lisp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_lisp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetKFrame.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_lisp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_lisp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetLoad.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_lisp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetJointImpedance.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_lisp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetEEFrame.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_lisp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_lisp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_lisp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_lisp _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetCartesianImpedance.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_lisp _franka_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(franka_control_genlisp)
add_dependencies(franka_control_genlisp franka_control_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS franka_control_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
)
_generate_msg_nodejs(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
)
_generate_msg_nodejs(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
)
_generate_msg_nodejs(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
)
_generate_msg_nodejs(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
)
_generate_msg_nodejs(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
)
_generate_msg_nodejs(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
)

### Generating Services
_generate_srv_nodejs(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetKFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
)
_generate_srv_nodejs(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetForceTorqueCollisionBehavior.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
)
_generate_srv_nodejs(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetJointImpedance.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
)
_generate_srv_nodejs(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetFullCollisionBehavior.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
)
_generate_srv_nodejs(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetEEFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
)
_generate_srv_nodejs(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetCartesianImpedance.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
)
_generate_srv_nodejs(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetLoad.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
)

### Generating Module File
_generate_module_nodejs(franka_control
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(franka_control_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(franka_control_generate_messages franka_control_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_nodejs _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetForceTorqueCollisionBehavior.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_nodejs _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetFullCollisionBehavior.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_nodejs _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryAction.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_nodejs _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_nodejs _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetKFrame.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_nodejs _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_nodejs _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetLoad.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_nodejs _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetJointImpedance.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_nodejs _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetEEFrame.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_nodejs _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_nodejs _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_nodejs _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_nodejs _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetCartesianImpedance.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_nodejs _franka_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(franka_control_gennodejs)
add_dependencies(franka_control_gennodejs franka_control_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS franka_control_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
)
_generate_msg_py(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
)
_generate_msg_py(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
)
_generate_msg_py(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
)
_generate_msg_py(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
)
_generate_msg_py(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
)
_generate_msg_py(franka_control
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
)

### Generating Services
_generate_srv_py(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetKFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
)
_generate_srv_py(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetForceTorqueCollisionBehavior.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
)
_generate_srv_py(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetJointImpedance.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
)
_generate_srv_py(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetFullCollisionBehavior.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
)
_generate_srv_py(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetEEFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
)
_generate_srv_py(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetCartesianImpedance.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
)
_generate_srv_py(franka_control
  "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetLoad.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
)

### Generating Module File
_generate_module_py(franka_control
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(franka_control_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(franka_control_generate_messages franka_control_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryResult.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_py _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetForceTorqueCollisionBehavior.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_py _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetFullCollisionBehavior.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_py _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryAction.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_py _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryGoal.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_py _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetKFrame.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_py _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionFeedback.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_py _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetLoad.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_py _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetJointImpedance.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_py _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetEEFrame.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_py _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryFeedback.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_py _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionGoal.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_py _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/devel/share/franka_control/msg/ErrorRecoveryActionResult.msg" NAME_WE)
add_dependencies(franka_control_generate_messages_py _franka_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/suyashs/rnm_group_2/src/franka_ros/franka_control/srv/SetCartesianImpedance.srv" NAME_WE)
add_dependencies(franka_control_generate_messages_py _franka_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(franka_control_genpy)
add_dependencies(franka_control_genpy franka_control_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS franka_control_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_control
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(franka_control_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_control
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(franka_control_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_control
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(franka_control_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_control
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(franka_control_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_control
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(franka_control_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
