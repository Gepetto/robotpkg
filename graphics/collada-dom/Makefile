# robotpkg Makefile for:	graphics/collada-dom
# Created:			Francois Lancelot on Wed, 21 Sep 2011
#

PKGVERSION=	2.3.1
PKGREVISION=	1
PKGNAME=	collada-dom-${PKGVERSION}
DISTNAME=	collada_dom-${PKGVERSION_NOREV}-src
MASTER_SITES=   ${MASTER_SITE_SOURCEFORGE:=collada-dom/}
EXTRACT_SUFX=	.tgz

CATEGORIES=	graphics
COMMENT=	C++ object representation of a COLLADA XML instance document
HOMEPAGE=	http://collada-dom.sourceforge.net/
LICENSE=	mit
MAINTAINER=	openrobots@laas.fr

USE_LANGUAGES+=	c c++
WRKSRC=		${WRKDIR}/${PKGNAME_NOREV}

CMAKE_ARGS+=	-DOPT_COLLADA14=OFF
CMAKE_ARGS+=	-DOPT_COLLADA15=ON

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/libxml2.mk
include ../../mk/sysdep/pcre.mk
include ../../archivers/zlib/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mk/robotpkg.mk
