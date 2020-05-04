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

DEPEND_ABI.hpp-core?=	hpp-core>=4.9.0
DEPEND_DIR.hpp-core?=	../../path/hpp-core

SYSTEM_SEARCH.hpp-core=\
	'include/hpp/core/problem.hh'							\
	'lib/cmake/hpp-core/hpp-coreConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
	'lib/libhpp-core.so'								\
	'lib/pkgconfig/hpp-core.pc:/Version/s/[^0-9.]//gp'

endif # HPPCORE_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
