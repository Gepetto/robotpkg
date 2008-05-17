# $Id: Makefile 2007/11/27 11:43:03 mallet $

DISTNAME=		dtm-genom-0.1
CATEGORIES=		path	
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Digital Terrain Model Construction  - GenoM component

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes
USE_PKG_CONFIG=		yes

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
include ../../path/libdtm/depend.mk
include ../../mk/robotpkg.mk
