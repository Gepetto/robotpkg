# robotpkg Makefile for:	robots/hrp2-genom
# Created:			Anthony Mallet on Wed, 19 Mar 2008
#

DISTNAME=	hrp2-genom-1.1

CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=hrp2-genom/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/hrp2-genom

MAINTAINER=	openrobots@laas.fr
COMMENT=	Basic HRP-2 hardware control - GenoM component

USE_LANGUAGES+=	c c++

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--with-openhrp=${PREFIX.OpenHRP}

GENOM_MODULE=	hrp2
include ../../architecture/genom/depend.mk

include ../../simulation/openhrp/depend.mk
include ../../robots/hrpsys-jrl/depend.mk
include ../../architecture/netshring/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../math/t3d/depend.mk
include ../../devel/omniORB/depend.mk
include ../../mk/robotpkg.mk
