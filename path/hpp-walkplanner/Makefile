# $Id: Makefile 2008/04/04 19:35:38 mallet $

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
DEPENDS+=	hpp-kwsplus>=1.3:../../devel/hpp-kwsplus

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_PKG_CONFIG=	yes

include ../../mk/robotpkg.mk
