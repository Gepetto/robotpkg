# robotpkg depend.mk for:	path/hpp-constrained-planner
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_CONSTRAINED_PLANNER_DEPEND_MK:=	${HPP_CONSTRAINED_PLANNER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-constrained-planner
endif

ifeq (+,$(HPP_CONSTRAINED_PLANNER_DEPEND_MK)) # ----------------------------

PREFER.hpp-constrained-planner?=	robotpkg

DEPEND_USE+=		hpp-constrained-planner

DEPEND_ABI.hpp-constrained-planner?=	hpp-constrained-planner>=1.0
DEPEND_DIR.hpp-constrained-planner?=	../../path/hpp-constrained-planner

SYSTEM_SEARCH.hpp-constrained-planner=			\
	lib/libhpp-constrained-planner.so		\
	include/hpp/constrained/planner/planner.hh	\
	'lib/pkgconfig/hpp-constrained-planner.pc:/Version/s/[^0-9.]//gp'

endif # HPP_CONSTRAINED_PLANNER_DEPEND_MK ----------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
