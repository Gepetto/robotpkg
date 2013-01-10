# robotpkg Makefile for:	motion/softMotion-libs
# Created:			Xavier Broquere on Fri, 26 Feb 2010
#

PKGREVISION=		1
VERSION=		3.11
DISTNAME=		softMotion-libs-${VERSION}

CATEGORIES=		motion
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=softMotion-libs/}
MASTER_REPOSITORY=      git ssh://trac.laas.fr/git/robots/softMotion-libs

MAINTAINER=		wuwei.he@laas.fr
LICENSE=		gnu-lgpl-v3
NOT_FOR_PLATFORM=

COMMENT=		SoftMotion Planner Library


include ../../devel/swig/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/libxml2.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
