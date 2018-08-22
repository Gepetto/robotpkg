# robotpkg Makefile for:	robots/mor-libs
# Created:			Matthieu Herrb on Wed, 31 Aug 2011
#

DISTNAME=	mor-libs-0.3
CATEGORIES=	robots
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=neobotix/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}jido/mor-libs

LICENSE=	isc

MAINTAINER=	openrobots@laas.fr
COMMENT=	Interface library for the neobotix MOR platform

ONLY_FOR_PLATFORM=Linux-%
GNU_CONFIGURE=	yes

# C99 'for' loop initial declarations
DEPEND_ABI.gcc=	gcc>=5

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/robotpkg.mk
