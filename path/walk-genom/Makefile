# robotpkg Makefile for:	path/walk-genom
# Created:			Anthony Mallet on Wed, 14 May 2008
#

DISTNAME=	walk-genom-1.6

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=walk-genom/}
MASTER_REPOSITORY=git ssh://softs.laas.fr/git/robots/walk-genom

MAINTAINER=	openrobots@laas.fr
COMMENT=	Walk trajectories for humanoid robots - GenoM component
LICENSE=	2-clause-bsd

USE_LANGUAGES+= c c++
GNU_CONFIGURE=	yes

GENOM_MODULE=	walk
define PKG_OPTION_UNSET.api
  include ../../path/hpp-walkplanner/depend.mk
  include ../../middleware/omniORB/depend.mk
  include ../../devel/hpp-corbaserver/depend.mk
  include ../../robots/hrp2-14/depend.mk
  include ../../net/netshring/depend.mk
  post-install: install-license
endef

include ../../robots/hrp2-genom/depend.mk
include ../../architecture/genom/depend.mk
include ../../mk/robotpkg.mk

# generate and install the Kineo license, but don't fail on errors.
install-license:
	cd ${WRKSRC} && ${SETENV} ${INSTALL_ENV} ${MAKE_ENV} 		\
		${MAKE_PROGRAM} ${MAKE_FLAGS} ${INSTALL_MAKE_FLAGS}	\
			license install-license || ${TRUE}
