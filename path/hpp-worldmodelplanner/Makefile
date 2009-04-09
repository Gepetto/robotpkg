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
DISTNAME=	hppworldmodelplanner-${PKGVERSION}
PKGNAME=	hpp-worldmodelplanner-${PKGVERSION}
CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hppWorldModelPlanner/}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	ftp://softs.laas.fr/pub/openrobots/worldModelPlanner/
COMMENT=	Path planner in probabilistic, 3D occupancy grid

GNU_CONFIGURE=	yes
USE_LANGUAGES=	c++

DOXYGEN_PLIST_DIR+=	share/doc/hppWorldModelPlanner

include ../../path/hpp-dynamic-obstacle/depend.mk
include ../../path/hpp-walkplanner/depend.mk
include ../../path/kineo-pp/depend.mk
include ../../mapping/worldmodelgrid3d/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
