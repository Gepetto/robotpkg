# $Id$
#

DISTNAME=	walk-genom-1.0

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	Walk trajectories for humanoid robots - GenoM component

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_PKG_CONFIG=	yes

DEPENDS+=	netshring>=1.0:../../architecture/netshring
DEPENDS+=	hpp-corbaserver>=1.3:../../devel/hpp-corbaserver

CONFIGURE_ARGS+=--with-openhrp=${PREFIX.openhrp-jrl}/OpenHRP

GENOM_MODULE=	walk
include ../../architecture/genom/depend.mk

include ../../path/hpp-walkplanner/depend.mk
include ../../architecture/genom-openhrp-plugin/depend.mk
include ../../devel/omniORB/depend.mk
include ../../mk/robotpkg.mk
