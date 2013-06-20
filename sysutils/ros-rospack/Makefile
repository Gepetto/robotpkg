# robotpkg Makefile for:	sysutils/ros-rospack
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

ROS_PKG=	rospack
ROS_VERSION=	2.1.19

CATEGORIES=	sysutils
ROS_COMMENT=	command-line tool for retriving package information

CONFLICTS+=	rospack # old package name

include ../../meta-pkgs/ros-base/Makefile.common

INCLUDE_DIRS.tinyxml+=	include
LIBRARY_DIRS.tinyxml+=	lib
RPATH_DIRS.tinyxml+=	lib

DEPEND_ABI.ros-catkin+=	ros-catkin>=0.5.64

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../sysutils/py-catkin-pkg/depend.mk
include ../../sysutils/py-rosdep/depend.mk
include ../../mk/sysdep/tinyxml.mk
include ../../mk/robotpkg.mk
