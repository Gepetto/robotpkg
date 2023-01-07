# robotpkg Makefile for:	sysutils/py-catkin-pkg
# Created:			Anthony Mallet on Thu, 20 Jun 2013
#

ROS_PKG=	catkin_pkg
ROS_VERSION=	0.5.2
ROS_REPO=	ros-infrastructure
PKGNAME=	${PKGTAG.python}-$(subst _,-,${ROS_PKG})-${ROS_VERSION}

PYTHON_SELF_CONFLICTS=	yes

CATEGORIES=	sysutils
ROS_COMMENT=	standalone library for the catkin package

include ../../meta-pkgs/ros-base/Makefile.common

include ../../mk/sysdep/py-argparse.mk
include ../../mk/sysdep/py-pyparsing.mk
include ../../mk/sysdep/py-setuptools.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
