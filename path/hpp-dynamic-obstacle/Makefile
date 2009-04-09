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
#                                             Anthony Mallet on Thu Apr  9 2009
#

PKGVERSION=	1.0
DISTNAME=	hppdynamicobstacle-${PKGVERSION}
PKGNAME=	hpp-dynamic-obstacle-${PKGVERSION}
CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-dynamic-obstacle/}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	ftp://softs.laas.fr/pub/openrobots/hpp-dynamic-obstacle/
COMMENT=	Path planning for environments with moving obstacles

GNU_CONFIGURE=	yes
USE_LANGUAGES=	c++

DOXYGEN_PLIST_DIR+=	share/doc/hppDynamicObstacle

include ../../devel/hpp-kwsplus/depend.mk
include ../../path/hpp-core/depend.mk
include ../../path/kineo-pp/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
