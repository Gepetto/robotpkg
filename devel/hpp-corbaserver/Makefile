# $NetBSD$
#

DISTNAME=	hppcorbaserver-${VERSION}
PKGNAME=	hpp-corbaserver-${VERSION}
VERSION=	1.1

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Corba interface with hppCore package.

DEPENDS+=	hpp-core>=1.2:../../path/hpp-core
DEPENDS+=	hpp-openhrp>=1.0:../../path/hpp-openhrp
DEPENDS+=	jrl-modelloader>=1.1:../../devel/jrl-modelloader
DEPENDS+=	omniORB>=4.1.0:../../devel/omniORB

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

CONFIGURE_ARGS+=--with-openhrp # really should be an option

include ../../mk/robotpkg.mk
