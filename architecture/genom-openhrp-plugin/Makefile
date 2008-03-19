# $Id:$
#

DISTNAME=		genom-openhrp-plugin-1.1
CATEGORIES=		architecture
MASTER_SITES=		${MASTER_SITE_JRL}

MAINTAINER=		gepetto@laas.fr
#HOMEPAGE=
COMMENT=		Interface plugin between GenoM and OpenHRP

GNU_CONFIGURE=		yes
USE_PKG_CONFIG=		yes

CONFIGURE_ARGS+=	--with-idl=omniorb
CONFIGURE_ARGS+=	--with-openhrp=${PREFIX.openhrp-jrl}/OpenHRP

include ../../architecture/openhrp-jrl/depend.mk
include ../../devel/omniORB/depend.mk
include ../../mk/robotpkg.mk
