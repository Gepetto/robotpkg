# robotpkg depend.mk for:	path/hpp-roboptim
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_ROBOPTIM_DEPEND_MK:=	${HPP_ROBOPTIM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-roboptim
endif

ifeq (+,$(HPP_ROBOPTIM_DEPEND_MK)) # ---------------------------------------

PREFER.hpp-roboptim?=	robotpkg

DEPEND_USE+=		hpp-roboptim

DEPEND_ABI.hpp-roboptim?=	hpp-roboptim>=1.0
DEPEND_DIR.hpp-roboptim?=	../../path/hpp-roboptim

SYSTEM_SEARCH.hpp-roboptim=				\
	lib/libhpp-roboptim.so				\
	include/hpp/roboptim/spline-directpath.hh	\
	'lib/pkgconfig/hpp-roboptim.pc:/Version/s/[^0-9.]//gp'

endif # HPP_ROBOPTIM_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
