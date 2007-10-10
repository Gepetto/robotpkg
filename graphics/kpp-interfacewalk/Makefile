# $NetBSD$
#

DISTNAME=	kppinterfacewalk-${VERSION}
PKGNAME=	kpp-interfacewalk-${VERSION}
VERSION=	1.1

CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Graphical user interface for hppWalkPlanner libraries.

DEPENDS+=	hpp-openhrp>=1.0:../../path/hpp-openhrp
DEPENDS+=	hpp-walkplanner>=1.1:../../path/hpp-walkplanner
DEPENDS+=	kpp-interface>=1.1:../../graphics/kpp-interface

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

include ../../mk/robotpkg.mk
