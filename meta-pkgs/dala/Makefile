# robotpkg Makefile for:	meta-pkgs/laas-dala
# Created:			Arnaud Degroote on Mon, 19 May 2008
#

#
# --- All DALA current software --------------------------------------
#

DALA_DATE=		20100510
DISTNAME=       laas-dala-${DALA_DATE}
CATEGORIES=     meta-pkgs
COMMENT=        Dala Software
META_PACKAGE=	yes

include ../../path/libp3d/depend.mk
DEPEND_ABI.libp3d+=		libp3d~atrv

include ../../motion/pilo-genom/depend.mk
DEPEND_ABI.pilo-genom+=		pilo-genom~atrv

include ../../robots/rflex-genom/depend.mk
DEPEND_ABI.rflex-genom+=	rflex-genom~atrv+gyroKVH5000

include ../../image/stereopixel-genom/depend.mk
include ../../image/viam-genom/depend.mk
include ../../localization/GPS-genom/depend.mk
include ../../localization/MTI-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mapping/dtm-genom/depend.mk
include ../../path/ndd-genom/depend.mk
include ../../path/p3d-genom/depend.mk
include ../../hardware/platine-genom/depend.mk
include ../../hardware/sick-genom/depend.mk
include ../../mk/robotpkg.mk
