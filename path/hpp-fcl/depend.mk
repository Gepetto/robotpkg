# robotpkg depend.mk for:	path/hpp-fcl
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_FCL_DEPEND_MK:=	${HPP_FCL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-fcl
endif

ifeq (+,$(HPP_FCL_DEPEND_MK)) # ---------------------------

PREFER.hpp-fcl?=	robotpkg

DEPEND_USE+=		hpp-fcl

DEPEND_ABI.hpp-fcl?=	hpp-fcl>=0.4
DEPEND_DIR.hpp-fcl?=	../../path/hpp-fcl

SYSTEM_SEARCH.hpp-fcl=				  \
	include/hpp/fcl/narrowphase/narrowphase.h \
	lib/libhpp-fcl.so			  \
	'lib/pkgconfig/hpp-fcl.pc:/Version/s/[^0-9.]//gp'

endif # HPP_FCL_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
