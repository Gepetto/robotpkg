# robotpkg Makefile for:	devel/hpp-model
# Created:			Anthony Mallet on Mon, 18 Feb 2008
#

DISTNAME=	hpp-model-${VERSION}
PKGNAME=	hpp-model-${VERSION}
VERSION=	2.1

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-model/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}/algo/hpp-model

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Robots, humanoid robots, joints and bodies with dynamics properties
LICENSE=	cnrs-hpp-closed-source

USE_LANGUAGES+=	c c++

DOXYGEN_PLIST_DIR+=	share/doc/hpp-model

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../path/kineo-pp/depend.mk
include ../../devel/hpp-kwsio/depend.mk
include ../../math/jrl-dynamics/depend.mk
include ../../devel/hpp-util/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
