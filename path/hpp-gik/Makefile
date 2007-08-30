# $NetBSD$
#

DISTNAME=	hppgik-${VERSION}
PKGNAME=	hpp-gik-${VERSION}
VERSION=	1.3

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Generalized Inverse Kinematics for humanoid robots.

DEPENDS+=	jrl-interface-giktask>=1.1:../../interfaces/jrl-interface-giktask
DEPENDS+=	jrl-dynamics>=1.5:../../math/jrl-dynamics

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

include ../../mk/robotpkg.mk
