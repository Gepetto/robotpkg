# robotpkg Makefile for:	sysutils/console-bridge
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

VERSION=	1.0.2
DISTNAME=	console_bridge-${VERSION}
DISTFILES=	${VERSION}${EXTRACT_SUFX}
PKGNAME=	$(subst _,-,${DISTNAME})
MASTER_SITES=	${MASTER_SITE_GITHUB:=ros/console_bridge/archive/}
DIST_SUBDIR=	${PKGBASE}

CATEGORIES=	sysutils
MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://wiki.ros.org/console_bridge
COMMENT=	Logging for ROS-independent applications
LICENSE=	modified-bsd

CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=lib

include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
