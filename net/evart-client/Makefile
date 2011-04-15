# robotpkg Makefile for:	net/evart-client
# Created:			Anthony Mallet on Tue, 15 Jul 2008
#

VERSION=		2.1
DISTNAME=		evart-client-${VERSION}

CATEGORIES=		net
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=evart/}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/evart-client

MAINTAINER=		mallet@laas.fr
#HOMEPAGE=
COMMENT=		EVa Real-Time Software data streaming API.
LICENSE=		2-clause-bsd

GNU_CONFIGURE=          yes
BUILD_TARGET=		all
INSTALL_TARGET=		install

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  BUILD_TARGET+=	doc
  INSTALL_TARGET+=	install-doc
  DOXYGEN_PLIST_DIR+=	share/doc/evart-client
  include ../../mk/sysdep/doxygen.mk
endef

include ../../mk/robotpkg.mk
