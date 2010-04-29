#
# Copyright (c) 2010 LAAS/CNRS
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#


DISTNAME=		rmp400-genom-0.1
CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=rmp400/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/rmp400-genom

MAINTAINER=		openrobots@laas.fr
COMMENT=		GenoM interface module for the Segway RMP400

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
include ../../mk/robotpkg.mk
