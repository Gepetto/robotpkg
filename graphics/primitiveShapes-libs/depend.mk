# robotpkg depend.mk for:	graphics/primitiveShapes
# Created:			Matthieu Herrb on Fri, 27 Aug 2010
#


DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PRIMITIVE_SHAPES_LIBS_DEPEND_MK:=${PRIMITIVE_SHAPES_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		primitiveShapes-libs
endif

ifeq (+,$(PRIMITIVE_SHAPES_LIBS_DEPEND_MK))
PREFER.primitiveShapes-libs?=	robotpkg

DEPEND_USE+=		primitiveShapes-libs

DEPEND_ABI.primitiveShapes-libs?=	primitiveShapes-libs>=1.1
DEPEND_DIR.primitiveShapes-libs?=	../../graphics/primitiveShapes-libs

SYSTEM_SEARCH.primitiveShapes-libs=\
	include/primitiveShapes/PrimitiveShape.h \
	lib/pkgconfig/primitiveShapes-libs.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
