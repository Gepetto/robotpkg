#
# Copyright (c) 2009 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#  Xavier Broquere, on Tue Mar 10 2009
#

DISTNAME=	qarm-genom-1.1
CATEGORIES=	robots
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	daniel@laas.fr
#HOMEPAGE=	softs.laas.fr:/ftp/pub/openrobots/
COMMENT=	Control PA10-6C Mitsubishi arm in C-space

GNU_CONFIGURE=	yes

GENOM_MODULE=	qarm
include ../../architecture/genom/depend.mk

include ../../hardware/pa10-libs/depend.mk
include ../../math/gbM/depend.mk
include ../../pkgtools/pkg-config/depend.mk

include ../../mk/robotpkg.mk
