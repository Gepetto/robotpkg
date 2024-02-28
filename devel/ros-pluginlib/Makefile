# robotpkg Makefile for:	devel/ros-pluginlib
# Created:			Anthony Mallet on Thu, 27 Jun 2013
#

ROS_PKG=	pluginlib
ROS_VERSION=	1.12.1

CATEGORIES=	devel
ROS_COMMENT=	tools for dynamically loading plugins
HOMEPAGE=	http://www.ros.org/wiki/ROS

include ../../meta-pkgs/ros-base/Makefile.common

WRKSRC=		${WRKDIR}/${DISTNAME}/pluginlib

CMAKE_ARGS+=	-DTinyXML2_ROOT_DIR=${PREFIX.tinyxml}

include ../../devel/ros-cmake-modules/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-class-loader/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../sysutils/ros-console/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/tinyxml2.mk
include ../../mk/robotpkg.mk
