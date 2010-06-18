# $LAAS: Makefile 2008/06/17 18:02:30 mallet $
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

DISTNAME=		rflex-genom-0.3
CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/rflex-genom
PKGREVISION=		1

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for rFlex management.

GNU_CONFIGURE=		yes

PKG_OPTIONS_REQUIRED_GROUPS=	robot
PKG_OPTIONS_GROUP.robot=	atrv atrv-junior b21r

PKG_OPTION_DESCR.atrv=	Enable support for atrv platform
PKG_OPTION_SET.atrv:=	GENOM_ARGS+= -DATRV

PKG_OPTION_DESCR.atrv-junior=	Enable support for atrv-junior platform
PKG_OPTION_SET.atrv-junior:=	GENOM_ARGS+= -DATRV_JUNIOR

PKG_OPTION_DESCR.b21r=	Enable support for b21R platform
PKG_OPTION_SET.b21r:=	GENOM_ARGS+= -DB21R

PKG_OPTIONS_OPTIONAL_GROUPS=	gyro
PKG_OPTIONS_GROUP.gyro=			gyro-client gyroKVH1000 gyroKVH5000

PKG_OPTION_DESCR.gyro-client=	Enable gyro support using gyro GeNoM module
define PKG_OPTION_SET.gyro-client
  include ../../localization/gyro-genom/depend.mk
  GENOM_ARGS += -DGYRO=gyro-client
endef

PKG_OPTION_DESCR.gyroKVH1000=	Enable gyro support using directly gyroKVH1000
define PKG_OPTION_SET.gyroKVH1000
  include ../../hardware/gyroKVH1000/depend.mk
  GENOM_ARGS += -DGYRO=gyroKVH1000Task
endef

PKG_OPTION_DESCR.gyroKVH5000=	Enable gyro support using directly gyroKVH5000
define PKG_OPTION_SET.gyroKVH5000
  include ../../hardware/gyroKVH5000/depend.mk
  GENOM_ARGS += -DGYRO=gyroKVH5000
endef

GENOM_MODULE=		rflex
include ../../architecture/genom/depend.mk

include ../../architecture/genPos-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../robots/rflexclients/depend.mk
include ../../mk/robotpkg.mk
