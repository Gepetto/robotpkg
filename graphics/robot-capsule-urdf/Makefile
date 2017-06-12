# robotpkg Makefile for:	graphics/robot_capsule_urdf
# Created:			Olivier Stasse on Fri, 19 Jun 2015
#
PKGREVISION=		2
VERSION=		1.0.1
DISTNAME=		robot-capsule-urdf-${VERSION}
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=robot-capsule-urdf/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}laas/robot_capsule_urdf

CATEGORIES=		graphics
COMMENT=		Provides capsule description of the robots
LICENSE=		2-clause-bsd
MAINTAINER=		hpp@laas.fr

DYNAMIC_PLIST_DIRS+=	share/doc/robot_capsule_urdf

SUBST_CLASSES+=         py-interp
SUBST_FILES.py-interp+= bin/robot_capsule_urdf

include ../../graphics/urdfdom/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
