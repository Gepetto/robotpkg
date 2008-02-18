# $NetBSD$
#

DISTNAME=	hppcorbaserver-${VERSION}
PKGNAME=	hpp-corbaserver-${VERSION}
VERSION=	1.2

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Corba interface with hppCore package.

DEPENDS+=	hpp-core>=1.3:../../path/hpp-core
DEPENDS+=	omniORB>=4.1.0:../../devel/omniORB

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_PKG_CONFIG=	yes

include options.mk
include ../../mk/robotpkg.mk
