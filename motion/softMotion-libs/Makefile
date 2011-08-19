# robotpkg Makefile for:	motion/softMotion-libs
# Created:			Xavier Broquere on Fri, 26 Feb 2010
#

DISTNAME=		softMotion-libs-${PKGVERSION_NOREV}
PKGVERSION=		3.7

CATEGORIES=		motion
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=softMotion-libs/}
MASTER_REPOSITORY=      git ssh://trac.laas.fr/git/robots/softMotion-libs

MAINTAINER=		xavier.broquere@laas.fr
LICENSE=		gnu-lgpl-v3

COMMENT=		SoftMotion Planner Library

USE_LANGUAGES+=		c c++

include ../../devel/swig/depend.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
