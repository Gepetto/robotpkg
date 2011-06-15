# robotpkg Makefile for:	image/jafar-correl
# Created:			Cyril Roussillon on Wed, 15 Jun 2011
#

JAFAR_PKG=		correl-0.1

CATEGORIES=		image
JAFAR_COMMENT=		image correlation functions

include ../../meta-pkgs/jafar/Makefile.common

CPPFLAGS += -DJFR_NDEBUG
CXXFLAGS += -pthread

include ../../devel/jafar-kernel/depend.mk
include ../../image/jafar-image/depend.mk
include ../../math/jafar-jmath/depend.mk
include ../../image/opencv/depend.mk
include ../../mk/robotpkg.mk
