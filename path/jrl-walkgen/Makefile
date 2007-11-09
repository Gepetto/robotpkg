# $NetBSD$
#

DISTNAME=	walkgenjrl-${VERSION}
PKGNAME=	jrl-walkgen-${VERSION}
VERSION=	2.4

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_JRL}

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://softs.laas.fr/jrl/spip/-Walk-Pattern-Generator-.html
COMMENT=	Walk pattern generator for the HRP-2 humanoid robot.

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

DEPENDS+=	jrl-dynamics>=1.6:../../math/jrl-dynamics

include ../../mk/robotpkg.mk
