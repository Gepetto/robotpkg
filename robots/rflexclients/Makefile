# $Id $

DISTNAME=		hardlib-${VERSION}
PKGNAME=		rflexclients-${VERSION}
VERSION=		1.0.1
CATEGORIES=		robot
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Driver and interface for Rflex

GNU_CONFIGURE=		yes
USE_PKG_CONFIG=		yes
USE_LIBTOOL=		yes

WRKSRC=			${WRKDIR}/hardlib-${VERSION}/rflex-clients

DEPENDS+=		mkdep>=2.6:../../devel/mkdep


include ../../mk/robotpkg.mk
