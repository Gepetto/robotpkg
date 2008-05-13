# $Id: Makefile 2008/04/24 16:12:30 mallet $

DISTNAME=	kppinterface-${VERSION}
PKGNAME=	kpp-interface-${VERSION}
VERSION=	1.3

CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Graphical user interface for HPP libraries.

DEPENDS+=	hpp-corbaserver>=1.2:../../devel/hpp-corbaserver
DEPENDS+=	kineo-pp>=2.04.306:../../path/kineo-pp

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_PKG_CONFIG=	yes

include ../../devel/hpp-kwsplus/depend.mk
include ../../mk/robotpkg.mk
