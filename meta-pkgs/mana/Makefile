# robotpkg Makefile for:	meta-pkg/laas-mana
# Created:			Matthieu Herrb on Thu, 29 Apr 2010
#

MANA_DATE=	20120223
DISTNAME=	laas-mana-${MANA_DATE}

CATEGORIES=	meta-pkg
COMMENT=	Mana Software

META_PACKAGE=	yes

include ../../motion/pilo-genom/depend.mk
DEPEND_ABI.pilo-genom+=		pilo-genom~rmp400

include ../../robots/rmp400-genom/depend.mk
DEPEND_ABI.rmp400-genom+=	rmp400-genom~gyroKVH1000

include ../../path/p3d-genom/depend.mk
DEPEND_ABI.p3d-genom+=		~rmp400

include ../../graphics/gdhe/depend.mk
include ../../hardware/platine-genom/depend.mk
include ../../hardware/velodyne-genom/depend.mk
include ../../image/stereopixel-genom/depend.mk
include ../../image/viam-dc1394-driver/depend.mk
include ../../image/viam-genom/depend.mk
include ../../localization/GPS-genom/depend.mk
include ../../localization/MTI-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mapping/dtm-genom/depend.mk
include ../../motion/pilo-genom/depend.mk
include ../../shell/eltclsh/depend.mk
include ../../www/picoweb/depend.mk
include ../../mk/robotpkg.mk
