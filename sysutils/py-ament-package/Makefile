# robotpkg Makefile for:	devel/py-ament-package
# Created:			Anthony Mallet on Wed, 23 Mar 2022
#

PKGNAME=	${PKGTAG.python-}$(subst _,-,${DISTNAME})
DISTNAME=	ament_package-0.14.0
MASTER_SITES=	${MASTER_SITE_GITHUB:=ament/}

COMMENT=	Python package for parsing ament manifest files.
CATEGORIES=	devel

ROS2_AMENTPKG=	no
include ../../meta-pkgs/ros2-core/Makefile.common

DEPEND_ABI.python+= python>=3

include ../../mk/sysdep/py-setuptools.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
