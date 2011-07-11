# robotpkg depend.mk for:	motion/dynamic-graph-python
# Created:			Florent Lamiraux on Thu, 7 Jul 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_GIK_DEPEND_MK:=	${HPP_GIK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		dynamic-graph-python
endif

ifeq (+,$(HPP_GIK_DEPEND_MK)) # --------------------------------------

PREFER.dynamic-graph-python?=	robotpkg

SYSTEM_SEARCH.dynamic-graph-python=\
	lib/pkgconfig/dynamic-graph-python.pc \
	include/dynamic-graph/python/interpreter.hh

DEPEND_USE+=		dynamic-graph-python

DEPEND_ABI.dynamic-graph-python?=	dynamic-graph-python>=2.5
DEPEND_DIR.dynamic-graph-python?=	../../motion/dynamic-graph-python

endif # HPP_GIK_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
