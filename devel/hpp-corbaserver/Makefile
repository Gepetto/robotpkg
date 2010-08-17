# robotpkg Makefile for:	devel/hpp-corbaserver
# Created:			Anthony Mallet on Mon, 27 Aug 2007
#

DISTNAME=	hppCorbaServer-${VERSION}
PKGNAME=	hpp-corbaserver-${VERSION}
VERSION=	1.8.3

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-corbaserver/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}hppCorbaServer

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=
COMMENT=	Corba interface with hppCore package.

USE_LANGUAGES+=	c c++

GNU_CONFIGURE=	yes
DOXYGEN_PLIST_DIR+= share/doc/hppCorbaServer


# --- options --------------------------------------------------------

# OpenHRP(tm) support
PKG_SUPPORTED_OPTIONS+=	openhrp
PKG_SUGGESTED_OPTIONS+=	openhrp

PKG_OPTION_DESCR.openhrp=	Build an OpenHRP(tm) client.
define PKG_OPTION_SET.openhrp
  CONFIGURE_ARGS+=	--with-openhrp
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

include ../../path/hpp-core/depend.mk
include ../../devel/omniORB/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
