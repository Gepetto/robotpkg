# robotpkg Makefile for:	manipulation/coldman-libs
# Created:			Anthony Mallet on Fri, 15 Oct 2010
#

PKGVERSION=		1.3
DISTNAME=		coldman-libs-${PKGVERSION}
CATEGORIES=		manipulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=coldman-libs/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/coldman-libs

MAINTAINER=		xavier.broquere@laas.fr

COMMENT=		COLision Detection for MANipulation
LICENSE=		gnu-lgpl-v3

USE_LANGUAGES+=		c c++

# option for display using glut
PKG_SUPPORTED_OPTIONS+=	display
PKG_SUGGESTED_OPTIONS+=	display

PKG_OPTION_DESCR.display=	Enable embedded display facility.
define PKG_OPTION_SET.display
  CMAKE_ARGS+=-DENABLE_DISPLAY=ON
  include ../../mk/sysdep/freeglut.mk
  include ../../mk/sysdep/libxmu.mk
endef
PKG_OPTION_UNSET.display:=	CMAKE_ARGS+=-DENABLE_DISPLAY=OFF

include ../../graphics/pqp/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
