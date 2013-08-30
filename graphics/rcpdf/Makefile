# robotpkg Makefile for:	graphics/rcpdf
# Created:			Florent Lamiraux on Tue,  30 Jul 2013
#

PKGREVISION=	2
VERSION=	0.2
DISTNAME=	rcpdf-${VERSION}

MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=rcpdf/}

CATEGORIES=	graphics
MAINTAINER=	hpp@laas.fr
HOMEPAGE=	https://github.com/laas/robot_contact_point
COMMENT=	Robot Contact Point Description Format interfaces
LICENSE=	2-clause-bsd

DYNAMIC_PLIST_DIRS+=	share/doc/rcpdf

CMAKE_ARGS+=	-DTINYXML_ROOT=${PREFIX.tinyxml}

include ../../graphics/rcpdf-interface/depend.mk
include ../../graphics/ros-robot-model/depend.mk
include ../../graphics/urdfdom-headers/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/tinyxml.mk
include ../../mk/robotpkg.mk
