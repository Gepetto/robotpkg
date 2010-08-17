# robotpkg depend.mk for:	path/hpp-localstepper
# Created:			florent on Fri, 16 Oct 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_LOCALSTEPPER_DEPEND_MK:=	${HPP_LOCALSTEPPER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-localstepper
endif

ifeq (+,$(HPP_LOCALSTEPPER_DEPEND_MK)) # --------------------------------------

PREFER.hpp-localstepper?=	robotpkg

SYSTEM_SEARCH.hpp-localstepper=\
	include/hpp/localstepper/solver.hh \
	lib/pkgconfig/hpp-localstepper.pc
DEPEND_USE+=		hpp-localstepper

DEPEND_ABI.hpp-localstepper?=	hpp-localstepper>=0.1
DEPEND_DIR.hpp-localstepper?=	../../path/hpp-localstepper

endif # HPP_LOCALSTEPPER_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
