# robotpkg Makefile for:	robots/play-genom
# Created:			Matthieu Herrb on Fri, 20 Nov 2009
#
DISTNAME=		play-genom-0.1
CATEGORIES=		robots

MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=play/}
MASTER_REPOSITORY=	git trac.laas.fr:/git/robots/play-genom

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://softs.laas.fr/openrobots/
COMMENT=		Genom module to control a Pioneer P2DX using player

GNU_CONFIGURE=		yes

GENOM_MODULE=		play

include ../player20-libs/depend.mk
include ../../architecture/genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/robotpkg.mk
