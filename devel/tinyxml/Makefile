# robotpkg Makefile for:	devel/tinyxml
# Created:			Charles Lesire on Fri, 19 Jan 2018
#

DISTNAME=	tinyxml_2_6_2
PKGNAME=	tinyxml-2.6.2
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=tinyxml/}

CATEGORIES=	devel
COMMENT=	Simple, small, C++ XML parser
HOMEPAGE=	http://www.grinninglizard.com/tinyxml
LICENSE=	zlib
MAINTAINER=	charles.lesire@onera.fr

WRKSRC=		${WRKDIR}/${PKGBASE}

CMAKE_ARGS+=	-DTIXML_USE_STL=ON

include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

post-extract:
	${RUN} ${CP} ${FILESDIR}/CMakeLists.txt ${WRKSRC}/.
