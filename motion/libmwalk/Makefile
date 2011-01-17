# robotpkg Makefile for:	motion/libmwalk
# Created:			Anthony Mallet on Wed, 28 Jul 2010
#
DISTNAME=		libmwalk-1.1

CATEGORIES=		motion
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=libmwalk/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/mwalk

MAINTAINER=		mallet@laas.fr
COMMENT=		Walking pattern generator for HRP-2
LICENSE=		eclipse

USE_LANGUAGES+=		c c++

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-openhrp=${PREFIX.OpenHRP}

include ../../simulation/openhrp/depend.mk
include ../../robots/hrpsys-jrl/depend.mk
include ../../middleware/omniORB/depend.mk
include ../../mk/robotpkg.mk
