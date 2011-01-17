# robotpkg Makefile for:	localization/gyro-genom
# Created:			Arnaud Degroote on Mon, 19 May 2008
#

DISTNAME=		gyro-genom-0.3
PKGREVISION=		1
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/gyro-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for gyro management

GNU_CONFIGURE=		yes
# Gyro options
PKG_OPTIONS_REQUIRED_GROUPS=	gyro-hardware
PKG_OPTIONS_GROUP.gyro-hardware=	gyroKVH1000	gyroKVH5000

PKG_OPTION_DESCR.gyroKVH1000=	Enable support for gyroKVH1000
define PKG_OPTION_SET.gyroKVH1000
	GENOM_ARGS+= -DGYRO=gyroKVH1000Task
	include ../../hardware/gyroKVH1000/depend.mk
endef

PKG_OPTION_DESCR.gyroKVH5000=	Enable support for gyroKVH5000
define PKG_OPTION_SET.gyroKVH5000
	GENOM_ARGS+= -DGYRO=gyroKVH5000
	include ../../hardware/gyroKVH5000/depend.mk
endef

GENOM_MODULE=		gyro
include ../../architecture/genom/depend.mk

include ../../interfaces/genBasic-genom/depend.mk
include ../../mk/robotpkg.mk
