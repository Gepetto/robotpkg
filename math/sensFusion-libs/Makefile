# robotpkg Makefile for:	math/sensFusion-libs
# Created:			Xavier Broquere on Wed, 25 Jan 2012
#

DISTNAME=		sensFusion-libs-${PKGVERSION_NOREV}
PKGVERSION=		1.3

CATEGORIES=		math
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=sensFusion-libs/}
MASTER_REPOSITORY=      git git://git.openrobots.org/git/robots/sensFusion-libs

MAINTAINER=		whe@laas.fr
LICENSE=		mit

COMMENT=		Sensor Fusion Library


CMAKE_ARGS+=	-DBOOST_INCLUDEDIR=${PREFIX.boost-headers}/include

DEPEND_ABI.boost-headers = boost-headers>=1.41
include ../../devel/boost-headers/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
