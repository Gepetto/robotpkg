# $NetBSD$
#

DISTNAME=		GPSNovatel-genom-${VERSION}
PKGNAME=		GPS-genom-${VERSION}
VERSION=		0.1
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for GPS management

GNU_CONFIGURE=		yes
USE_PKG_CONFIG=		yes

GENOM_MODULE=		GPS
include ../../architecture/genom/depend.mk

include ../../architecture/genBasic-genom/depend.mk
include ../../localization/gyro-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../robots/GPSNovatel/depend.mk
include ../../mk/robotpkg.mk
