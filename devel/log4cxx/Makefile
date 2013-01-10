# robotpkg Makefile for:	devel/log4cxx
# Created:			Anthony Mallet on Mon, 17 Jan 2011
#

PKGNAME=	log4cxx-${PKGVERSION}
DISTNAME=	apache-log4cxx-${PKGVERSION_NOREV}
PKGVERSION=	0.10.0
MASTER_SITES=	http://archive.apache.org/dist/logging/log4cxx/${PKGVERSION}/

CATEGORIES=	devel
HOMEPAGE=	http://logging.apache.org/log4cxx/
MAINTAINER=	mallet@laas.fr
COMMENT=	Log4cxx is a port to C++ of the Log4j project
LICENSE=	apache-2.0

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-apr=${APR_CONFIG}
CONFIGURE_ARGS+=--with-apr-util=${APU_CONFIG}

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  CONFIGURE_ARGS+=	--enable-doxygen
  DOXYGEN_PLIST_DIR+=	share/doc/${PKGBASE}
  include ../../mk/sysdep/doxygen.mk
endef
define PKG_OPTION_UNSET.doc
  CONFIGURE_ARGS+=	--disable-doxygen
endef

include ../../mk/sysdep/apr.mk
include ../../mk/sysdep/apr-util.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
