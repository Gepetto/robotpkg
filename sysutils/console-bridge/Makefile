# robotpkg Makefile for:	sysutils/console-bridge
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

ROS_PKG=	console_bridge
ROS_VERSION=	0.2.4
PKGNAME=	$(subst _,-,${ROS_PKG})-${ROS_VERSION}

CATEGORIES=	sysutils
ROS_COMMENT=	logging for ROS-independent applications

include ../../meta-pkgs/ros-base/Makefile.common

USE_BOOST_LIBS+=thread system

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
