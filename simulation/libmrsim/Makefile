# robotpkg Makefile for:	simulation/libmrsim
# Created:			Anthony Mallet on Tue, 11 Jun 2019
#

DISTNAME=		libmrsim-1.2
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Simulator library for tk3-mikrokopter based quadrotors
LICENSE=		2-clause-bsd

GNU_CONFIGURE=		yes

include ../../math/eigen3/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
