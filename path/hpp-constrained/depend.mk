# robotpkg depend.mk for:	path/hpp-constrained
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_CONSTRAINED_DEPEND_MK:=	${HPP_CONSTRAINED_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-constrained
endif

ifeq (+,$(HPP_CONSTRAINED_DEPEND_MK)) # --------------------------------------

PREFER.hpp-constrained?=	robotpkg

DEPEND_USE+=		hpp-constrained

DEPEND_ABI.hpp-constrained?=	hpp-constrained>=1.0
DEPEND_DIR.hpp-constrained?=	../../path/hpp-constrained

SYSTEM_SEARCH.hpp-constrained=				\
	lib/libhpp-constrained.so			\
	include/hpp/constrained/config-projector.hh	\
	'lib/pkgconfig/hpp-constrained.pc:/Version/s/[^0-9.]//gp'

endif # HPP_CONSTRAINED_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
