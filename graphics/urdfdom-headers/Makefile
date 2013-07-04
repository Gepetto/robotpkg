# robotpkg Makefile for:	graphics/urdfdom-headers
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

VERSION=	0.2.3
DISTNAME=	${VERSION}
PKGNAME=	urdfdom-headers-${VERSION}
MASTER_SITES=	https://bitbucket.org/osrf/urdfdom_headers/get/
DIST_SUBDIR=	${PKGBASE}

CATEGORIES=	graphics
MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	https://bitbucket.org/osrf/urdfdom_headers
COMMENT=	The URDF (U-Robot Description Format) headers
LICENSE=	modified-bsd

WRKSRC=		${WRKDIR}/osrf-urdfdom_headers-d7757a5edf3a

include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
