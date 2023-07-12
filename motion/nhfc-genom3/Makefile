# robotpkg Makefile for:	motion/nhfc-genom3
# Created:			Anthony Mallet on Tue, 10 Nov 2015
#

DISTNAME=		nhfc-genom3-2.3
CATEGORIES=		motion
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}telekyb3/${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Near-hovering flight controller for rotorcrafts
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

include ../../interfaces/openrobots2-idl/depend.mk
include ../../math/eigen3/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
