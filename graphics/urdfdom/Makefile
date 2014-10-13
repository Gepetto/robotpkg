# robotpkg Makefile for:	graphics/urdfdom
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

PKGREVISION=	1
VERSION=	0.3.0
DISTNAME=	urdfdom-${VERSION}
DISTFILES=	${VERSION}${EXTRACT_SUFX}
MASTER_SITES=	${MASTER_SITE_GITHUB:=ros/urdfdom/archive/}
DIST_SUBDIR=	${PKGBASE}

CATEGORIES=	graphics
MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://ros.org/wiki/urdf
COMMENT=	The URDF (U-Robot Description Format) library
LICENSE=	modified-bsd

USE_BOOST_LIBS=	thread
CMAKE_ARGS+=	-DPYTHON_SITELIB=${PYTHON_SITELIB}

# make sure to depend on the proper api
DEPEND_ABI.urdfdom-headers+=	urdfdom-headers>=${VERSION}

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../graphics/urdfdom-headers/depend.mk
include ../../sysutils/console-bridge/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/tinyxml.mk
include ../../mk/robotpkg.mk
