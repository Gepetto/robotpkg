# robotpkg Makefile for:	graphics/urdfdom
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

VERSION=	1.0.3
DISTNAME=	urdfdom-${VERSION}
DISTFILES=	${VERSION}${EXTRACT_SUFX}
MASTER_SITES=	${MASTER_SITE_GITHUB:=ros/urdfdom/archive/}
DIST_SUBDIR=	${PKGBASE}

CATEGORIES=	graphics
MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://ros.org/wiki/urdf
COMMENT=	The URDF (U-Robot Description Format) library
LICENSE=	modified-bsd

CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=lib

# make sure to depend on the proper api and default the headers package to
# robotpkg when building this one from robotpkg
PREFER.urdfdom-headers?=	robotpkg
DEPEND_ABI.urdfdom-headers+=	urdfdom-headers>=${VERSION}

include ../../devel/tinyxml/depend.mk
include ../../graphics/urdfdom-headers/depend.mk
include ../../sysutils/console-bridge/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
