# robotpkg depend.mk for:	motion/dynamic-graph-corba
# Created:			Florent Lamiraux on Thu, 7 July 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_GIK_DEPEND_MK:=	${HPP_GIK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		dynamic-graph-corba
endif

ifeq (+,$(HPP_GIK_DEPEND_MK)) # --------------------------------------

PREFER.dynamic-graph-corba?=	robotpkg

SYSTEM_SEARCH.dynamic-graph-corba=\
	lib/pkgconfig/dynamic-graph-corba.pc \
	include/dynamic-graph/corba/interpreter.hh

DEPEND_USE+=		dynamic-graph-corba

DEPEND_ABI.dynamic-graph-corba?=	dynamic-graph-corba>=2.5
DEPEND_DIR.dynamic-graph-corba?=	../../motion/dynamic-graph-corba

endif # HPP_GIK_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
