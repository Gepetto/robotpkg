# robotpkg Makefile for:	mapping/dtm-genom
# Created:			Arnaud Degroote on Thu, 6 Aug 2009
#

DISTNAME=		dtm-genom-${VERSION}
VERSION=		1.2
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

define PKG_OPTION_UNSET.api
  include ../../image/libimages3d/depend.mk
  include ../../image/viam-genom/depend.mk
  include ../../mapping/libdtm/depend.mk
  include ../../math/t3d/depend.mk
endef

GENOM_MODULE=		dtm
include ../../architecture/genom/depend.mk

include ../../interfaces/genBasic-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../hardware/velodyne-genom/depend.mk
include ../../image/stereopixel-genom/depend.mk
include ../../mk/robotpkg.mk
