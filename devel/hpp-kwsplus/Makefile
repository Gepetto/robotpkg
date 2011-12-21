# robotpkg Makefile for:	devel/hpp-kwsplus
# Created:			Anthony Mallet on Fri, 13 Jul 2007
#

DISTNAME=	kwsplus-${VERSION}
PKGNAME=	hpp-kwsplus-${VERSION}
VERSION=	2.1

CATEGORIES=	devel
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}kwsPlus
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=kwsplus/}

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=
COMMENT=	Helper functions for KineoWorks(tm) package.
LICENSE=	cnrs-hpp-closed-source

USE_LANGUAGES+=	c c++

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-lapack=${PREFIX.lapack}

DOXYGEN_PLIST_DIR+=	share/doc/kwsPlus

# Options
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

include ../../math/lapack/depend.mk
include ../../math/boost-numeric-bindings-v1/depend.mk
include ../../devel/hpp-kwsio/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/latex.mk
include ../../mk/robotpkg.mk
