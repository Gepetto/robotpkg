#
# Copyright (c) 2008,2010 LAAS/CNRS
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

DISTNAME=		stereopixel-genom-1.2
PKGREVISION=		1
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/stereopixel-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Stereo-vision by pixel correlation - GenoM component
LICENSE=		2-clause-bsd

GENOM_MODULE=		stereopixel

define PKG_OPTION_UNSET.api
  include ../../image/libstereopixel/depend.mk
  include ../../image/libimages3d/depend.mk
  include ../../image/opencv/depend.mk
endef

include ../../image/viam-genom/depend.mk
include ../../architecture/genom/depend.mk
include ../../mk/robotpkg.mk
