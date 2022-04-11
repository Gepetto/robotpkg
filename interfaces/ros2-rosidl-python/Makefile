# robotpkg Makefile for:	interfaces/ros2-rosidl-python
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

ROS2_PKG=	rosidl_python
ROS2_VERSION=	0.14.2

CATEGORIES=	interfaces
ROS2_COMMENT=	IDL support for python

include ../../meta-pkgs/ros2-core/Makefile.common

CONFIGURE_DIRS=	rosidl_generator_py

SUBST_CLASSES+=	py-interp
SUBST_FILES.py-interp=\
  rosidl_generator_py/bin/rosidl_generator_py

include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
