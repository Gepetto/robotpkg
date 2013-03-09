# robotpkg Makefile for:	robots/mor-genom
# Created:			Matthieu Herrb on Wed, 31 Dec 2008
#

PKGREVISION=	1
DISTNAME=	mor-genom-0.1
CATEGORIES=	robots
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=neobotix/}
MASTER_REPOSITORY=	git	ssh://trac.laas.fr/git/robots/mor-genom

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://softs.laas.fr/openrobots/
COMMENT=	Neobotix/MOR/LAAS locomotion module - Genom component
LICENSE=	isc

GNU_CONFIGURE=	yes

GENOM_MODULE=	mor

ifeq (,$(filter api,${PKG_OPTIONS}))
  include ../../robots/mor-libs/depend.mk
  include ../../motion/contlaw/depend.mk
endif

include ../../localization/pom-genom/depend.mk
include ../../devel/mkdep/depend.mk
include ../../architecture/genom/depend.mk
include ../../interfaces/genPos-genom/depend.mk
include ../../interfaces/genBasic-genom/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
