# robotpkg Makefile for:	sysutils/ros-rospack
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

PKGREVION=	1

ROS_PKG=	rospack
ROS_VERSION=	2.2.4

CATEGORIES=	sysutils
ROS_COMMENT=	command-line tool for retriving package information

CONFLICTS+=	rospack # old package name

include ../../meta-pkgs/ros-base/Makefile.common

CMAKE_ARGS+=	-DTinyXML_ROOT_DIR=${PREFIX.tinyxml}

DEPEND_ABI.ros-catkin+=	ros-catkin>=0.5.64

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../sysutils/py-catkin-pkg/depend.mk
include ../../sysutils/py-rosdep/depend.mk
include ../../mk/sysdep/tinyxml.mk
include ../../mk/robotpkg.mk
