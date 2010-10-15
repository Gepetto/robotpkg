# robotpkg Makefile for:	math/libt3d
# Created:			Anthony Mallet on Fri, 2 Feb 2007
#

DISTNAME=	libt3d-2.6
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=libt3d/}
MASTER_REPOSITORY=git ssh://softs.laas.fr/git/robots/t3d

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=
COMMENT=	3d transformations, matrices and vector package.
LICENSE=	2-clause-bsd

NOT_FOR_PLATFORM= # empty
USE_LANGUAGES+=	c c++
GNU_CONFIGURE=	yes

BUILD_TARGET=	all
INSTALL_TARGET=	install

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  BUILD_TARGET+=	doc
  INSTALL_TARGET+=	install-doc
  DOXYGEN_PLIST_DIR+=	share/doc/libt3d
  include ../../mk/sysdep/doxygen.mk
endef

include ../../mk/robotpkg.mk
