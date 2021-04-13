# robotpkg depend.mk for:	path/hpp-constraints
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HPP_CONSTRAINTS_DEPEND_MK:=	${HPP_CONSTRAINTS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			hpp-constraints
endif

ifeq (+,$(HPP_CONSTRAINTS_DEPEND_MK)) # --------------------------------------

PREFER.hpp-constraints?=	robotpkg

DEPEND_USE+=			hpp-constraints

DEPEND_ABI.hpp-constraints?=	hpp-constraints>=4.9.0
DEPEND_DIR.hpp-constraints?=	../../path/hpp-constraints

SYSTEM_SEARCH.hpp-constraints=									\
  'include/hpp/constraints/differentiable-function.hh'						\
  'lib/libhpp-constraints.so'									\
  'lib/cmake/hpp-constraints/hpp-constraintsConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/pkgconfig/hpp-constraints.pc:/Version/s/[^0-9.]//gp'					\
  'share/hpp-constraints/package.xml:/<version>/s/[^0-9.]//gp'

DEPEND_ABI.eigen3 += eigen3>=3.2.4
include ../../math/eigen3/depend.mk

endif # HPP_CONSTRAINTS_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
