# robotpkg Makefile for:	robots/dynamixel-genom3
# Created:			Anthony Mallet on Mon, 11 Jul 2016
#

DISTNAME=		dynamixel-genom3-2.0
CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		GenoM3 component controlling dynamixel motors
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

include ../../interfaces/openrobots-idl/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
