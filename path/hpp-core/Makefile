# robotpkg Makefile for:	path/hpp-core
# Created:			Anthony Mallet on Fri, 13 Jul 2007
#

DISTNAME=	hpp-core-${VERSION}
PKGNAME=	hpp-core-${VERSION}
VERSION=	1.14

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-core/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}/algo/hpp-core

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Basic classes used as interfaces with KineoWorks(tm).
LICENSE=	cnrs-hpp-closed-source

USE_LANGUAGES+=	c c++

DOXYGEN_PLIST_DIR+=	share/doc/hppCore

# --- options --------------------------------------------------------

# ChppBody class
PKG_SUPPORTED_OPTIONS+=	with-body

PKG_OPTION_DESCR.with-body=	Use internal definition of ChppBody class.
PKG_OPTION_SET.with-body:=	CONFIGURE_ARGS+=	-DENABLE_BODY=YES
define PKG_OPTION_UNSET.with-body
  CONFIGURE_ARGS+=	-DENABLE_BODY=NO
  include ../../devel/hpp-model/depend.mk
endef

# verbosity
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

# --------------------------------------------------------------------

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../devel/hpp-kwsplus/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
