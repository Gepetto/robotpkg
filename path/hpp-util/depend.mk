# robotpkg depend.mk for:	path/hpp-util
# Created:			Thomas Moulard on Wed, 8 Sep 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPPUTIL_DEPEND_MK:=	${HPPUTIL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-util
endif

ifeq (+,$(HPPUTIL_DEPEND_MK)) # ---------------------------

PREFER.hpp-util?=	robotpkg

DEPEND_USE+=		hpp-util

DEPEND_ABI.hpp-util?=	hpp-util>=3.3
DEPEND_DIR.hpp-util?=	../../path/hpp-util

SYSTEM_SEARCH.hpp-util=			\
	include/hpp/util/version.hh	\
	lib/libhpp-util.so		\
	'lib/pkgconfig/hpp-util.pc:/Version/s/[^0-9.]//gp'

endif # HPPUTIL_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
