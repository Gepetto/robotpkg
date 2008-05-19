# $Id $

DISTNAME=		libp3d-1.0
CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Local path planning

GNU_CONFIGURE=		yes
USE_PKG_CONFIG=		yes

# Robot options
PKG_OPTIONS_REQUIRED_GROUPS=	robot
PKG_OPTIONS_GROUP.robot=	atrv lama trooper

PKG_OPTION_DESCR.atrv=	Enable support for ATRV (DALA) platform
PKG_OPTION_SET.atrv:=	CONFIGURE_ARGS+=--with-platform=ATRV

PKG_OPTION_DESCR.lama=	Enable support for lama platform
PKG_OPTION_SET.lama=	CONFIGURE_ARGS+=--with-platform=LAMA

PKG_OPTION_DESCR.trooper= Enable support for trooper platform
PKG_OPTION_SET.trooper=	  CONFIGURE_ARGS+=--with-platfrom=TROOPER

include ../../math/t3d/depend.mk
include ../../mk/robotpkg.mk
