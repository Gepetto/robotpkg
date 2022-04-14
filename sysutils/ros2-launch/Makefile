# robotpkg Makefile for:	sysutils/ros2-launch
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#

ROS2_PKG=	launch
ROS2_VERSION=	1.0.1

CATEGORIES=	sysutils
ROS2_COMMENT=	tools for launching multiple processes

ROS2_SUBPKGS=\
    launch_testing_ament_cmake	\
  python:			\
    launch			\
    launch_pytest		\
    launch_testing		\
    launch_xml			\
    launch_yaml

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../devel/py-osrf-pycommon/depend.mk
include ../../sysutils/ament-index/depend.mk
include ../../mk/sysdep/py-lark-parser.mk
include ../../mk/sysdep/py-yaml.mk
include ../../mk/robotpkg.mk
