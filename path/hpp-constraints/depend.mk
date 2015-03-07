# robotpkg depend.mk for:	path/hpp-constraints
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_CONSTRAINTS_DEPEND_MK:=	${HPP_CONSTRAINTS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-constraints
endif

ifeq (+,$(HPP_CONSTRAINTS_DEPEND_MK)) # --------------------------------------

PREFER.hpp-constraints?=	robotpkg

DEPEND_USE+=		hpp-constraints

DEPEND_ABI.hpp-constraints?=	hpp-constraints>=3.1.0
DEPEND_DIR.hpp-constraints?=	../../path/hpp-constraints

SYSTEM_SEARCH.hpp-constraints=				\
	lib/libhpp-constraints.so			\
	include/hpp/constraints/differentiable-function.hh	\
	'lib/pkgconfig/hpp-constraints.pc:/Version/s/[^0-9.]//gp'

endif # HPP_CONSTRAINTS_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
