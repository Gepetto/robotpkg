# robotpkg Makefile for:	devel/mkdep
# Created:			Anthony Mallet on Sun, 28 Jan 2007
#

VERSION=		0.5.3
PKGNAME=		yaml-cpp-${VERSION}
DISTNAME=		release-${VERSION}
DIST_SUBDIR=		${PKGBASE}
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_GITHUB:=jbeder/yaml-cpp/archive/}

COMMENT=		YAML parser and emitter for C++
HOMEPAGE=		https://github.com/jbeder/yaml-cpp
LICENSE=		mit
MAINTAINER=		openrobots@laas.fr

WRKSRC=			${WRKDIR}/${PKGBASE}-release-${VERSION}
CMAKE_ARGS+=		-DBUILD_SHARED_LIBS=ON
CMAKE_ARGS+=		-DYAML_CPP_BUILD_TOOLS=OFF

include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
