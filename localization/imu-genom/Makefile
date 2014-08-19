# robotpkg Makefile for:	robots/imu-genom
# Created:			Arnaud Degroote on Mon, 19 May 2008
#

PKGREVISION=		1
DISTNAME=		imu-genom-0.2
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for IMU management.

GNU_CONFIGURE=		yes

PKG_OPTIONS_REQUIRED_GROUPS=	robot
PKG_OPTIONS_GROUP.robot=	atrv atrv-junior

PKG_OPTION_DESCR.atrv=	Enable support for atrv platform
PKG_OPTION_SET.atrv:=	GENOM_ARGS+= -DATRV

PKG_OPTION_DESCR.atrv-junior=	Enable support for atrv-junior platform
PKG_OPTION_SET.atrv-junior:=	GENOM_ARGS+= -DATRV_JUNIOR

GENOM_MODULE=		imu
include ../../architecture/genom/depend.mk

include ../../interfaces/genBasic-genom/depend.mk
include ../../localization/gyro-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
