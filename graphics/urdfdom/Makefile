# robotpkg Makefile for:	graphics/urdfdom
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

VERSION=	0.2.8
DISTNAME=	${VERSION}
PKGNAME=	urdfdom-${VERSION}
MASTER_SITES=	https://bitbucket.org/osrf/urdfdom/get/
DIST_SUBDIR=	${PKGBASE}

CATEGORIES=	graphics
MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	https://bitbucket.org/osrf/urdfdom
COMMENT=	The URDF (U-Robot Description Format) library
LICENSE=	modified-bsd

WRKSRC=		${WRKDIR}/osrf-urdfdom-d92e0f2d350f
USE_BOOST_LIBS=	thread

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../graphics/urdfdom-headers/depend.mk
include ../../sysutils/console-bridge/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/tinyxml.mk
include ../../mk/robotpkg.mk
