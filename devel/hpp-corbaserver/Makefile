# robotpkg Makefile for:	devel/hpp-corbaserver
# Created:			Anthony Mallet on Mon, 27 Aug 2007
#

DISTNAME=	hpp-corbaserver-${VERSION}
PKGNAME=	hpp-corbaserver-${VERSION}
VERSION=	1.15

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-corbaserver/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}corba/hpp-corbaserver

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=
COMMENT=	Corba interface with hppCore package.
LICENSE=	cnrs-hpp-closed-source

MAKE_JOBS_SAFE= no
USE_LANGUAGES+=	c c++

GNU_CONFIGURE=	yes
DOXYGEN_PLIST_DIR+= share/doc/hpp-corbaserver


# --- options --------------------------------------------------------

# OpenHRP(tm) support
PKG_SUPPORTED_OPTIONS+=	openhrp
PKG_SUGGESTED_OPTIONS+=	openhrp

PKG_OPTION_DESCR.openhrp=	Build an OpenHRP(tm) client.
define PKG_OPTION_SET.openhrp
  CONFIGURE_ARGS+=	--enable-openhrp
  include ../../robots/hrp2-builder/depend.mk
  include ../../math/hrp2-dynamics/depend.mk
  include ../../path/hpp-openhrp/depend.mk
  include ../../devel/jrl-modelloader/depend.mk
  include ../../robots/hrp2-14/depend.mk
endef

# Verbosity
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

# --------------------------------------------------------------------

include ../../devel/hpp-util/depend.mk
include ../../path/hpp-core/depend.mk
include ../../middleware/omniORB/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
