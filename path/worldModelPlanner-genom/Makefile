# robotpkg Makefile for:	path/worldModelPlanner-genom
# Created:			Anthony Mallet on Thu, 9 Apr 2009
#

DISTNAME=	worldModelPlanner-genom-1.0
CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=worldModelPlanner-genom/}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	ftp://softs.laas.fr/pub/openrobots/worldModelPlanner-genom/
COMMENT=	Path planning for environments with moving obstacles - GenoM

GNU_CONFIGURE=	yes
GENOM_MODULE=	worldModelPlanner
USE_LANGUAGES=	c++

REQD_BUILD_OPTIONS.hpp-worldmodelplanner+= $(filter openprs,${PKG_OPTIONS})

include ../../path/hpp-openhrp/depend.mk
include ../../path/hpp-worldmodelplanner/depend.mk
include ../../mapping/worldmodelgrid3dg-genom/depend.mk
include ../../devel/hpp-corbaserver/depend.mk
include ../../architecture/netshring/depend.mk
include ../../architecture/genom/depend.mk
include ../../mk/robotpkg.mk
