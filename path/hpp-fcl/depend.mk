# robotpkg depend.mk for:	path/hpp-fcl
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_FCL_DEPEND_MK:=	${HPP_FCL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-fcl
endif

ifeq (+,$(HPP_FCL_DEPEND_MK)) # --------------------------------------------

PREFER.hpp-fcl?=	robotpkg

DEPEND_USE+=		hpp-fcl

DEPEND_ABI.hpp-fcl?=	hpp-fcl>=1.2.1
DEPEND_DIR.hpp-fcl?=	../../path/hpp-fcl

SYSTEM_SEARCH.hpp-fcl=\
  'include/hpp/fcl/config.hh:/HPP_FCL_VERSION /s/[^0-9.]//gp'				\
  'lib/cmake/hpp-fcl/hpp-fclConfigVersion.cmake:/PACKAGE_VERSION /s/[^0-9.]//gp'	\
  'lib/libhpp-fcl.so'									\
  'lib/pkgconfig/hpp-fcl.pc:/Version/s/[^0-9.]//gp'					\
  'share/hpp-fcl/package.xml:/<version>/s/[^0-9.]//gp'

include ../../math/eigen3/depend.mk

endif # HPP_FCL_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
