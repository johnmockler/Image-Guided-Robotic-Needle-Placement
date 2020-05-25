# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "franka_example_controllers: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ifranka_example_controllers:/home/rnm/rnm_group_2/src/franka_ros_1/franka_example_controllers/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(franka_example_controllers_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/rnm/rnm_group_2/src/franka_ros_1/franka_example_controllers/msg/JointTorqueComparison.msg" NAME_WE)
add_custom_target(_franka_example_controllers_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_example_controllers" "/home/rnm/rnm_group_2/src/franka_ros_1/franka_example_controllers/msg/JointTorqueComparison.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(franka_example_controllers
  "/home/rnm/rnm_group_2/src/franka_ros_1/franka_example_controllers/msg/JointTorqueComparison.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_example_controllers
)

### Generating Services

### Generating Module File
_generate_module_cpp(franka_example_controllers
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_example_controllers
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(franka_example_controllers_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(franka_example_controllers_generate_messages franka_example_controllers_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rnm/rnm_group_2/src/franka_ros_1/franka_example_controllers/msg/JointTorqueComparison.msg" NAME_WE)
add_dependencies(franka_example_controllers_generate_messages_cpp _franka_example_controllers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(franka_example_controllers_gencpp)
add_dependencies(franka_example_controllers_gencpp franka_example_controllers_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS franka_example_controllers_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(franka_example_controllers
  "/home/rnm/rnm_group_2/src/franka_ros_1/franka_example_controllers/msg/JointTorqueComparison.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_example_controllers
)

### Generating Services

### Generating Module File
_generate_module_eus(franka_example_controllers
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_example_controllers
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(franka_example_controllers_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(franka_example_controllers_generate_messages franka_example_controllers_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rnm/rnm_group_2/src/franka_ros_1/franka_example_controllers/msg/JointTorqueComparison.msg" NAME_WE)
add_dependencies(franka_example_controllers_generate_messages_eus _franka_example_controllers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(franka_example_controllers_geneus)
add_dependencies(franka_example_controllers_geneus franka_example_controllers_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS franka_example_controllers_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(franka_example_controllers
  "/home/rnm/rnm_group_2/src/franka_ros_1/franka_example_controllers/msg/JointTorqueComparison.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_example_controllers
)

### Generating Services

### Generating Module File
_generate_module_lisp(franka_example_controllers
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_example_controllers
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(franka_example_controllers_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(franka_example_controllers_generate_messages franka_example_controllers_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rnm/rnm_group_2/src/franka_ros_1/franka_example_controllers/msg/JointTorqueComparison.msg" NAME_WE)
add_dependencies(franka_example_controllers_generate_messages_lisp _franka_example_controllers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(franka_example_controllers_genlisp)
add_dependencies(franka_example_controllers_genlisp franka_example_controllers_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS franka_example_controllers_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(franka_example_controllers
  "/home/rnm/rnm_group_2/src/franka_ros_1/franka_example_controllers/msg/JointTorqueComparison.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_example_controllers
)

### Generating Services

### Generating Module File
_generate_module_nodejs(franka_example_controllers
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_example_controllers
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(franka_example_controllers_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(franka_example_controllers_generate_messages franka_example_controllers_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rnm/rnm_group_2/src/franka_ros_1/franka_example_controllers/msg/JointTorqueComparison.msg" NAME_WE)
add_dependencies(franka_example_controllers_generate_messages_nodejs _franka_example_controllers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(franka_example_controllers_gennodejs)
add_dependencies(franka_example_controllers_gennodejs franka_example_controllers_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS franka_example_controllers_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(franka_example_controllers
  "/home/rnm/rnm_group_2/src/franka_ros_1/franka_example_controllers/msg/JointTorqueComparison.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_example_controllers
)

### Generating Services

### Generating Module File
_generate_module_py(franka_example_controllers
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_example_controllers
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(franka_example_controllers_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(franka_example_controllers_generate_messages franka_example_controllers_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rnm/rnm_group_2/src/franka_ros_1/franka_example_controllers/msg/JointTorqueComparison.msg" NAME_WE)
add_dependencies(franka_example_controllers_generate_messages_py _franka_example_controllers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(franka_example_controllers_genpy)
add_dependencies(franka_example_controllers_genpy franka_example_controllers_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS franka_example_controllers_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_example_controllers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_example_controllers
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_example_controllers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_example_controllers
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_example_controllers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_example_controllers
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_example_controllers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_example_controllers
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_example_controllers)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_example_controllers\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_example_controllers
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
