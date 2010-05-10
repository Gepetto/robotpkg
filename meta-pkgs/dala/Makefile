# $LAAS: Makefile 2008/06/17 18:27:43 mallet $
#
# Copyright (c) 2008, 2009, 2010 LAAS/CNRS
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

#
# --- All DALA current software --------------------------------------
#

DALA_DATE=		20100510
DISTNAME=       laas-dala-${DALA_DATE}
CATEGORIES=     meta-pkgs
COMMENT=        Dala Software
META_PACKAGE=	yes

REQD_BUILD_OPTIONS.pilo-genom=		atrv
REQD_BUILD_OPTIONS.libp3d=			atrv
REQD_BUILD_OPTIONS.rflex-genom=		atrv
REQD_BUILD_OPTIONS.rflex-genom=		gyroKVH5000
REQD_BUILD_OPTIONS.sick-genom=		atrv

include ../../image/stereopixel-genom/depend.mk
include ../../image/viam-genom/depend.mk
include ../../localization/GPS-genom/depend.mk
include ../../localization/MTI-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mapping/dtm-genom/depend.mk
include ../../path/ndd-genom/depend.mk
include ../../path/p3d-genom/depend.mk
include ../../hardware/platine-genom/depend.mk
include ../../robots/rflex-genom/depend.mk
include ../../hardware/sick-genom/depend.mk
include ../../mk/robotpkg.mk
