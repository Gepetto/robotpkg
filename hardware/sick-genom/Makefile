# robotpkg Makefile for:	hardware/sick-genom
# Created:			Anthony Mallet on Tue, 17 Jun 2008
#

DISTNAME=		sick-genom-0.1
CATEGORIES=		hardware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for sick management.

GNU_CONFIGURE=		yes

PKG_OPTIONS_REQUIRED_GROUPS=	robot
PKG_OPTIONS_GROUP.robot=	atrv h2 xr4000

PKG_OPTION_DESCR.atrv=	Enable support for atrv platform
PKG_OPTION_SET.atrv:=	GENOM_ARGS+= -DATRV

PKG_OPTION_DESCR.h2=	Enable support for h2 platform
PKG_OPTION_SET.h2:=	GENOM_ARGS+= -DH2

PKG_OPTION_DESCR.xr4000=	Enable support for xr4000 platform
PKG_OPTION_SET.xr4000:=	GENOM_ARGS+= -DXR4000

PKG_SUPPORTED_OPTIONS+=	sick2
PKG_OPTION_DESCR.sick2=	Enable the support to use a second sick
PKG_OPTION_SET.sick2:=	GENOM_ARGS+= -DSICK2

GENOM_MODULE=		sick
include ../../architecture/genom/depend.mk

include ../../architecture/genBasic-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mapping/mapkit/depend.mk
include ../../hardware/sickLib/depend.mk
include ../../mk/robotpkg.mk
