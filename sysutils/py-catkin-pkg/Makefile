# robotpkg Makefile for:	sysutils/py-catkin-pkg
# Created:			Anthony Mallet on Thu, 20 Jun 2013
#

ROS_PKG=	catkin_pkg
ROS_VERSION=	0.2.4
ROS_REPO=	ros-infrastructure
PKGNAME=	${PKGTAG.python}-$(subst _,-,${ROS_PKG})-${ROS_VERSION}

CATEGORIES=	sysutils
ROS_COMMENT=	standalone library for the catkin package

PYDISTUTILSPKG=	yes

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	bin/catkin_*

include ../../mk/sysdep/py-argparse.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
