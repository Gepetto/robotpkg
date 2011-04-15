# robotpkg Makefile for:	devel/hpp-model
# Created:			Anthony Mallet on Mon, 18 Feb 2008
#

DISTNAME=	hppmodel-${VERSION}
PKGNAME=	hpp-model-${VERSION}
VERSION=	1.7.6

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-model/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}hppModel

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Robots, humanoid robots, joints and bodies with dynamics properties
LICENSE=	cnrs-hpp-closed-source

USE_LANGUAGES+=	c c++

GNU_CONFIGURE=	yes

DOXYGEN_PLIST_DIR+=	share/doc/hppModel

# options
PKG_SUPPORTED_OPTIONS+=	jrl-dynamics
PKG_SUGGESTED_OPTIONS+=	jrl-dynamics

PKG_OPTION_DESCR.jrl-dynamics=Use jrl-dynamics package for dynamic model implementation.
define PKG_OPTION_SET.jrl-dynamics
  CONFIGURE_ARGS+=	--with-robotDynamics=dynamicsJRLJapan
  include ../../math/jrl-dynamics/depend.mk
endef

# options
PKG_OPTIONS_OPTIONAL_GROUPS+=	verbose
PKG_OPTIONS_GROUP.verbose=	verbose1 verbose2

PKG_OPTION_DESCR.verbose1=	Set the level of verbosity to 1
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

PKG_OPTION_DESCR.verbose2=	Set the level of verbosity to 2
PKG_OPTION_SET.verbose2:=	CXXFLAGS+=-DDEBUG=2

include ../../mk/sysdep/doxygen.mk
include ../../path/kineo-pp/depend.mk
include ../../devel/hpp-kwsio/depend.mk
include ../../interfaces/abstract-robot-dynamics/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
