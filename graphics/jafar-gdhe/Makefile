# robotpkg Makefile for:	graphics/jafar-gdhe
# Created:			Cyril Roussillon on Wed, 15 Jun 2011
#

JAFAR_PKG=		gdhe-0.1
PKGREVISION=		2

CATEGORIES=		graphics
JAFAR_COMMENT=		module to talk to a GDHE server

include ../../meta-pkgs/jafar/Makefile.common

CPPFLAGS += -DJFR_NDEBUG
CXXFLAGS += -pthread

include ../../devel/jafar-kernel/depend.mk
include ../../math/jafar-jmath/depend.mk
include ../../graphics/gdhe/depend.mk
include ../../math/boost-numeric-bindings/depend.mk
include ../../mk/language/fortran.mk
include ../../mk/robotpkg.mk
