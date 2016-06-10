# robotpkg Makefile for:	image/jafar-image
# Created:			Cyril Roussillon on Wed, 15 Jun 2011
#

JAFAR_PKG=	image-2.3

CATEGORIES=	image
JAFAR_COMMENT=	basic image processing based on OpenCV

CMAKE_ARGS+= -DPATH_TO_BOOST_SANDBOX=${PREFIX.boost-numeric-bindings}/include

include ../../meta-pkgs/jafar/Makefile.common

include ../../devel/jafar-kernel/depend.mk
include ../../math/jafar-jmath/depend.mk
include ../../image/opencv/depend.mk
include ../../math/boost-numeric-bindings/depend.mk
include ../../math/lapack/depend.mk
include ../../mk/language/c.mk

DEPEND_ABI.opencv += opencv<3

include ../../mk/robotpkg.mk
