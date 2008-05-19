# $Id $

DISTNAME=		hardlib-${VERSION}
PKGNAME=		gyroKVH1000-${VERSION}
VERSION=		1.0.1
CATEGORIES=		robot
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Driver and interface for gyroKVH1000

GNU_CONFIGURE=		yes
USE_PKG_CONFIG=		yes

WRKSRC=			${WRKDIR}/hardlib-${VERSION}/gyro/gyroKVH1000/

DEPENDS+=		mkdep>=2.6:../../devel/mkdep

include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk
