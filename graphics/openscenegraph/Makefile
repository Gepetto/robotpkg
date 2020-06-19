# robotpkg Makefile for:	graphics/openscenegraph
# Created:			Guilhem Saurel on Mon, 25 May 2020
#

ORG=			openscenegraph
NAME=			OpenSceneGraph
VERSION=		3.6.5
DISTNAME=		${NAME}-${VERSION}
PKGNAME=		${ORG}-${VERSION}
PKGREVISION=		3

MASTER_SITES=		${MASTER_SITE_GITHUB:=${ORG}/${NAME}}/archive/
WRKSRC=			${WRKDIR}/${NAME}-${DISTNAME}

CATEGORIES=		graphics
COMMENT=		open source high performance 3D graphics toolkit
LICENSE=		gnu-lgpl-v2.1
MAINTAINER=		gsaurel@laas.fr

CONFIGURE_ENV+=		COLLADA_DIR=${PREFIX.collada-dom}
CMAKE_ARGS+=		-DCOLLADA_DOM_2_4_OR_LATER=ON

include ../../graphics/collada-dom/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
