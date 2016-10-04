# robotpkg sysdep/openscenegraph-qt.mk
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
OPENSCENEGRAPH_QT_DEPEND_MK:=	${OPENSCENEGRAPH_QT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			openscenegraph-qt
endif

ifeq (+,$(OPENSCENEGRAPH_QT_DEPEND_MK)) # ----------------------------------

PREFER.openscenegraph-qt?=	system

DEPEND_USE+=			openscenegraph-qt

DEPEND_ABI.openscenegraph-qt?=	openscenegraph-qt>=3

SYSTEM_SEARCH.openscenegraph-qt=\
  'include/osgQt/Export'					\
  'lib/libosgQt.so'						\
  'lib/pkgconfig/openscenegraph-osgQt.pc:/Version/s/[^0-9.]//gp'

endif # OPENSCENEGRAPH_QT_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
