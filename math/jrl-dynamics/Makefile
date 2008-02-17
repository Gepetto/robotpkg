# $Id: Makefile 60e6ccb8b4f3f2e5a135861c3d9f6865 2008/02/17 23:22:00 tho $

DISTNAME=	dynamicsjrljapan-${VERSION}
PKGNAME=	jrl-dynamics-${VERSION}
VERSION=	1.7

CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_JRL}
NO_PUBLIC_SRC=	yes

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	JRL-Japan implementation of dynamic robot.

DEPENDS+=	jrl-interface-dynamics>=1.8:../../interfaces/jrl-interface-dynamics
DEPENDS+=	jrl-mal>=1.4:../../interfaces/jrl-mal

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes
USE_LIBTOOL=	yes

include ../../mk/robotpkg.mk
