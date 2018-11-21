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

DEPEND_ABI.openscenegraph-qt?=	openscenegraph-qt${QT_SELECT}>=3

# make sure to use the right Qt version: "Qt" suffix for Qt4, "Qt5" suffix for
# Qt5.
_osgqt=Qt$(subst 4,,${QT_SELECT})

SYSTEM_SEARCH.openscenegraph-qt=\
  'include/osgQt/Export'					\
  'lib/libosg${_osgqt}.so'					\
  'lib/pkgconfig/openscenegraph-osg${_osgqt}.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.openscenegraph-qt=\
  libopenscenegraph-dev for ${PKG_ALTERNATIVE.qt}
SYSTEM_PKG.Fedora.openscenegraph-qt=\
  OpenSceneGraph-qt-devel for ${PKG_ALTERNATIVE.qt}
SYSTEM_PKG.Arch.openscenegraph-qt=\
  osgqt (AUR) for ${PKG_ALTERNATIVE.qt}

include ../../mk/sysdep/qt.mk

endif # OPENSCENEGRAPH_QT_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
