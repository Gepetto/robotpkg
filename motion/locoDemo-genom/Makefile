# robotpkg Makefile for:	motion/locoDemo-genom
# Created:			Matthieu Herrb on Tue, 2 Sep 2008
#

DISTNAME=	locoDemo-genom-1.4
CATEGORIES=	motion
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=locoDemo-genom/}
MASTER_REPOSITORY= git ssh://trac.laas.fr/git/robots/locoDemo-genom

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://softs.laas.fr/openrobots/
COMMENT=	Demo/simulation locomotion module - Genom component

GNU_CONFIGURE=	yes

GENOM_MODULE=	locoDemo

include ../../architecture/genom/depend.mk

include ../../motion/contlaw/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../interfaces/genPos-genom/depend.mk
include ../../mk/robotpkg.mk
