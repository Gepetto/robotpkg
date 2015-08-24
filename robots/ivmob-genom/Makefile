# robotpkg Makefile for:	robots/ivmob-genom
# Created:			Matthieu Herrb on Sat, 22 Aug 2015
#

DISTNAME=		ivmob-genom-${VERSION}
VERSION=		1.1
CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=ivmob/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}ivmob/ivmob-genom

MAINTAINER=		openrobots@laas.fr
COMMENT=		GenoM interface module for the Sterela 4MOB

LICENSE=		isc

GENOM_MODULE=		ivmob

PKG_SUPPORTED_OPTIONS+= gyro
PKG_OPTION_DESCR.gyro= Enable gyro support
define PKG_OPTION_SET.gyro
	include ../../hardware/gyro-libs/depend.mk
	GENOM_ARGS += -DGYRO
endef

define PKG_OPTION_UNSET.api
	include ../../robots/ivmob-libs/depend.mk
	include ../../motion/contlaw/depend.mk
endef

include ../../architecture/genom/depend.mk
include ../../interfaces/genBasic-genom/depend.mk
include ../../interfaces/genPos-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
