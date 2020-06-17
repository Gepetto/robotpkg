# robotpkg Makefile for:	graphics/collada-dom
# Created:			Francois Lancelot on Wed, 21 Sep 2011
#

NAME=		collada-dom
VERSION=	2.4.0
PKGREVISION=	1

DISTNAME=	${NAME}-${VERSION}
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=${NAME}/}
EXTRACT_SUFX=	.tgz

CATEGORIES=	graphics
COMMENT=	C++ object representation of a COLLADA XML instance document
HOMEPAGE=	http://${NAME}.sourceforge.net/
LICENSE=	mit
MAINTAINER=	openrobots@laas.fr

include ../../archivers/zlib/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/libxml2.mk
include ../../mk/sysdep/pcre.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
