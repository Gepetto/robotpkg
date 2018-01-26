# robotpkg Makefile for:	simulation/mrsim-genom3
# Created:			Anthony Mallet on Fri, 14 Apr 2017
#

DISTNAME=		mrsim-genom3-1.2
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}telekyb3/${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Simulator for tk3-mikrokopter based quadrotors
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

define PKG_OPTION_SET.codels
  include ../../math/eigen3/depend.mk
endef

include ../../interfaces/openrobots-idl/depend.mk
include ../../math/eigen3/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
