# robotpkg Makefile for:	meta-pkgs/laas-dala
# Created:			Arnaud Degroote on Mon, 19 May 2008
#

#
# --- All DALA current software --------------------------------------
#

DALA_DATE=	20120302
DISTNAME=       laas-dala-${DALA_DATE}
CATEGORIES=     meta-pkgs
COMMENT=        Dala Software
META_PACKAGE=	yes

include ../../hardware/platine-genom/depend.mk
include ../../hardware/sick-genom/depend.mk
include ../../image/stereopixel-genom/depend.mk
include ../../image/viam-genom/depend.mk
include ../../localization/GPS-genom/depend.mk
include ../../localization/MTI-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mapping/dtm-genom/depend.mk
include ../../motion/pilo-genom/depend.mk
include ../../path/libp3d/depend.mk
include ../../path/ndd-genom/depend.mk
include ../../path/p3d-genom/depend.mk
include ../../robots/rflex-genom/depend.mk

DEPEND_ABI.libp3d+=		~atrv
DEPEND_ABI.p3d-genom+=		~atrv
DEPEND_ABI.pilo-genom+=		~atrv
DEPEND_ABI.rflex-genom+=	~atrv+gyroKVH5000
DEPEND_ABI.sick-genom+=		~atrv

include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
