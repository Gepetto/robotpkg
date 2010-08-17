# robotpkg Makefile for:	motion/mwalk-genom
# Created:			Anthony Mallet on Wed, 28 Jul 2010
#
DISTNAME=		mwalk-genom-1.0

CATEGORIES=		motion
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=mwalk-genom/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/mwalk-genom

MAINTAINER=		mallet@laas.fr
COMMENT=		Walking pattern generator for HRP-2 - GenoM component
LICENSE=		2-clause-bsd

USE_LANGUAGES+=		c c++

GENOM_MODULE=		mwalk
CONFIGURE_ARGS+=	--with-openhrp=${PREFIX.OpenHRP}

define PKG_OPTION_UNSET.api
  include ../../architecture/openhrp/depend.mk
  include ../../robots/hrpsys-jrl/depend.mk
  include ../../motion/libmwalk/depend.mk
endef

include ../../robots/hrp2-genom/depend.mk
include ../../architecture/genom/depend.mk
include ../../mk/robotpkg.mk
