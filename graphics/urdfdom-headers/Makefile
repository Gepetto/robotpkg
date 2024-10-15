# robotpkg Makefile for:	graphics/urdfdom-headers
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

VERSION=	1.1.2
DISTNAME=	urdfdom_headers-${VERSION}
DISTFILES=	${VERSION}${EXTRACT_SUFX}
PKGNAME=	$(subst _,-,${DISTNAME})
MASTER_SITES=	${MASTER_SITE_GITHUB:=ros/urdfdom_headers/archive/}
DIST_SUBDIR=	${PKGBASE}

CATEGORIES=	graphics
MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://ros.org/wiki/urdf
COMMENT=	The URDF (U-Robot Description Format) headers
LICENSE=	modified-bsd

CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=lib

include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
