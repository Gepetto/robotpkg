# robotpkg depend.mk for:	path/hpp-hik
# Created:			florent on Thu, 15 Oct 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_HIK_DEPEND_MK:=	${HPP_HIK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-hik
endif

ifeq (+,$(HPP_HIK_DEPEND_MK)) # --------------------------------------

PREFER.hpp-hik?=	robotpkg

SYSTEM_SEARCH.hpp-hik=\
	include/hpp/hik/solver.hh \
	lib/pkgconfig/hpp-hik.pc
DEPEND_USE+=		hpp-hik

DEPEND_ABI.hpp-hik?=	hpp-hik>=1.2.0
DEPEND_DIR.hpp-hik?=	../../path/hpp-hik

endif # HPP_HIK_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
