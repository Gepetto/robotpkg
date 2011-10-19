# robotpkg Makefile for:	path/libp3d
# Created:			Arnaud Degroote on Fri, 16 May 2008
#

DISTNAME=		libp3d-${VERSION}
VERSION=		1.3
PKGREVISION=		1
CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=libp3d/}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/libp3d


MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Local 3D path planning on a digital elevation map
LICENSE=		isc

GNU_CONFIGURE=		yes

# Robot options
PKG_OPTIONS_REQUIRED_GROUPS=	robot
PKG_OPTIONS_GROUP.robot=	atrv lama trooper rmp400

PKG_OPTION_DESCR.atrv=	Enable support for ATRV (DALA) platform
PKG_OPTION_SET.atrv:=	CONFIGURE_ARGS+=--with-platform=ATRV

PKG_OPTION_DESCR.lama=	Enable support for lama platform
PKG_OPTION_SET.lama=	CONFIGURE_ARGS+=--with-platform=LAMA

PKG_OPTION_DESCR.trooper= Enable support for trooper platform
PKG_OPTION_SET.trooper=	  CONFIGURE_ARGS+=--with-platform=TROOPER

PKG_OPTION_DESCR.rmp400 = Enable support for RMP400 (MANA) platform
PKG_OPTION_SET.rmp400=	  CONFIGURE_ARGS+=--with-platform=RMP400

# Display option
PKG_SUPPORTED_OPTIONS+=		display
PKG_SUGGESTED_OPTIONS+=		display
PKG_OPTION_DESCR.display?=	Enable support for 3D graphic display

define PKG_OPTION_SET.display
  include ../../graphics/gdhe/depend.mk
endef
define PKG_OPTION_UNSET.display
  CONFIGURE_ARGS+=	HAS_GDHE=no GDHE_CFLAGS= GDHE_LIBS=
endef

include ../../math/t3d/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
