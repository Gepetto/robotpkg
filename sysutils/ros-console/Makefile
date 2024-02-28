# robotpkg Makefile for:	sysutils/ros-console
# Created:			Anthony Mallet on Tue,  4 Sep 2018
#

PKGREVISION=	1
ROS_PKG=	rosconsole
ROS_VERSION=	1.13.7
PKGNAME=	ros-console-${ROS_VERSION}

CATEGORIES=	sysutils
ROS_COMMENT=	console output library

include ../../meta-pkgs/ros-base/Makefile.common

# not compatible with log4cxx>=0.12. This could be fixed, but who cares?
CMAKE_ARGS+=	-DROSCONSOLE_BACKEND=print

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../devel/ros-roscpp-core/depend.mk
include ../../mk/sysdep/apr.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/robotpkg.mk
