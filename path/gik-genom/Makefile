# $Id$
#

DISTNAME=	gik-genom-1.0

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	Generalized Inverse Kinematics for humanoid robots - GenoM component

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_PKG_CONFIG=	yes

DEPENDS+=	netshring>=1.0:../../architecture/netshring
DEPENDS+=	hrp2-dynamics>=1.0:../../math/hrp2-dynamics

GENOM_MODULE=	gik
include ../../architecture/genom/depend.mk

include ../../path/hpp-gik/depend.mk
include ../../robots/hrp2-14/depend.mk
include ../../architecture/genom-openhrp-plugin/depend.mk
include ../../mk/robotpkg.mk
