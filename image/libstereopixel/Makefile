# $LAAS: Makefile 2008/05/25 14:06:40 tho $
#
# Copyright (c) 2007-2008 LAAS/CNRS
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
#                                       Anthony Mallet on Wed Dec  5 2007
#

DISTNAME=		libstereopixel-1.2
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/libstereopixel

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Stereo-vision by pixel correlation

GNU_CONFIGURE=		yes

# options
PKG_SUPPORTED_OPTIONS+=	calife

PKG_OPTION_DESCR.calife=	Enable calife compatibility (Don't set it if you don't know what it means)
PKG_OPTION_SET.calife:=		CONFIGURE_ARGS+=--enable-calife
PKG_OPTIONS_UNSET.calife:=	CONFIGURE_ARGS+=--disable-calife

include ../../image/libimages3d/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
