# robotpkg depend.mk for:	path/hpp-fcl04
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_FCL04_DEPEND_MK:=	${HPP_FCL04_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-fcl04
endif

ifeq (+,$(HPP_FCL04_DEPEND_MK)) # ------------------------------------------

PREFER.hpp-fcl04?=	robotpkg

DEPEND_USE+=		hpp-fcl04

DEPEND_ABI.hpp-fcl04?=	hpp-fcl04>=0.4.2<0.5
DEPEND_DIR.hpp-fcl04?=	../../path/hpp-fcl04

SYSTEM_SEARCH.hpp-fcl04=\
  'include/hpp/fcl/narrowphase/narrowphase.h'	\
  'lib/libhpp-fcl.so'				\
  'lib/pkgconfig/hpp-fcl.pc:/Version/s/[^0-9.]//gp'

endif # HPP_FCL04_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
