# robotpkg depend.mk for:	path/hpp-wholebody-step-planner
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_WHOLEBODY_STEP_DEPEND_MK:=	${HPP_WHOLEBODY_STEP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-wholebody-step-planner
endif

ifeq (+,$(HPP_WHOLEBODY_STEP_DEPEND_MK)) # ----------------------------------

PREFER.hpp-wholebody-step-planner?=	robotpkg

DEPEND_USE+=		hpp-wholebody-step-planner

DEPEND_ABI.hpp-wholebody-step-planner?=	hpp-wholebody-step-planner>=0.2
DEPEND_DIR.hpp-wholebody-step-planner?=	../../path/hpp-wholebody-step-planner

SYSTEM_SEARCH.hpp-wholebody-step-planner=		\
	lib/libhpp-wholebody-step-planner.so		\
	include/hpp/wholebody-step-planner/planner.hh	\
	'lib/pkgconfig/hpp-wholebody-step-planner.pc:/Version/s/[^0-9.]//gp'

endif # HPP_WHOLEBODY_STEP_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
