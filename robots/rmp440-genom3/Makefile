# robotpkg Makefile for:	robots/rmp440-genom3
# Created:			Matthieu Herrb on Thu, 23 Mar 2017
#

PKGREVISION=		1
DISTNAME=		rmp440-genom3-0.1
CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=rmp440/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}segway-robots/rmp440-genom3

MAINTAINER=		openrobots@laas.fr
COMMENT=		GenoM interface module for the Segway RMP440
LICENSE=		isc

include ../../architecture/genom3/module.mk

include ../../interfaces/openrobots-idl/depend.mk
include ../../hardware/gyro-libs/depend.mk
include ../../robots/rmp440-libs/depend.mk
include ../../robots/mana-emergency/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
