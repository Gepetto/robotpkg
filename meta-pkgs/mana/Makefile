#
# Copyright (c) 2010 CNRS/LAAS
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

# All mana current software

MANA_DATE=	20100730
DISTNAME=	laas-mana-${MANA_DATE}
DISTFILES=	# empty
CATEGORIES=	meta-pkg
COMMENT=	Mana Software

NO_CHECKSUM=	yes
NO_CONFIGURE=	yes
NO_BUILD=	yes
WRKSRC=		${WRKDIR}

REQD_BUILD_OPTIONS.pilo-genom=		rmp400
REQD_BUILD_OPTIONS.rmp400-genom=	gyroKVH1000

include ../../graphics/gdhe/depend.mk
include ../../hardware/platine-genom/depend.mk
include ../../image/stereopixel-genom/depend.mk
include ../../localization/GPS-genom/depend.mk
include ../../localization/MTI-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../motion/pilo-genom/depend.mk
include ../../robots/rmp400-genom/depend.mk
include ../../shell/eltclsh/depend.mk
include ../../www/picoweb/depend.mk
include ../../mk/robotpkg.mk
