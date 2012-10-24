# robotpkg Makefile for:	path/p3d-genom
# Created:			Arnaud Degroote on Mon, 19 May 2008
#

DISTNAME=		p3d-genom-${VERSION}
VERSION=		1.4
CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}p3d-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Local path planning - GenoM component

GNU_CONFIGURE=		yes

PKG_SUPPORTED_OPTIONS+=	gdhe
PKG_OPTION_DESCR.gdhe=	Enable gdhe support to display p3d arcs
define PKG_OPTION_SET.gdhe
  GENOM_ARGS+= -DGDHE
  include ../../graphics/gdhe/depend.mk
endef
define PKG_OPTIONS_UNSET.gdhe
 GENOM_ARGS:=	$(filter-out -DGDHE,${GENOM_ARGS})
endef

PKG_OPTIONS_REQUIRED_GROUPS=	robot
PKG_OPTIONS_GROUP.robot=	atrv atrv-junior rmp400

PKG_OPTION_DESCR.atrv=	Enable support for atrv platform
define PKG_OPTION_SET.atrv
  GENOM_ARGS+= -DATRV
  include ../../robots/rflex-genom/depend.mk
  DEPEND_ABI.libp3d +=		~atrv
endef

PKG_OPTION_DESCR.atrv-junior=	Enable support for atrv-junior platform
define PKG_OPTION_SET.atrv-junior
  GENOM_ARGS+= -DATRV
  include ../../robots/rflex-genom/depend.mk
  DEPEND_ABI.libp3d +=		~atrv
endef

PKG_OPTION_DESCR.rmp400=	Enable support for rmp400 platform
define PKG_OPTION_SET.rmp400
  GENOM_ARGS+= -DRMP400
  include ../../robots/rmp400-genom/depend.mk
  DEPEND_ABI.libp3d +=		~rmp400
endef

define PKG_OPTION_UNSET.api
  include ../../path/libp3d/depend.mk
  include ../../math/t3d/depend.mk
endef


GENOM_MODULE=		p3d
include ../../architecture/genom/depend.mk

include ../../interfaces/genBasic-genom/depend.mk
include ../../interfaces/genPos-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mapping/dtm-genom/depend.mk
include ../../mk/robotpkg.mk
