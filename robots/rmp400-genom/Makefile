# robotpkg Makefile for:	robots/rmp400-genom
# Created:			Matthieu Herrb on Thu, 29 Apr 2010
#


DISTNAME=		rmp400-genom-0.2
CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=rmp400/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/rmp400-genom

MAINTAINER=		openrobots@laas.fr
COMMENT=		GenoM interface module for the Segway RMP400

LICENCES=		isc

GNU_CONFIGURE=		yes

PKG_OPTIONS_OPTIONAL_GROUPS=	gyro
PKG_OPTIONS_GROUP.gyro=			gyro-client gyroKVH1000 gyroKVH5000

PKG_OPTION_DESCR.gyro-client=	Enable gyro support using gyro GeNoM module
define PKG_OPTION_SET.gyro-client
  include ../../localization/gyro-genom/depend.mk
  GENOM_ARGS += -DGYRO=gyro-client
endef

PKG_OPTION_DESCR.gyroKVH1000=	Enable gyro support using directly gyroKVH1000
define PKG_OPTION_SET.gyroKVH1000
  include ../../hardware/gyroKVH1000/depend.mk
  GENOM_ARGS += -DGYRO=gyroKVH1000Task
endef

PKG_OPTION_DESCR.gyroKVH5000=	Enable gyro support using directly gyroKVH5000
define PKG_OPTION_SET.gyroKVH5000
  include ../../hardware/gyroKVH5000/depend.mk
  GENOM_ARGS += -DGYRO=gyroKVH5000
endef

GENOM_MODULE=		rmp400
include ../../architecture/genom/depend.mk

include ../../architecture/genPos-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../robots/rmp-libs/depend.mk
include ../../motion/contlaw/depend.mk
include ../../mk/robotpkg.mk
