# $NetBSD$
#

DISTNAME=	hppgik-${VERSION}
PKGNAME=	hpp-gik-${VERSION}
VERSION=	1.1.1

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_ROBOTPKG}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Generalized Inverse Kinematics for humanoid robots.

DEPENDS+=	jrl-interface-giktask>=1.0:../../interfaces/jrl-interface-giktask
DEPENDS+=	jrl-dynamics>=1.3.1:../../math/jrl-dynamics

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

BUILD_TARGET=	all doc
INSTALL_TARGET=	install install-doc

include ../../mk/robotpkg.mk
