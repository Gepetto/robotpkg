# $Id: Makefile 2008/02/18 14:41:29 mallet $

DISTNAME=	hppmodel-${VERSION}
PKGNAME=	hpp-model-${VERSION}
VERSION=	1.0

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	Robots, humanoid robots, joints and bodies with dynamics properties.

DEPENDS+=	jrl-interface-dynamics>=1.8:../../interfaces/jrl-interface-dynamics
DEPENDS+=	kineo-pp>=2.04.306:../../path/kineo-pp
DEPENDS+=	hpp-kwsio>=1.0.1:../../devel/hpp-kwsio

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes
USE_LIBTOOL=	yes

include options.mk
include ../../mk/robotpkg.mk
