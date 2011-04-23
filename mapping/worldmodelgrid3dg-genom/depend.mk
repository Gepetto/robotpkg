# robotpkg depend.mk for:	mapping/worldmodelgrid3dg-genom
# Created:			Anthony Mallet on Thu, 9 Apr 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
WORLDMODELGRID3DG_GENOM_DEPEND_MK:=${WORLDMODELGRID3DG_GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	worldmodelgrid3dg-genom
endif

ifeq (+,$(WORLDMODELGRID3DG_GENOM_DEPEND_MK)) # ----------------------------

PREFER.worldmodelgrid3dg-genom?=	robotpkg

DEPEND_USE+=				worldmodelgrid3dg-genom

DEPEND_ABI.worldmodelgrid3dg-genom?=	worldmodelgrid3dg-genom>=1.0
DEPEND_DIR.worldmodelgrid3dg-genom?=	../../mapping/worldmodelgrid3dg-genom

SYSTEM_SEARCH.worldmodelgrid3dg-genom=\
	include/worldModelGrid3DG/worldModelGrid3DGStruct.h		\
	'lib/pkgconfig/worldModelGrid3DG.pc:/Version/s/[^0-9.]//gp'


include ../../architecture/genom/depend.mk

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}

