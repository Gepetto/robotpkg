# $NetBSD$
#

DISTNAME=		pom-genom-0.4
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for localization management.

GNU_CONFIGURE=		yes
USE_PKG_CONFIG=		yes

DEPENDS+=		libt3d>=2.3:../../math/t3d
DEPENDS+=		insitu>=1.1:../../localization/insitu
DEPENDS+=		libpom>=1.1:../../localization/libpom

GENOM_MODULE=		pom
include ../../architecture/genom/depend.mk

include ../../mk/robotpkg.mk
