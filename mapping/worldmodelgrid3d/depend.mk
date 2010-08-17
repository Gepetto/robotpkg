# robotpkg depend.mk for:	mapping/worldmodelgrid3d
# Created:			Anthony Mallet on Thu, 9 Apr 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
WORLDMODELGRID3D_DEPEND_MK:=	${WORLDMODELGRID3D_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	worldmodelgrid3d
endif

ifeq (+,$(WORLDMODELGRID3D_DEPEND_MK)) # -----------------------------------

PREFER.worldmodelgrid3d?=	robotpkg

DEPEND_USE+=			worldmodelgrid3d

DEPEND_ABI.worldmodelgrid3d?=	worldmodelgrid3d>=1.0
DEPEND_DIR.worldmodelgrid3d?=	../../mapping/worldmodelgrid3d

SYSTEM_SEARCH.worldmodelgrid3d=\
	include/worldModelGrid3D/wmGrid3D.h				\
	'lib/pkgconfig/worldModelGrid3D.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
