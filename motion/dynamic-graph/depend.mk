# robotpkg depend.mk for:	motion/dynamic-graph
# Created:			Florent Lamiraux on Sat,  9 Jul 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_GIK_DEPEND_MK:=	${HPP_GIK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		dynamic-graph
endif

ifeq (+,$(HPP_GIK_DEPEND_MK)) # --------------------------------------

PREFER.dynamic-graph?=	robotpkg

SYSTEM_SEARCH.dynamic-graph=\
	include/dynamic-graph/entity.h	\
	lib/libdynamic-graph.so		\
	lib/pkgconfig/dynamic-graph.pc

DEPEND_USE+=		dynamic-graph

DEPEND_ABI.dynamic-graph?=	dynamic-graph>=2.5
DEPEND_DIR.dynamic-graph?=	../../motion/dynamic-graph

endif # HPP_GIK_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
