# robotpkg depend.mk for:	path/hpp-practicals
# Created:			Florent Lamiraux on Wed, 29 May 2019
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HPP_PRACTICALS_DEPEND_MK:=	${HPP_PRACTICALS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			hpp-practicals
endif

ifeq (+,$(HPP_PRACTICALS_DEPEND_MK)) # -------------------------------------

PREFER.hpp-practicals?=		robotpkg

DEPEND_USE+=			hpp-practicals

DEPEND_ABI.hpp-practicals?=	hpp-practicals>=4.6.0
DEPEND_DIR.hpp-practicals?=	../../doc/hpp-practicals

SYSTEM_SEARCH.hpp-practicals=\
  'include/hpp/practicals/config.hh'				\
  'share/hpp_practicals/urdf/ur5_gripper.urdf'			\
  'lib/pkgconfig/hpp_practicals.pc:/Version/s/[^0-9.]//gp'

endif # HPP_PRACTICALS_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
