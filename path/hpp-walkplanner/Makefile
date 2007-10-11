# $Id: Makefile 2007/08/27 18:34:06 mallet $
#

DISTNAME=	hppwalkplanner-${VERSION}
PKGNAME=	hpp-walkplanner-${VERSION}
VERSION=	1.1

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Path planning algorithm for a walking humanoid robot.

DEPENDS+=	hrp2_14>=1.0:../../robots/hrp2-14
DEPENDS+=	hpp-core>=1.2:../../path/hpp-core
DEPENDS+=	hpp-openhrp>=1.0:../../path/hpp-openhrp
DEPENDS+=	jrl-walkgen>=2.3:../../path/jrl-walkgen

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

include ../../mk/robotpkg.mk
