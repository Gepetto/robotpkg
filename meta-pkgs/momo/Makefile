# robotpkg Makefile for:	meta-pkg/laas-momo
# Created:			Pierrick Koch on Mon, 24 Aug 2015
#

MOMO_DATE=	20150824
DISTNAME=	laas-momo-${MOMO_DATE}

CATEGORIES=	meta-pkgs
COMMENT=	Momo Software

META_PACKAGE=	yes

#include ../../robots/ivmob-genom/depend.mk
#DEPEND_ABI.ivmob-genom+=	ivmob-genom~gyro

include ../../path/p3d-genom/depend.mk
#DEPEND_ABI.p3d-genom+=		~ivmob

include ../../graphics/gdhe/depend.mk
include ../../hardware/velodyne-genom/depend.mk
include ../../localization/GPS-genom/depend.mk
include ../../localization/MTI-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mapping/dtm-genom/depend.mk
include ../../shell/eltclsh/depend.mk
include ../../www/picoweb/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
