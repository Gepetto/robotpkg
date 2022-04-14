# robotpkg Makefile for:	middleware/sros2
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#

ROS2_PKG=	sros2
ROS2_VERSION=	0.10.4
PKGNAME=	${DISTNAME}

CATEGORIES=	middleware
ROS2_COMMENT=	tools to generate and distribute security keys

ROS2_SUBPKGS=\
    sros2_cmake		\
  python:		\
    sros2

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../devel/ros2-rclpy/depend.mk
include ../../sysutils/ament-index/depend.mk
include ../../sysutils/ros2cli/depend.mk
include ../../mk/sysdep/py-cryptography.mk
include ../../mk/sysdep/py-lxml.mk
include ../../mk/robotpkg.mk
