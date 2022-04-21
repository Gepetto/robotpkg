# robotpkg Makefile for:	sysutils/py-ros2-rpyutils
# Created:			Anthony Mallet on Tue, 12 Apr 2022
#

PKGNAME=	${PKGTAG.python-}ros2-${DISTNAME}
DISTNAME=	rpyutils-0.2.1
MASTER_SITES=	${MASTER_SITE_GITHUB:=ros2/}

COMMENT=	Utility types and functions for python
CATEGORIES=	sysutils

ROS2_AMENTPKG?=	no
include ../../meta-pkgs/ros2-core/Makefile.common

DEPEND_ABI.python+= python>=3.6

include ../../mk/sysdep/py-setuptools.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
