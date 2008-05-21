# $Id: Makefile 2008/04/24 16:13:10 mallet $

DISTNAME=	hppwalkplanner-${VERSION}
PKGNAME=	hpp-walkplanner-${VERSION}
VERSION=	1.3.1

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Path planning algorithm for a walking humanoid robot.

DEPENDS+=	hpp-core>=1.3:../../path/hpp-core
DEPENDS+=	hpp-openhrp>=1.1:../../path/hpp-openhrp

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

#Options
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

include ../../robots/hrp2-14/depend.mk
include ../../devel/hpp-kwsplus/depend.mk
include ../../path/jrl-walkgen/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk
