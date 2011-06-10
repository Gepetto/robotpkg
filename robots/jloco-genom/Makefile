# robotpkg Makefile for:	robots/jloco-genom
# Created:			Matthieu Herrb on Wed, 31 Dec 2008
#

DISTNAME=	jloco-genom-1.1
PKGREVISION=	2
CATEGORIES=	robots
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=jloco/}
MASTER_REPOSITORY=	git	ssh://trac.laas.fr/git/robots/jloco-genom

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://softs.laas.fr/openrobots/
COMMENT=	Jido locomotion module - Genom component

GNU_CONFIGURE=	yes

GENOM_MODULE=	jloco

define PKG_OPTION_UNSET.api
include ../../robots/neobotix-libs/depend.mk
include ../../motion/contlaw/depend.mk
endef
include ../../localization/pom-genom/depend.mk
include ../../devel/mkdep/depend.mk
include ../../architecture/genom/depend.mk
include ../../interfaces/genPos-genom/depend.mk
include ../../mk/robotpkg.mk
