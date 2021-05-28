# robotpkg Makefile for:	mapping/octomap
# Created:			Arnaud Degroote on Wed, 22 May 2013
#

PKGVERSION=	1.9.6
DISTNAME=	v${PKGVERSION_NOREV}
PKGNAME=	octomap-${PKGVERSION}
DIST_SUBDIR=	${PKGBASE}

CATEGORIES=	mapping
MASTER_SITES=	https://github.com/OctoMap/octomap/archive/

HOMEPAGE=	http://octomap.github.io/

COMMENT=	An Efficient Probabilistic 3D Mapping Framework Based on Octrees

LICENSE=	modified-bsd

WRKSRC=     ${WRKDIR}/octomap-${PKGVERSION_NOREV}/octomap

CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=lib
DEPEND_ABI.cmake=	cmake>=3.0.2

include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
