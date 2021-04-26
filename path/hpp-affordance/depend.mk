# robotpkg depend.mk for:	path/hpp-affordance
# Created:			Guilhem Saurel on Tue, 13 Apr 2021
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HPP_AFFORDANCE_DEPEND_MK:=	${HPP_AFFORDANCE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			hpp-affordance
endif

ifeq (+,$(HPP_AFFORDANCE_DEPEND_MK)) # --------------------------------------

PREFER.hpp-affordance?=		robotpkg

DEPEND_USE+=			hpp-affordance

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.hpp-affordance?=	hpp-affordance>=${HPP_MIN_VERSION}
DEPEND_DIR.hpp-affordance?=	../../path/hpp-affordance

SYSTEM_SEARCH.hpp-affordance=										\
	'include/hpp/affordance/config.hh'								\
	'lib/cmake/hpp-affordance/hpp-affordanceConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
	'lib/libhpp-affordance.so'									\
	'lib/pkgconfig/hpp-affordance.pc:/Version/s/[^0-9.]//gp'					\
	'share/hpp-affordance/package.xml:/<version>/s/[^0-9.]//gp'

endif # HPP_AFFORDANCE_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
