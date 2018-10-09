# robotpkg depend.mk for:	path/hpp-walkgen
# Created:			Guilhem Saurel on Wed, 14 Mar 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPPWALKGEN_DEPEND_MK:=	${HPPWALKGEN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-walkgen
endif

ifeq (+,$(HPPWALKGEN_DEPEND_MK)) # ---------------------------

PREFER.hpp-walkgen?=	robotpkg

DEPEND_USE+=		hpp-walkgen

DEPEND_ABI.hpp-walkgen?=	hpp-walkgen>=4.2.0
DEPEND_DIR.hpp-walkgen?=	../../path/hpp-walkgen

SYSTEM_SEARCH.hpp-walkgen=			\
	include/hpp/walkgen/fwd.hh	\
	lib/libhpp-walkgen.so		\
	'lib/pkgconfig/hpp-walkgen.pc:/Version/s/[^0-9.]//gp'

endif # HPPWALKGEN_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
