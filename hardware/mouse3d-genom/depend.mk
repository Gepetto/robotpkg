# robotpkg depend.mk for:	hardware/mouse3d-genom
# Created:			Xavier Broquere on Fri, 20 Mar 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MOUSE3DGENOM_DEPEND_MK:=${MOUSE3DGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mouse3d-genom
endif

ifeq (+,$(MOUSE3DGENOM_DEPEND_MK)) # ---------------------------------------

PREFER.mouse3d-genom?=	robotpkg

DEPEND_USE+=		mouse3d-genom

DEPEND_ABI.mouse3d-genom?=mouse3d-genom>=1.2
DEPEND_DIR.mouse3d-genom?=../../hardware/mouse3d-genom

SYSTEM_SEARCH.mouse3d-genom=\
	include/mouse3d/mouse3dStruct.h				\
	'lib/pkgconfig/mouse3d.pc:/Version/s/[^0-9.]//gp'

endif # MOUSE3DGENOM_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
