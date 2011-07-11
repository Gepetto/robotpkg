# robotpkg depend.mk for:	motion/sot-core
# Created:			Florent Lamiraux on Fri, 8 Jul 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_GIK_DEPEND_MK:=	${HPP_GIK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sot-core
endif

ifeq (+,$(HPP_GIK_DEPEND_MK)) # --------------------------------------

PREFER.sot-core?=	robotpkg

SYSTEM_SEARCH.sot-core=\

DEPEND_USE+=		sot-core

DEPEND_ABI.sot-core?=	sot-core>=2.5
DEPEND_DIR.sot-core?=	../../motion/sot-core

endif # HPP_GIK_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
