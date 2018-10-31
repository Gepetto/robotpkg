# robotpkg sysdep/openscenegraph.mk
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
OPENSCENEGRAPH_DEPEND_MK:=	${OPENSCENEGRAPH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			openscenegraph
endif

ifeq (+,$(OPENSCENEGRAPH_DEPEND_MK)) # -------------------------------------

PREFER.openscenegraph?=		system

DEPEND_USE+=			openscenegraph

DEPEND_ABI.openscenegraph?=	openscenegraph>=3

SYSTEM_SEARCH.openscenegraph=\
  'include/osg/Object'						\
  'lib/libosg.so'						\
  'lib/pkgconfig/openscenegraph.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.openscenegraph=	openscenegraph
SYSTEM_PKG.Arch.openscenegraph=		openscenegraph

endif # OPENSCENEGRAPH_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
