# $Id: Makefile 2008/04/24 16:13:10 mallet $

DISTNAME=	hppwalkplanner-${VERSION}
PKGNAME=	hpp-walkplanner-${VERSION}
VERSION=	1.3

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Path planning algorithm for a walking humanoid robot.

DEPENDS+=	hrp2_14>=1.0:../../robots/hrp2-14
DEPENDS+=	hpp-core>=1.3:../../path/hpp-core
DEPENDS+=	hpp-openhrp>=1.1:../../path/hpp-openhrp
DEPENDS+=	jrl-walkgen>=2.4:../../path/jrl-walkgen

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_PKG_CONFIG=	yes

include ../../devel/hpp-kwsplus/depend.mk
include ../../mk/robotpkg.mk
