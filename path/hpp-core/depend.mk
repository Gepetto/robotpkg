# robotpkg depend.mk for:	path/hpp-core
# Created:			Anthony Mallet on Wed, 17 Sep 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPPCORE_DEPEND_MK:=	${HPPCORE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-core
endif

ifeq (+,$(HPPCORE_DEPEND_MK)) # --------------------------------------

PREFER.hpp-core?=	robotpkg

DEPEND_USE+=		hpp-core

DEPEND_ABI.hpp-core?=	hpp-core>=1.12
DEPEND_DIR.hpp-core?=	../../path/hpp-core

SYSTEM_SEARCH.hpp-core=\
	include/hpp/core/problem.hh	\
	lib/pkgconfig/hppCore.pc

endif # HPPCORE_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
