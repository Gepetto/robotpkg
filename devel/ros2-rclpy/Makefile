# robotpkg Makefile for:	devel/ros2-rclpy
# Created:			Anthony Mallet on Wed, 13 Apr 2022
#

ROS2_PKG=	rclpy
ROS2_VERSION=	3.3.2

CATEGORIES=	devel
ROS2_COMMENT=	client Library for python

include ../../meta-pkgs/ros2-core/Makefile.common

CONFIGURE_DIRS=	rclpy

# pybind11 sysdep may ask for lto and gcc lto-wrapper may invoke a recursive
# make when parallel builds are configured. Since all this spwaned directy by
# cmake, MAKE environment variable must be set to avoid confusion between
# gmake and bmake variables used to communicate with the job server.
MAKE_FLAGS+=	MAKE=${MAKE_PROGRAM}

include ../../devel/ros2-python-cmake-module/depend.mk
include ../../devel/ros2-rcl/depend.mk
include ../../interfaces/ros2-rcl-interfaces/depend.mk
include ../../interfaces/ros2-rosidl/depend.mk
include ../../middleware/ros2-rmw/depend.mk
include ../../middleware/ros2-rmw-implementation/depend.mk
include ../../sysutils/ament-index/depend.mk
include ../../sysutils/py-ros2-rpyutils/depend.mk
include ../../mk/sysdep/py-pybind11.mk
include ../../mk/robotpkg.mk
