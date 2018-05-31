# robotpkg depend.mk for:	path/hpp-tutorial
# Created:			Florent Lamiraux on Thu, 12 Mar 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPPTUTORIAL_DEPEND_MK:=	${HPPTUTORIAL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-tutorial
endif

ifeq (+,$(HPPTUTORIAL_DEPEND_MK)) # --------------------------------------

PREFER.hpp-tutorial?=	robotpkg

DEPEND_USE+=		hpp-tutorial

DEPEND_ABI.hpp-tutorial?=	hpp_tutorial>=1.1
DEPEND_DIR.hpp-tutorial?=	../../doc/hpp-tutorial

SYSTEM_SEARCH.hpp-tutorial=\
	bin/hpp-tutorial-server		\
	'lib/pkgconfig/hpp_tutorial.pc:/Version/s/[^0-9.]//gp'

endif # HPPTUTORIAL_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
