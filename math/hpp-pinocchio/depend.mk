# robotpkg depend.mk for:	path/hpp-pinocchio
# Created:			Guilhem Saurel on Wed, 14 Mar 2018
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HPP_PINOCCHIO_DEPEND_MK:=	${HPP_PINOCCHIO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			hpp-pinocchio
endif

ifeq (+,$(HPP_PINOCCHIO_DEPEND_MK)) # ---------------------------

PREFER.hpp-pinocchio?=		robotpkg

DEPEND_USE+=			hpp-pinocchio

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.hpp-pinocchio?=	hpp-pinocchio>=${HPP_MIN_VERSION}
DEPEND_DIR.hpp-pinocchio?=	../../math/hpp-pinocchio

SYSTEM_SEARCH.hpp-pinocchio=									\
  'include/hpp/pinocchio/util.hh:/HPP_PINOCCHIO_VERSION /s/[^0-9.]//gp'				\
  'lib/cmake/hpp-pinocchio/hpp-pinocchioConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/libhpp-pinocchio.so'									\
  'lib/pkgconfig/hpp-pinocchio.pc:/Version/s/[^0-9.]//gp'					\
  'share/hpp-pinocchio/package.xml:/<version>/s/[^0-9.]//gp'

DEPEND_ABI.eigen3 += eigen3>=3.2.92
include ../../math/eigen3/depend.mk
include ../../math/pinocchio/depend.mk
include ../../path/coal/depend.mk

endif # HPP_PINOCCHIO_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
