# robotpkg Makefile for:	path/hpp-worldmodelplanner
# Created:			Anthony Mallet on Thu, 9 Apr 2009
#

PKGVERSION=	1.0
DISTNAME=	hppworldmodelplanner-${PKGVERSION_NOREV}
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
