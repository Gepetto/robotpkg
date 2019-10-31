# robotpkg Makefile for:	simulation/mrsim-genom3
# Created:			Anthony Mallet on Fri, 14 Apr 2017
#

DISTNAME=		mrsim-genom3-2.1.1
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}telekyb3/${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Simulator for tk3-mikrokopter based quadrotors
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

define PKG_OPTION_SET.codels
  include ../../simulation/libmrsim/depend.mk
endef

include ../../interfaces/openrobots2-idl/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
