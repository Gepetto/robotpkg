# robotpkg Makefile for:	hardware/joystick-genom3
# Created:			Anthony Mallet on Fri, 15 Apr 2016
#

DISTNAME=		joystick-genom3-1.0
CATEGORIES=		hardware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Export joystick readings
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

include ../../interfaces/openrobots-idl/depend.mk
include ../../mk/sysdep/SDL2.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
