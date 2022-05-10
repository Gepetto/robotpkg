# robotpkg Makefile for:	interfaces/ros2-rosidl-runtime-py
# Created:			Anthony Mallet on Fri, 15 Apr 2022
#

ROS2_PKG=	rosidl_runtime_py
ROS2_VERSION=	0.9.2

CATEGORIES=	interfaces
ROS2_COMMENT=	runtime for working with generated interfaces in Python

ROS2_AMENTPKG=	no

include ../../meta-pkgs/ros2-core/Makefile.common

DEPEND_ABI.python+=	python>=3.6

include ../../interfaces/ros2-rosidl/depend.mk
include ../../mk/sysdep/py-numpy.mk
include ../../mk/sysdep/py-setuptools.mk
include ../../mk/sysdep/py-yaml.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
