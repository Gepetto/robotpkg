# robotpkg Makefile for:	robots/mor-libs
# Created:			Matthieu Herrb on Wed, 31 Aug 2011
#

DISTNAME=	mor-libs-0.1
CATEGORIES=	robots
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=neobotix/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/mor-genom

LICENSE=	isc

MAINTAINER=	openrobots@laas.fr
COMMENT=	interface library for the neobotix MOR platform

GNU_CONFIGURE=	yes

include ../../hardware/peak-linux-driver/depend.mk
include ../../middleware/pocolibs/depend.mk
include ../../devel/mkdep/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
