# robotpkg depend.mk for:	math/libt3d
# Created:			Arnaud Degroote on Thu, 15 May 2008
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBT3D_DEPEND_MK:=	${LIBT3D_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libt3d
endif

ifeq (+,$(LIBT3D_DEPEND_MK)) # ---------------------------------------------

PREFER.libt3d?=		robotpkg

DEPEND_USE+=		libt3d

DEPEND_ABI.libt3d?=	libt3d>=2.6
DEPEND_DIR.libt3d?=	../../math/t3d

SYSTEM_SEARCH.libt3d=\
	include/t3d/t3d.h	\
	'lib/pkgconfig/t3d.pc:/Version/s/[^0-9.]//gp'

endif # LIBT3D_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
