# robotpkg Makefile for:	graphics/simple-humanoid-description
# Created:			Rohan Budhiraja on Wed Oct 19, 2016
#

VERSION=		1.0.2
DISTNAME=		simple_humanoid_description-${VERSION}
PKGNAME=		$(subst _,-,${DISTNAME})

CATEGORIES=		graphics
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=simple-humanoid-description/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}laas/simple_humanoid_description/

COMMENT=		Rigid body model of a simple humanoid robot.
LICENSE=		gnu-lgpl-v3
MAINTAINER=		hpp@laas.fr

DYNAMIC_PLIST_DIRS+=	share/doc/simple_humanoid_description

CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
