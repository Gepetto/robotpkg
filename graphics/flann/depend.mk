# robotpkg depend.mk for:	math/flann
# Created:			Nizar Sallem on Wed, 20 Jul 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FLANN_DEPEND_MK:=	${FLANN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		flann
endif

ifeq (+,$(FLANN_DEPEND_MK)) # -------------------------------------------

PREFER.flann?=		robotpkg

DEPEND_USE+=		flann
DEPEND_ABI.flann?=	flann>=1.7
DEPEND_DIR.flann?=	../../graphics/flann

SYSTEM_SEARCH.flann=\
	'include/flann/config.h:/FLANN_VERSION/s/[^0-9.]//gp'	\
	include/flann/flann.h					\
	include/flann/flann.hpp					\
	lib/libflann.so						\
	lib/libflann_cpp.so					\
	lib/libflann_cpp-gd.so					\
	'lib/pkgconfig/flann.pc:/Version/s/[^0-9.]//gp'

endif # FLANN_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
