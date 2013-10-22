# robotpkg Makefile for:	meta-pkg/laas-minnie
# Created:			Arnaud Degroote on Tue, 22 Oct 2013
#

MINNIE_DATE=	20131022
DISTNAME=	laas-minnie-${MINNIE_DATE}

CATEGORIES=	meta-pkgs
COMMENT=	Minnie Software

META_PACKAGE=	yes

include ../../robots/rmp440-genom/depend.mk
DEPEND_ABI.rmp440-genom+=	rmp440-genom~gyro

include ../../path/p3d-genom/depend.mk
DEPEND_ABI.p3d-genom+=		~rmp440

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
