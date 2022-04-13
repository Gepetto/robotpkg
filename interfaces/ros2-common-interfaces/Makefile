# robotpkg Makefile for:	interfaces/ros2-common-interfaces
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#

ROS2_PKG=	common_interfaces
ROS2_VERSION=	4.2.1

CATEGORIES=	interfaces
ROS2_COMMENT=	common messages and services interface files

ROS2_SUBPKGS=\
    std_msgs		\
    actionlib_msgs	\
    common_interfaces	\
    diagnostic_msgs	\
    geometry_msgs	\
    nav_msgs		\
    sensor_msgs		\
    shape_msgs		\
    std_srvs		\
    stereo_msgs		\
    trajectory_msgs	\
    visualization_msgs	\
  python:		\
    sensor_msgs_py

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../interfaces/ros2-rcl-interfaces/depend.mk
include ../../interfaces/ros2-rosidl-defaults/depend.mk
include ../../mk/robotpkg.mk
