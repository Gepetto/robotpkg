# robotpkg Makefile for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue, 18 Jan 2011
#

PKGVERSION=	1.4.0
MASTER_SITES=	${MASTER_SITE_ROS:=ros_comm/tags/ros_comm-${PKGVERSION}}

ROS_PACKAGE=			comm
ROS_COMMENT=			communication packages
ROS_INSTALLATION_SUBDIR=	ros_comm
NOT_FOR_PLATFORM=

include ../../meta-pkgs/ros-base/Makefile.common

# Configure make program
SUBST_CLASSES+=		gmake
SUBST_STAGE.gmake=	pre-configure
SUBST_MESSAGE.gmake=	Configuring GNU make program location
SUBST_FILES.gmake=	test/test_rosbag/Makefile
SUBST_SED.gmake=	-e 's|@MAKE@|${MAKE}|'

include ../../devel/log4cxx/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
