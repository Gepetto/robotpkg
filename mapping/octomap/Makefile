# robotpkg Makefile for:	mapping/octomap
# Created:			Arnaud Degroote on Wed, 22 May 2013
#

PKGVERSION=	1.9.0
DISTNAME=	v${PKGVERSION_NOREV}
PKGNAME=	octomap-${PKGVERSION}
DIST_SUBDIR=	${PKGBASE}

CATEGORIES=	mapping
MASTER_SITES=	https://github.com/OctoMap/octomap/archive/

HOMEPAGE=	http://octomap.github.io/

COMMENT=	An Efficient Probabilistic 3D Mapping Framework Based on Octrees

LICENSE=	modified-bsd

WRKSRC=     ${WRKDIR}/octomap-${PKGVERSION_NOREV}/octomap

DEPEND_ABI.cmake=	cmake>=2.8.8

include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
