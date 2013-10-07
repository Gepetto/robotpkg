# robotpkg depend.mk for:	math/hpp-geometry
# Created:			Florent Lamiraux on July, 21. 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPPGEOMETRY_DEPEND_MK:=	${HPPGEOMETRY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-geometry
endif

ifeq (+,$(HPPGEOMETRY_DEPEND_MK)) # --------------------------------------

PREFER.hpp-geometry?=	robotpkg

DEPEND_USE+=		hpp-geometry

DEPEND_ABI.hpp-geometry?=	hpp-geometry>=1.3
DEPEND_DIR.hpp-geometry?=	../../math/hpp-geometry

SYSTEM_SEARCH.hpp-geometry=\
	include/hpp/geometry/collision/capsule.hh	\
	include/hpp/geometry/component/capsule.hh	\
	'lib/pkgconfig/hpp-geometry.pc:/Version/s/[^0-9.]//gp'

endif # HPPGEOMETRY_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
