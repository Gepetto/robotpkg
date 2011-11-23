# robotpkg Makefile for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue, 18 Jan 2011
#

PKGVERSION=	1.6.5
MASTER_SITES=	${MASTER_SITE_ROS:=ros_comm/tags/ros_comm-${PKGVERSION}}

ROS_PACKAGE=			comm
ROS_COMMENT=			communication packages
ROS_INSTALLATION_SUBDIR=	ros_comm
NOT_FOR_PLATFORM=

include ../../meta-pkgs/ros-base/Makefile.common

include ../../devel/log4cxx/depend.mk
include ../../middleware/ros-core/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
