# robotpkg depend.mk for:	math/libccd
# Created:			Anthony Mallet on Tue, 28 Apr 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBCCD_DEPEND_MK:=	${LIBCCD_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libccd
endif

ifeq (+,$(LIBCCD_DEPEND_MK)) # ---------------------------------------------

PREFER.libccd?=		robotpkg

DEPEND_USE+=		libccd

DEPEND_ABI.libccd?=	libccd>=1.0
DEPEND_DIR.libccd?=	../../math/libccd

SYSTEM_SEARCH.libccd=\
  'include/ccd/ccd.h'				\
  'lib/libccd.so'				\
  'lib/pkgconfig/ccd.pc:/Version/s/[^0-9.]//gp'

endif # LIBCCD_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
