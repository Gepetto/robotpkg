# $Id: Makefile 2008/02/18 14:41:29 mallet $

DISTNAME=	hppmodel-${VERSION}
PKGNAME=	hpp-model-${VERSION}
VERSION=	1.3

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	Robots, humanoid robots, joints and bodies with dynamics properties.

DEPENDS+=	jrl-interface-dynamics>=1.8:../../interfaces/jrl-interface-dynamics
DEPENDS+=	hpp-kwsio>=1.0.1:../../devel/hpp-kwsio

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

# options
PKG_SUPPORTED_OPTIONS+=	jrl-dynamics
PKG_SUGGESTED_OPTIONS+=	jrl-dynamics

PKG_OPTION_DESCR.jrl-dynamics=Use jrl-dynamics package for dynamic model implementation.
define PKG_OPTION_SET.jrl-dynamics
CONFIGURE_ARGS+=	--with-robotDynamics=dynamicsJRLJapan
DEPENDS+=		jrl-dynamics>=1.7:../../math/jrl-dynamics
endef

include ../../path/kineo-pp/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk
