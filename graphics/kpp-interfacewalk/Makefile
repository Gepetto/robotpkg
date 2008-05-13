# $NetBSD$
#

DISTNAME=	kppinterfacewalk-${VERSION}
PKGNAME=	kpp-interfacewalk-${VERSION}
VERSION=	1.3

CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Graphical user interface for hppWalkPlanner libraries.

DEPENDS+=	hpp-openhrp>=1.1:../../path/hpp-openhrp
DEPENDS+=	hpp-walkplanner>=1.2:../../path/hpp-walkplanner
DEPENDS+=	kpp-interface>=1.2:../../graphics/kpp-interface

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_PKG_CONFIG=	yes

include ../../mk/robotpkg.mk
