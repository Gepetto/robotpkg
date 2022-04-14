# robotpkg Makefile for:	devel/py-osrf-pycommon
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#

DISTNAME=       osrf_pycommon-2.0.2
PKGNAME=        ${PKGTAG.python-}$(subst _,-,${DISTNAME})
MASTER_SITES=   ${MASTER_SITE_GITHUB:=osrf/}

COMMENT=        Python modules used at OSRF
CATEGORIES=     devel

ROS2_AMENTPKG=  no
include ../../meta-pkgs/ros2-core/Makefile.common

DEPEND_ABI.python+= python>=3

include ../../mk/sysdep/py-setuptools.mk
include ../../mk/robotpkg.mk
