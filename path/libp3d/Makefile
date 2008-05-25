# $LAAS: Makefile 2008/05/25 15:16:35 tho $
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
#                                      Arnaud Degroote on Fri May 16 2008
#

DISTNAME=		libp3d-1.0
CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Local path planning

GNU_CONFIGURE=		yes

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
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
