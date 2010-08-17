# robotpkg Makefile for:	knowledge/liboro
# Created:			Anthony Mallet on Fri, 12 Jun 2009
#

DISTNAME=		liboro-0.7.7
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=liboro/}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/liboro

CATEGORIES=		knowledge
MAINTAINER=		severin.lemaignan@laas.fr
LICENSE=		isc
HOMEPAGE=		http://homepages.laas.fr/slemaign/oro-server/oro-server-bindings.html
COMMENT=		C++ interface to the oro-server ontology server.

USE_LANGUAGES+=		c c++
BUILD_TARGET=		all
INSTALL_TARGET=		install

CMAKE_ARGS+=		-DLIBORO_SOURCE_DIR=${WRKSRC}
CMAKE_ARGS+=		-DBOOST_INCLUDEDIR=${PREFIX.boost-headers}/include
CMAKE_ARGS+=		-DBOOST_LIBRARYDIR=${PREFIX.boost-libs}/lib

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  BUILD_TARGET+=	doc
  INSTALL_TARGET+=	install-doc
  DOXYGEN_PLIST_DIR+=	share/doc/liboro
  include ../../mk/sysdep/doxygen.mk
endef

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
