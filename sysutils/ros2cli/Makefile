# robotpkg Makefile for:	sysutils/ros2cli
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#

ROS2_PKG=	ros2cli
ROS2_VERSION=	0.18.3
PKGNAME=	${DISTNAME}

CATEGORIES=	sysutils
ROS2_COMMENT=	command line interface tools

ROS2_SUBPKGS=\
    ros2cli_test_interfaces	\
    ros2lifecycle_test_fixtures	\
  python:			\
    ros2action			\
    ros2cli			\
    ros2component		\
    ros2doctor			\
    ros2interface		\
    ros2lifecycle		\
    ros2multicast		\
    ros2node			\
    ros2param			\
    ros2pkg			\
    ros2run			\
    ros2service			\
    ros2topic

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../devel/ros2-rclcpp/depend.mk
include ../../devel/ros2-rclpy/depend.mk
include ../../interfaces/ros2-common-interfaces/depend.mk
include ../../interfaces/ros2-rosidl-runtime-py/depend.mk
include ../../sysutils/py-rosdistro/depend.mk
include ../../mk/sysdep/py-argcomplete.mk
include ../../mk/sysdep/py-netifaces.mk
include ../../mk/sysdep/py-packaging.mk
include ../../mk/robotpkg.mk
