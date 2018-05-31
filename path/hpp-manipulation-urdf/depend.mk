# robotpkg depend.mk for:	path/hpp-manipulation-urdf
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPPMANIPULATIONURDF_DEPEND_MK:=	${HPPMANIPULATIONURDF_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-manipulation-urdf
endif

ifeq (+,$(HPPMANIPULATIONURDF_DEPEND_MK)) # ---------------------------

PREFER.hpp-manipulation-urdf?=	robotpkg

DEPEND_USE+=		hpp-manipulation-urdf

DEPEND_ABI.hpp-manipulation-urdf?=	hpp-manipulation-urdf>=4.1
DEPEND_DIR.hpp-manipulation-urdf?=	../../path/hpp-manipulation-urdf

SYSTEM_SEARCH.hpp-manipulation-urdf=			\
	include/hpp/manipulation/parser/parser.hh	\
	include/hpp/manipulation/parser/factories/sequence.hh \
	lib/libhpp-manipulation-urdf.so		\
	'lib/pkgconfig/hpp-manipulation-urdf.pc:/Version/s/[^0-9.]//gp'

endif # HPPMANIPULATIONURDF_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
