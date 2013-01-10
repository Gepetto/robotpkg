# robotpkg Makefile for:	image/sift
# Created:			nksallem on Wed, 9 Jun 2010
#

PKGVERSION=		1.1.2
PKGREVISION=		1
DISTNAME=		sift-${PKGVERSION_NOREV}_20100521
PKGNAME=		sift-${PKGVERSION}
CATEGORIES=		image
MASTER_SITES=		http://web.engr.oregonstate.edu/~hess/downloads/sift/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://web.engr.oregonstate.edu/~hess
COMMENT=		C implementation of a SIFT image feature detector
LICENSE=		modified-bsd

WRKSRC=			${WRKDIR}/sift

MAKE_JOBS_SAFE=		no
NO_CONFIGURE=		yes
BUILD_TARGET=		all
INSTALL_TARGET=		install

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  BUILD_TARGET+=	docs
  INSTALL_TARGET+=	install-doc
  DOXYGEN_PLIST_DIR+=	share/doc/${PKGBASE}
  include ../../mk/sysdep/doxygen.mk
endef

include ../../image/opencv/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/gtk.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
