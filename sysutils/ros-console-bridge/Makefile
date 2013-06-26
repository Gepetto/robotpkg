# robotpkg Makefile for:	sysutils/ros-console-bridge
# Created:			Anthony Mallet on Thu, 27 Jun 2013
#

ROS_PKG=	console_bridge
ROS_VERSION=	0.2.4
ROS_GITTAG=	release/groovy/${ROS_PKG}/${ROS_VERSION}-0
ROS_REPO=	ros-gbp
ROS_PKGURL?=	${ROS_PKG}-release/archive/${ROS_GITTAG}${EXTRACT_SUFX}?file=

CATEGORIES=	sysutils
ROS_COMMENT=	logging for ROS-independent applications

MESSAGE_SRC=
WRKSRC=		${WRKDIR}/${ROS_PKG}-release-$(subst /,-,${ROS_GITTAG})

include ../../meta-pkgs/ros-base/Makefile.common

USE_BOOST_LIBS+=thread system

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
