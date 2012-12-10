# robotpkg Makefile for:	devel/ros-core
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

ROS_PKG=		ros
ROS_VERSION=		1.8.10
PKGNAME=		ros-core-${ROS_VERSION}

CATEGORIES=		devel
ROS_COMMENT=		core
HOMEPAGE=		http://www.ros.org/wiki/ROS

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp py-distsetup

SUBST_FILES.py-interp+=	core/roslib/scripts/gendeps

include ../../archivers/bzip2/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/catkin/depend.mk
include ../../sysutils/rospack/depend.mk
include ../../sysutils/py-rospkg/depend.mk
include ../../mk/sysdep/py-nose.mk
include ../../mk/robotpkg.mk
