# robotpkg depend.mk for:	path/hpp-gik
# Created:			Anthony Mallet on Wed, 14 May 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_GIK_DEPEND_MK:=	${HPP_GIK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-gik
endif

ifeq (+,$(HPP_GIK_DEPEND_MK)) # --------------------------------------

PREFER.hpp-gik?=	robotpkg

SYSTEM_SEARCH.hpp-gik=\
	include/hpp/gik/core/solver.hh	\
	lib/libhpp-gik.la

DEPEND_USE+=		hpp-gik

DEPEND_ABI.hpp-gik?=	hpp-gik>=2.4
DEPEND_DIR.hpp-gik?=	../../path/hpp-gik

endif # HPP_GIK_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
