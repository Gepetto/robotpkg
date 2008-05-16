# $Id $

DISTNAME=		libp3d-1.0
CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Local path planning

GNU_CONFIGURE=		yes
USE_PKG_CONFIG=		yes

# options
# It is really wrong, we need to use PKG_OPTIONS_REQUIRED_GROUP but we don't
# have it in robotpkg
PKG_SUPPORTED_OPTIONS+=	dala lama trooper

PKG_OPTION_DESCR.dala=	Enable support for dala platform (Use only one option please)
PKG_OPTION_SET.dala:=	CONFIGURE_ARGS+=--with-platform=ATRV

PKG_OPTION_DESCR.lama= Enable support for lama platform (Use only one option please)
PKG_OPTION_SET.lama=  	CONFIGURE_ARGS+=--with-platform=LAMA

PKG_OPTION_DESCR.trooper= Enable support for trooper platform (Use only one option please)
PKG_OPTION_SET.trooper=  CONFIGURE_ARGS+=--with-platfrom=TROOPER

include ../../math/t3d/depend.mk
include ../../mk/robotpkg.mk
