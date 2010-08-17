# robotpkg depend.mk for:	path/hpp-dynamic-obstacle
# Created:			Anthony Mallet on Thu, 9 Apr 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HPP_DYNAMIC_OBSTACLE_DEPEND_MK:=${HPP_DYNAMIC_OBSTACLE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	hpp-dynamic-obstacle
endif

ifeq (+,$(HPP_DYNAMIC_OBSTACLE_DEPEND_MK)) # -------------------------------

PREFER.hpp-dynamic-obstacle?=	robotpkg

DEPEND_USE+=			hpp-dynamic-obstacle

DEPEND_ABI.hpp-dynamic-obstacle?=	hpp-dynamic-obstacle>=1.0
DEPEND_DIR.hpp-dynamic-obstacle?=	../../path/hpp-dynamic-obstacle

SYSTEM_SEARCH.hpp-dynamic-obstacle=\
	include/hppDynamicObstacle/hppDynamicObstacle.h			\
	'lib/pkgconfig/hppDynamicObstacle.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
