# robotpkg Makefile for:	sysutils/arduio-genom3
# Created:			Anthony Mallet on Wed,  1 Mar 2017
#

DISTNAME=		arduio-genom3-1.3
CATEGORIES=		sysutils
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}arduio/${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Control an Arduino board running the arduio software
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

include ../../mk/robotpkg.prefs.mk
ifeq (${OS_KERNEL},Linux)
  include ../../mk/sysdep/libudev.mk
endif

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
