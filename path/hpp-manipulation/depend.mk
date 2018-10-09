# robotpkg depend.mk for:	path/hpp-manipulation
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPPMANIPULATION_DEPEND_MK:=	${HPPMANIPULATION_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-manipulation
endif

ifeq (+,$(HPPMANIPULATION_DEPEND_MK)) # ---------------------------

PREFER.hpp-manipulation?=	robotpkg

DEPEND_USE+=		hpp-manipulation

DEPEND_ABI.hpp-manipulation?=	hpp-manipulation>=4.2.0
DEPEND_DIR.hpp-manipulation?=	../../path/hpp-manipulation

SYSTEM_SEARCH.hpp-manipulation=			\
	include/hpp/manipulation/device.hh	\
	include/hpp/manipulation/problem-solver.hh \
	lib/libhpp-manipulation.so		\
	'lib/pkgconfig/hpp-manipulation.pc:/Version/s/[^0-9.]//gp'

endif # HPPMANIPULATION_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
