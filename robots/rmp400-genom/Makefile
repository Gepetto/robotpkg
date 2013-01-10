# robotpkg Makefile for:	robots/rmp400-genom
# Created:			Matthieu Herrb on Thu, 29 Apr 2010
#


DISTNAME=		rmp400-genom-${VERSION}
VERSION=		0.7
PKGREVISION=	1
CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=rmp400/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}rmp400-genom

MAINTAINER=		openrobots@laas.fr
COMMENT=		GenoM interface module for the Segway RMP400

LICENSE=		isc

GENOM_MODULE=		rmp400

PKG_SUPPORTED_OPTIONS+= gyro
PKG_OPTION_DESCR.gyro= Enable gyro support
define PKG_OPTION_SET.gyro
	include ../../hardware/gyro-libs/depend.mk
	GENOM_ARGS += -DGYRO
endef

PKG_SUPPORTED_OPTIONS+= mana-emergency
PKG_OPTION_DESCR.mana-emergency= Enable support for Mana emergency stop device
define PKG_OPTION_SET.mana-emergency
  include ../../robots/mana-emergency/depend.mk
  GENOM_ARGS += -DWITH_FELIB
endef

define PKG_OPTION_UNSET.api
	include ../../robots/rmp-libs/depend.mk
	include ../../motion/contlaw/depend.mk
endef

include ../../architecture/genom/depend.mk
include ../../interfaces/genBasic-genom/depend.mk
include ../../interfaces/genPos-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
