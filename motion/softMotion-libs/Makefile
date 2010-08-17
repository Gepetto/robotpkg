# robotpkg Makefile for:	motion/softMotion-libs
# Created:			Xavier Broquere on Fri, 26 Feb 2010
#
DISTNAME=		softMotion-libs-${PKGVERSION}
PKGVERSION=		1.0

CATEGORIES=		motion
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=softMotion-libs/}
MASTER_REPOSITORY=      git ssh://trac.laas.fr/git/robots/softMotion-libs

MAINTAINER=		openrobots@laas.fr

COMMENT=		SoftMotion Planner Library

USE_LANGUAGES+=		c c++

include ../../mk/sysdep/swig.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
