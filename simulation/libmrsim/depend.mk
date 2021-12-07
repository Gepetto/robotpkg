# robotpkg depend.mk for:	simulation/libmrsim
# Created:			Anthony Mallet on Tue, 11 Jun 2019
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBMRSIM_DEPEND_MK:=	${LIBMRSIM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libmrsim
endif

ifeq (+,$(LIBMRSIM_DEPEND_MK)) # -------------------------------------------

PREFER.libmrsim?=	robotpkg

SYSTEM_SEARCH.libmrsim=\
  'include/libmrsim.h'					\
  'lib/libmrsim.so'					\
  'lib/pkgconfig/libmrsim.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=		libmrsim

DEPEND_ABI.libmrsim?=	libmrsim>=1.3
DEPEND_DIR.libmrsim?=	../../simulation/libmrsim

endif # LIBMRSIM_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
