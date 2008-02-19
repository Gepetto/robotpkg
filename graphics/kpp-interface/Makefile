# $Id: Makefile 2008/02/19 13:36:46 mallet $

DISTNAME=	kppinterface-${VERSION}
PKGNAME=	kpp-interface-${VERSION}
VERSION=	1.2

CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Graphical user interface for HPP libraries.

DEPENDS+=	hpp-corbaserver>=1.2:../../devel/hpp-corbaserver
DEPENDS+=	hpp-kwsplus>=1.2:../../devel/hpp-kwsplus
DEPENDS+=	kineo-pp>=2.04.306:../../path/kineo-pp

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_PKG_CONFIG=	yes

include ../../mk/robotpkg.mk
