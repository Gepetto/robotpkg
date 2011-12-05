# robotpkg Makefile for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue, 18 Jan 2011
#

PKGVERSION=	1.6.0
MASTER_SITE_DIR=common_msgs/tags/common_msgs-${PKGVERSION}
MASTER_SITES=	${MASTER_SITE_ROS_PKG:=${MASTER_SITE_DIR}}

CATEGORIES=			interfaces
ROS_PACKAGE=			common_msgs
ROS_COMMENT=			common messages
ROS_INSTALLATION_SUBDIR=	common_msgs
NOT_FOR_PLATFORM=

include ../../meta-pkgs/ros-base/Makefile.common
FETCH_METHOD=			svn

include ../../middleware/ros-core/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../mk/robotpkg.mk
