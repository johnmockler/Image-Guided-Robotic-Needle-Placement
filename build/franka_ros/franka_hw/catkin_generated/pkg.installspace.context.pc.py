# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/opt/ros/melodic/include/libfranka".split(';') if "${prefix}/include;/opt/ros/melodic/include/libfranka" != "" else []
PROJECT_CATKIN_DEPENDS = "controller_interface;hardware_interface;joint_limits_interface;roscpp;urdf".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lfranka_hw;/opt/ros/melodic/lib/libfranka.so.0.7.1".split(';') if "-lfranka_hw;/opt/ros/melodic/lib/libfranka.so.0.7.1" != "" else []
PROJECT_NAME = "franka_hw"
PROJECT_SPACE_DIR = "/home/rnm/rnm_group_2/install"
PROJECT_VERSION = "0.7.0"
