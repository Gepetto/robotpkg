# $LAAS: Makefile 2008/05/25 14:26:19 tho $
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
#                                      Arnaud Degroote on Mon May 19 2008
#

DISTNAME=		imu-genom-0.1
CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for IMU management.

GNU_CONFIGURE=		yes

PKG_OPTIONS_REQUIRED_GROUPS=	robot
PKG_OPTIONS_GROUP.robot=	atrv atrv-junior b21r

PKG_OPTION_DESCR.atrv=	Enable support for atrv platform
PKG_OPTION_SET.atrv:=	GENOM_ARGS+= -DATRV

PKG_OPTION_DESCR.atrv-junior=	Enable support for atrv-junior platform
PKG_OPTION_SET.atrv-junior:=	GENOM_ARGS+= -DATRV_JUNIOR

PKG_OPTION_DESCR.b21r=	Enable support for b21R platform
PKG_OPTION_SET.b21r:=	GENOM_ARGS+= -DB21R

GENOM_MODULE=		imu
include ../../architecture/genom/depend.mk

include ../../architecture/genBasic-genom/depend.mk
include ../../localization/gyro-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/robotpkg.mk
