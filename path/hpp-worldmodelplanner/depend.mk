# robotpkg depend.mk for:	path/hpp-worldmodelplanner
# Created:			Anthony Mallet on Thu, 9 Apr 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HPP_WORLDMODELPLANNER_DEPEND_MK:=${HPP_WORLDMODELPLANNER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	hpp-worldmodelplanner
endif

ifeq (+,$(HPP_WORLDMODELPLANNER_DEPEND_MK)) # ------------------------------

PREFER.hpp-worldmodelplanner?=	robotpkg

DEPEND_USE+=			hpp-worldmodelplanner

DEPEND_ABI.hpp-worldmodelplanner?=	hpp-worldmodelplanner>=1.0
DEPEND_DIR.hpp-worldmodelplanner?=	../../path/hpp-worldmodelplanner

SYSTEM_SEARCH.hpp-worldmodelplanner=\
	include/hppWorldModelPlanner/hppWorldModelPlanner.h		\
	'lib/pkgconfig/hppWorldModelPlanner.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
