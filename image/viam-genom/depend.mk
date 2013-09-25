# robotpkg depend.mk for:	image/viam-genom
# Created:			Arnaud Degroote on Mon, 28 Apr 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
VIAMGENOM_DEPEND_MK:=	${VIAMGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		viam-genom
endif

ifeq (+,$(VIAMGENOM_DEPEND_MK)) # ------------------------------------------

PREFER.viam-genom?=	robotpkg

DEPEND_USE+=		viam-genom

DEPEND_ABI.viam-genom?=	viam-genom>=1.6
DEPEND_DIR.viam-genom?=	../../image/viam-genom

SYSTEM_SEARCH.viam-genom=\
 'include/viam/viamStruct.h'			\
 'lib/pkgconfig/viam.pc:/Version/s/[^0-9]//gp'

include ../../architecture/genom/depend.mk
include ../../image/viam-libs/depend.mk
include ../../localization/pom-genom/depend.mk

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
