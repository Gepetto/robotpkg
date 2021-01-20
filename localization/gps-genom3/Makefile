# robotpkg Makefile for:	localization/gps-genom3
# Created:			Anthony Mallet on Tue, 28 May 2019
#

DISTNAME=		gps-genom3-1.5.1
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}/${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		GPS driver component
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

include ../../mk/robotpkg.prefs.mk
ifeq (${OS_KERNEL},Linux)
  include ../../mk/sysdep/libudev.mk
endif

DEPEND_ABI.ros-genpy += ros-genpy>=0.6.3

include ../../interfaces/openrobots2-idl/depend.mk
include ../../math/eigen3/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
