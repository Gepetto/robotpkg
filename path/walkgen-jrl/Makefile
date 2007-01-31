# $NetBSD$
#

DISTNAME=		walkgenjrl-2.0
CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://softs.laas.fr/jrl/spip/-Walk-Pattern-Generator-.html
COMMENT=		Walk pattern generator for the HRP-2 humanoid robot.

GNU_CONFIGURE=		yes
USE_PKG_CONFIG=		yes
CONFIGURE_ARGS+=	--with-boost=${PREFIX}
CONFIGURE_ARGS+=	--with-boost-sandbox=${PREFIX}

DEPENDS+=		boost-numeric-bindings>=20070129:../../devel/boost-numeric-bindings
DEPENDS+=		boost>=1.33.1:../../devel/boost
DEPENDS+=		lapack>=3.1.0:../../math/lapack

include ../../mk/robotpkg.mk
