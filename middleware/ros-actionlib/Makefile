# robotpkg Makefile for:	middleware/ros-actionlib
# Created:			Anthony Mallet on Mon, 5 Dec 2011
#

PKGVERSION=	1.6.1
MASTER_SITE_TAG=common-${PKGVERSION_NOREV}
MASTER_SITE_DIR=common/actionlib
MASTER_SITES=	${MASTER_SITE_ROS_KFORGE:=${MASTER_SITE_DIR}@${MASTER_SITE_TAG}}

ROS_PACKAGE=			actionlib
ROS_COMMENT=			preemptible tasks
ROS_INSTALLATION_SUBDIR=	common
NOT_FOR_PLATFORM=

include ../../meta-pkgs/ros-base/Makefile.common

include ../../interfaces/ros-common_msgs/depend.mk
include ../../middleware/ros-core/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../mk/sysdep/py-wxpython.mk
include ../../mk/robotpkg.mk
