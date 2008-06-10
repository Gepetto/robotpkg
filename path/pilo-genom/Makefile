# $LAAS: Makefile 2008/05/25 15:20:30 tho $
#
# Copyright (c) 2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice  and this list of  conditions in the documentation   and/or
#      other materials provided with the distribution.
#
#                                      Arnaud Degroote on Tue Jun 10 2008
#

DISTNAME=		pilo-genom-0.1
CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://intranet.laas.fr/intranet/robots/wiki/OpenRobots/ModulesGuide/PiloModule
COMMENT=		GenoM component - compute smooth trajectory

GNU_CONFIGURE=		yes

GENOM_MODULE=		pilo
include ../../architecture/genom/depend.mk

PKG_OPTIONS_REQUIRED_GROUPS=	robot
PKG_OPTIONS_GROUP.robot=	atrv b21r h2 jido xr4000 fake

PKG_OPTION_DESCR.atrv=	Enable support for atrv platform
define PKG_OPTION_SET.atrv
	GENOM_ARGS+= -DATRV
	include ../../robots/rflex-genom/depend.mk
endef

PKG_OPTION_DESCR.b21r=	Enable support for b21R platform
define PKG_OPTION_SET.b21r
	GENOM_ARGS+= -DB21R
	include ../../robots/rflex-genom/depend.mk
endef

PKG_OPTION_DESCR.h2=  Enable support for H2 platform
PKG_OPTION_SET.h2:=	GENOM_ARGS+= -DH2

PKG_OPTION_DESCR.jido=  Enable support for jido platform
PKG_OPTION_SET.jido:=	GENOM_ARGS+= -DJIDO

PKG_OPTION_DESCR.xr4000=  Enable support for xr4000 platform
PKG_OPTION_SET.xr4000:=	GENOM_ARGS+= -DXR4000

PKG_OPTION_DESCR.fake=  Enable support for a fake platform
PKG_OPTION_SET.fake:=	GENOM_ARGS+= -DFAKE

include ../../architecture/genPos-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/robotpkg.mk
