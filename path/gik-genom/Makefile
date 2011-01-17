# robotpkg Makefile for:	path/gik-genom
# Created:			Anthony Mallet on Wed, 14 May 2008
#

DISTNAME=	gik-genom-1.6

CATEGORIES=	path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=gik-genom/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/gik-genom

MAINTAINER=	openrobots@laas.fr
COMMENT=	Generalized Inverse Kinematics for humanoid robots - GenoM component
LICENSE=	2-clause-bsd

USE_LANGUAGES+=	c c++

GENOM_MODULE=	gik
define PKG_OPTION_UNSET.api
  include ../../math/hrp2-dynamics/depend.mk
  include ../../path/hpp-gik/depend.mk
  include ../../robots/hrp2-14/depend.mk
  include ../../net/netshring/depend.mk
endef

include ../../architecture/genom/depend.mk
include ../../robots/hrp2-genom/depend.mk
include ../../mk/robotpkg.mk
