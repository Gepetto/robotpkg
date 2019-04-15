# robotpkg Makefile for:	graphics/gerard-bauzil
# Created:			Olivier Stasse on Thu,  3 Nov 2016
#

VERSION=		1.0.1
DISTNAME=		gerard-bauzil-${VERSION}

CATEGORIES=		graphics
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=gerard-bauzil/}
MASTER_REPOSITORY=\
  git git://redmine.laas.fr/laas/users/ostasse/environnements/gerard-bauzil.git

MAINTAINER=		ostasse@laas.fr
COMMENT=		Data files for the LAAS Gerard Bauzil environment
LICENSE=		gnu-gpl-v3

CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib
DYNAMIC_PLIST_DIRS+=	share/doc/gerard-bauzil

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/latex.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
