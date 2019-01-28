# robotpkg depend.mk for:	path/hpp-pinocchio
# Created:			Guilhem Saurel on Wed, 14 Mar 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPPPINOCCHIO_DEPEND_MK:=${HPPPINOCCHIO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-pinocchio
endif

ifeq (+,$(HPPPINOCCHIO_DEPEND_MK)) # ---------------------------

PREFER.hpp-pinocchio?=	robotpkg

DEPEND_USE+=		hpp-pinocchio

DEPEND_ABI.hpp-pinocchio?=	hpp-pinocchio>=4.3.0
DEPEND_DIR.hpp-pinocchio?=	../../math/hpp-pinocchio

SYSTEM_SEARCH.hpp-pinocchio=		\
  'include/hpp/pinocchio/util.hh'	\
  'lib/libhpp-pinocchio.so'		\
  'lib/pkgconfig/hpp-pinocchio.pc:/Version/s/[^0-9.]//gp'

DEPEND_ABI.eigen3 += eigen3>=3.2
include ../../math/eigen3/depend.mk
include ../../math/pinocchio/depend.mk
include ../../path/hpp-fcl/depend.mk

endif # HPPPINOCCHIO_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
