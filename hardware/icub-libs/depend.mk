# robotpkg depend.mk for:	hardware/icub-libs
# Created:			Anthony Mallet on Mon, 11 Dec 2023
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ICUB_LIBS_DEPEND_MK:=	${ICUB_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		icub-libs
endif

ifeq (+,$(ICUB_LIBS_DEPEND_MK)) # ------------------------------------------
PREFER.ICUB_LIBS?=	robotpkg

DEPEND_USE+=		icub-libs

DEPEND_ABI.icub-libs?=	icub-libs>=0.1
DEPEND_DIR.icub-libs?=	../../hardware/icub-libs

SYSTEM_SEARCH.icub-libs=\
  'include/icub/icub.h' \
  'lib/pkgconfig/icub-libs.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
