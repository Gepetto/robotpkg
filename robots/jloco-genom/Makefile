# robotpkg Makefile for:	robots/jloco-genom
# Created:			Matthieu Herrb on Wed, 31 Dec 2008
#

DISTNAME=	jloco-genom-1.2
CATEGORIES=	robots
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=jloco/}
MASTER_REPOSITORY=	git	ssh://trac.laas.fr/git/robots/jloco-genom

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://softs.laas.fr/openrobots/
COMMENT=	Jido locomotion module - Genom component

GNU_CONFIGURE=	yes

GENOM_MODULE=	jloco


PKG_SUPPORTED_OPTIONS+= fake
PKG_OPTION_DESCR.fake=	Build with simulated hardware interface
define PKG_OPTION_SET.fake
  GENOM_ARGS+= -DFAKE_NEOBOTIX -DFAKE_JOYSTICK
endef

define PKG_OPTION_UNSET.fake
  ifeq (,$(filter api,${PKG_OPTIONS}))
    include ../../robots/neobotix-libs/depend.mk
    include ../../motion/contlaw/depend.mk
  endif
endef

include ../../localization/pom-genom/depend.mk
include ../../devel/mkdep/depend.mk
include ../../architecture/genom/depend.mk
include ../../interfaces/genPos-genom/depend.mk
include ../../mk/robotpkg.mk
