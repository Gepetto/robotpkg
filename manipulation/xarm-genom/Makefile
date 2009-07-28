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
#                                           Xavier Broquere, on Tue Mar 10 2009
#

DISTNAME=	xarm-genom-0.9
CATEGORIES=	manipulation
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	xbroquer@laas.fr
#HOMEPAGE=	softs.laas.fr:/ftp/pub/openrobots/
COMMENT=	Controls a 6DOF arm in cartesian space.

GNU_CONFIGURE=	yes

GENOM_MODULE=	xarm
include ../../architecture/genom/depend.mk
include ../../hardware/mouse3d-genom/depend.mk
include ../../image/viam-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../math/gbM/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../robots/qarm-genom/depend.mk

#include ../../image/viman-genom/depend.mk
#not yet packaged

include ../../mk/robotpkg.mk
