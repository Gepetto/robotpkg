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
DEPENDS+=		omniORB>=4.1.0r1:../../devel/omniORB

include ../../mk/robotpkg.mk
