# $LAAS: Makefile 2009/01/15 19:35:12 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
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
#                                       Anthony Mallet on Fri Mar 14 2008
#

DISTNAME=		viam-genom-1.3
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=viam-genom/}
MASTER_REPOSITORY=  git ssh://softs.laas.fr/git/robots/viam-genom

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.laas.fr/~mallet
COMMENT=		Versatile Image Acquisition Module - GenoM component

GNU_CONFIGURE=		yes

GENOM_MODULE=		viam
include ../../architecture/genom/depend.mk

# option for image display using opencv
PKG_SUPPORTED_OPTIONS+=	display
PKG_SUGGESTED_OPTIONS+=	display

PKG_OPTION_DESCR.display=	Enable embedded image display facility.
define PKG_OPTION_SET.display
# XXX fixme in viam-genom  CONFIGURE_ARGS+=		--enable-display
  REQD_BUILD_OPTIONS.opencv+=	gtk
  REQD_BUILD_OPTIONS.viam-libs+=opencv
  include ../../image/opencv/depend.mk
endef
PKG_OPTION_UNSET.display:=	CONFIGURE_ARGS+=--disable-display

include ../../image/viam-libs/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/robotpkg.mk
