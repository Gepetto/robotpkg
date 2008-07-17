# $LAAS: Makefile 2008/06/17 18:27:43 mallet $
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

#
# --- All DALA current software --------------------------------------
#

DALA_DATE=		20080717
DISTNAME=       laas-dala-${DALA_DATE}
DISTFILES=      # empty
CATEGORIES=     meta-pkgs
COMMENT=        Dala Software

NO_CHECKSUM=    yes
NO_CONFIGURE=   yes
NO_BUILD=       yes
WRKSRC=         ${WRKDIR}

include ../../image/stereopixel-genom/depend.mk
include ../../image/viam-genom/depend.mk
include ../../localization/GPS-genom/depend.mk
include ../../localization/MTI-genom/depend.mk
include ../../localization/imu-genom/depend.mk
include ../../localization/gyro-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../path/dtm-genom/depend.mk
include ../../path/ndd-genom/depend.mk
include ../../path/p3d-genom/depend.mk
include ../../hardware/platine-genom/depend.mk
include ../../robots/rflex-genom/depend.mk
include ../../hardware/sick-genom/depend.mk
include ../../mk/robotpkg.mk
