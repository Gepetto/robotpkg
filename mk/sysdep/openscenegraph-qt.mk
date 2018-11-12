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

# make sure to use the right Qt version: this sed program reports version 0 if
# there is a Qt version mismatch, nothing otherwise. If there is no
# OSGQT_QT_VERSION, do the check against Qt4.
_osgversionpat=\
  /define OSGQT_QT_VERSION/{/VERSION.*${QT_SELECT}/!{s/.*/0/p;q}};	\
  $${s/.*/4/;/${QT_SELECT}/!{s/.*/0/p;q}}

# osg-qt>=3.4 defines the QT_VERSION, otherwise assume 4
SYSTEM_SEARCH.openscenegraph-qt=\
  'include/osgQt/{Version,Export}:${_osgversionpat}'		\
  'lib/libosgQt.so'						\
  'lib/pkgconfig/openscenegraph-osgQt.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.openscenegraph-qt=\
  libopenscenegraph-dev for ${PKG_ALTERNATIVE.qt}
SYSTEM_PKG.Fedora.openscenegraph-qt=\
  OpenSceneGraph-qt-devel for ${PKG_ALTERNATIVE.qt}
SYSTEM_PKG.Arch.openscenegraph-qt=\
  osgqt (AUR) for ${PKG_ALTERNATIVE.qt}

include ../../mk/sysdep/qt.mk

endif # OPENSCENEGRAPH_QT_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
