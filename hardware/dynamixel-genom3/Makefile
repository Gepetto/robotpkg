# robotpkg Makefile for:	robots/dynamixel-genom3
# Created:			Anthony Mallet on Mon, 11 Jul 2016
#

DISTNAME=		dynamixel-genom3-2.3
CATEGORIES=		hardware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		GenoM3 component controlling dynamixel motors
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

DEPEND_ABI.openrobots2-idl=	openrobots2-idl>=2.2

include ../../interfaces/openrobots2-idl/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
