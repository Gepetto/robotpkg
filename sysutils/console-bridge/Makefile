# robotpkg Makefile for:	sysutils/console-bridge
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

VERSION=	0.2.7
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

USE_BOOST_LIBS+=thread system

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
