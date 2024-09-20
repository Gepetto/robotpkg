# robotpkg Makefile for:	mapping/octomap
# Created:			Arnaud Degroote on Wed, 22 May 2013
#

DISTNAME=	octomap-1.10.0
MASTER_SITES=	${MASTER_SITE_GITHUB:=OctoMap/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

CATEGORIES=	mapping
HOMEPAGE=	http://octomap.github.io/
COMMENT=	An Efficient Probabilistic 3D Mapping Framework Based on Octrees
LICENSE=	modified-bsd

WRKSRC=		${WRKDIR}/${DISTNAME}/octomap

CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=lib
DEPEND_ABI.cmake=	cmake>=3.0.2

include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/robotpkg.mk
