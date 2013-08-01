# robotpkg Makefile for:	graphics/rcpdf-interface
# Created:			Florent Lamiraux on Tue,  30 Jul 2013
#

VERSION=	0.2
DISTNAME=	rcpdf_interface-${VERSION}
PKGNAME=	rcpdf-interface-${VERSION}

MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=rcpdf_interface/}

CATEGORIES=	graphics
MAINTAINER=	hpp@laas.fr
HOMEPAGE=	https://github.com/laas/robot_contact_point
COMMENT=	Robot Contact Point Description Format interfaces
LICENSE=	2-clause-bsd

DYNAMIC_PLIST_DIRS+=	share/doc/rcpdf_interface

include ../../middleware/ros-comm/depend.mk
include ../../graphics/ros-robot-model/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
