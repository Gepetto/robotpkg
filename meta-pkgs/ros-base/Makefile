# robotpkg Makefile for:	meta-pkgs/ros-base
# Created:			Anthony Mallet on Wed, 19 Jan 2011
#

DISTNAME=	ros-base-1.9
CATEGORIES=	meta-pkgs
META_PACKAGE=	yes

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.ros.org/wiki/
COMMENT=	The Robotic Operating System - Bare bones

NOT_FOR_PLATFORM=
MESSAGE_SUBST+=	PYTHON_VERSION=${PYTHON_VERSION}

include ../../devel/ros-ros/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../mk/robotpkg.mk
