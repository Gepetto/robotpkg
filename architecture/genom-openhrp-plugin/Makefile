# $NetBSD$
#

DISTNAME=		genom-openhrp-plugin-1.0
CATEGORIES=		architecture
MASTER_SITES=		${MASTER_SITE_JRL}

MAINTAINER=		gepetto@laas.fr
#HOMEPAGE=
COMMENT=		Interface plugin between GenoM and OpenHRP

GNU_CONFIGURE=		yes
USE_PKG_CONFIG=		yes

CONFIGURE_ARGS+=	--with-idl=omniorb
CONFIGURE_ARGS+=	--with-openhrp=${PREFIX}/OpenHRP

DEPENDS+=		openhrp-jrl>=20060713r6:../../architecture/openhrp-jrl

include ../../devel/omniORB/depend.mk
include ../../mk/robotpkg.mk
