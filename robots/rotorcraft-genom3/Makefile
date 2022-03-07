# robotpkg Makefile for:	robots/mikrokopter-genom3
# Created:			Anthony Mallet on Tue, 10 Nov 2015
#

DISTNAME=		rotorcraft-genom3-3.3
CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}telekyb3/${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Low level controller for tk3 quadrotors
LICENSE=		2-clause-bsd
CONFLICTS+=		mikrokopter-genom3-[0-9]*

include ../../architecture/genom3/module.mk

include ../../mk/robotpkg.prefs.mk
ifeq (${OS_KERNEL},Linux)
  include ../../mk/sysdep/libudev.mk
endif

define PKG_OPTION_SET.codels
  include ../../math/eigen3/depend.mk
endef
include ../../interfaces/openrobots2-idl/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
