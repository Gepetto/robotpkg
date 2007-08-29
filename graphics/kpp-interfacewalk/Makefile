# $NetBSD$
#

DISTNAME=	kppinterfacewalk-${VERSION}
PKGNAME=	kpp-interfacewalk-${VERSION}
VERSION=	1.0

CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Graphical user interface for hppWalkPlanner libraries.

DEPENDS+=	hpp-openhrp>=1.0:../../path/hpp-openhrp
DEPENDS+=	hpp-corbaserver>=1.0:../../devel/hpp-corbaserver
DEPENDS+=	hpp-walkplanner>=1.0:../../path/hpp-walkplanner
DEPENDS+=	kpp-interface>=1.0:../../graphics/kpp-interface

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

include ../../mk/robotpkg.mk
