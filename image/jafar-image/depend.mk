# robotpkg depend.mk for:	image/jafar-image
# Created:			Cyril Roussillon on Wed, 15 Jun 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JAFAR_IMAGE_DEPEND_MK:=	${JAFAR_IMAGE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jafar-image
endif

ifeq (+,$(JAFAR_IMAGE_DEPEND_MK)) # ----------------------------------------

PREFER.jafar-image?=	robotpkg

DEPEND_USE+=		jafar-image
DEPEND_ABI.jafar-image?=jafar-image>=2.1
DEPEND_DIR.jafar-image?=../../image/jafar-image

SYSTEM_SEARCH.jafar-image=\
	include/jafar/image/imageException.hpp	\
	lib/libjafar-image.so			\
	'lib/pkgconfig/jafar-image.pc:/Version/s/[^0-9.]//gp'

endif # JAFAR_IMAGE_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
