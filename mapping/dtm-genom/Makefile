# $LAAS: Makefile 2008/05/25 15:18:47 tho $
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
#                                      Arnaud Degroote on Sat May 17 2008
#

DISTNAME=		dtm-genom-1.1
CATEGORIES=		mapping
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/dtm-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Digital Terrain Model Construction  - GenoM component

GNU_CONFIGURE=		yes

# options
PKG_SUPPORTED_OPTIONS+=	gdhe
PKG_OPTION_DESCR.gdhe=	Enable gdhe support to display DTM
define PKG_OPTION_SET.gdhe
  GENOM_ARGS+= -DGDHE
  include ../../graphics/gdhe/depend.mk
endef
define PKG_OPTIONS_UNSET.gdhe
 GENOM_ARGS:=	$(filter-out -DGDHE,${GENOM_ARGS})
endef

GENOM_MODULE=		dtm
include ../../architecture/genom/depend.mk

include ../../architecture/genBasic-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../image/libimages3d/depend.mk
include ../../image/viam-genom/depend.mk
include ../../image/stereopixel-genom/depend.mk
include ../../math/t3d/depend.mk
include ../../mapping/libdtm/depend.mk
include ../../mk/robotpkg.mk
