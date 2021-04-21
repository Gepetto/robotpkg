# robotpkg depend.mk for:	path/hpp-manipulation
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HPP_MANIPULATION_DEPEND_MK:=	${HPP_MANIPULATION_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			hpp-manipulation
endif

ifeq (+,$(HPP_MANIPULATION_DEPEND_MK)) # ---------------------------

PREFER.hpp-manipulation?=	robotpkg

DEPEND_USE+=			hpp-manipulation

DEPEND_ABI.hpp-manipulation?=	hpp-manipulation>=4.9.0
DEPEND_DIR.hpp-manipulation?=	../../path/hpp-manipulation

SYSTEM_SEARCH.hpp-manipulation=										\
	'include/hpp/manipulation/config.hh:/HPP_MANIPULATION_VERSION /s/[^0-9.]//gp'			\
	'lib/cmake/hpp-manipulation/hpp-manipulationConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
	'lib/libhpp-manipulation.so'									\
	'lib/pkgconfig/hpp-manipulation.pc:/Version/s/[^0-9.]//gp'					\
	'share/hpp-manipulation/package.xml:/<version>/s/[^0-9.]//gp'

endif # HPP_MANIPULATION_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
