# robotpkg Makefile for:	math/sensFusion-libs
# Created:			Xavier Broquere on Wed, 25 Jan 2012
#

DISTNAME=		sensFusion-libs-${PKGVERSION_NOREV}
PKGVERSION=		1.3

CATEGORIES=		math
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=sensFusion-libs/}
MASTER_REPOSITORY=      ${MASTER_REPOSITORY_OPENROBOTS_TRAC}sensFusion-libs

MAINTAINER=		whe@laas.fr
LICENSE=		mit

COMMENT=		Sensor Fusion Library

DEPEND_ABI.boost-headers = boost-headers>=1.41
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
