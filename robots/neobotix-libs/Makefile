# robotpkg Makefile for:	robots/neobotix-libs
# Created:			Matthieu Herrb on Wed, 31 Dec 2008
#

DISTNAME=	neobotix-libs-2.1
PKGREVISION=	1
CATEGORIES=	robots
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=neobotix/}

LICENSE=	isc
MAINTAINER=	openrobots@laas.fr
COMMENT=	Interface library for the neobotix platform

# uses linux/can.h
ONLY_FOR_PLATFORM=      Linux-%

GNU_CONFIGURE=	yes

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
