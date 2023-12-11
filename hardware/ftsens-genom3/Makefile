# robotpkg Makefile for:	hardware/ftsens-genom3
# Created:			Anthony Mallet on Mon, 11 Dec 2023
#

DISTNAME=		ftsens-genom3-1.0
CATEGORIES=		hardware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		GenoM3 component reading IIT force sensor
HOMEPAGE=		https://git.openrobots.org/projects/ftsens-genom3
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

include ../../hardware/icub-libs/depend.mk
include ../../interfaces/openrobots2-idl/depend.mk
include ../../math/eigen3/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
