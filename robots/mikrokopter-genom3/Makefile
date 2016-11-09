# robotpkg Makefile for:	robots/mikrokopter-genom3
# Created:			Anthony Mallet on Tue, 10 Nov 2015
#

DISTNAME=		mikrokopter-genom3-1.5
CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}telekyb3/${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Low level controller for tk3-mikrokopter quadrotors
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

include ../../interfaces/openrobots-idl/depend.mk
include ../../math/eigen3/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
