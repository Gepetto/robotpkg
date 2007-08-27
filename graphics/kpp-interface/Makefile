# $NetBSD$
#

DISTNAME=	kppinterface-${VERSION}
PKGNAME=	kpp-interface-${VERSION}
VERSION=	1.0

CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Graphical user interface for HPP libraries.

DEPENDS+=	hpp-corbaserver>=1.0:../../devel/hpp-corbaserver
DEPENDS+=	kineo-pp>=2.04.301:../../path/kineo-pp

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

include ../../mk/robotpkg.mk
