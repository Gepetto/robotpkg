# robotpkg Makefile for:	robots/rmp440-libs
# Created:			Matthieu Herrb on Thu, 16 May 2013
#

CATEGORIES=		robots
DISTNAME=		rmp440-libs-0.4
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=rmp440/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}segway-robots/rmp440-libs

COMMENT=		Interface library for the Segway RMP440 platform
MAINTAINER=		openrobots@laas.fr
LICENSE=		isc

GNU_CONFIGURE=		yes
ONLY_FOR_PLATFORM=	Linux-%

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
