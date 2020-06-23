# robotpkg depend.mk for:	graphics/qt-osgqt
# Created:			Guilhem Saurel on Mon, 25 May 2020
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OSGQT_DEPEND_MK:=	${OSGQT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qt-osgqt
endif

ifeq (+,$(OSGQT_DEPEND_MK)) # ----------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (CentOS,${OPSYS})
  PREFER.qt-osgqt?=	robotpkg
else ifeq (NetBSD,${OPSYS})
  PREFER.qt-osgqt?=	robotpkg
else ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 1%,${OS_VERSION})) # Ubuntu < 20 (until year 2100?)
    PREFER.qt-osgqt?=	system
  else
    PREFER.qt-osgqt?=	robotpkg
  endif
endif
PREFER.qt-osgqt?=	system

DEPEND_USE+=		qt-osgqt
DEPEND_ABI.qt-osgqt?=	${PKGTAG.qt-}osgqt>=3
DEPEND_DIR.qt-osgqt?=	../../graphics/qt-osgqt

# make sure to use the right Qt version: "Qt" suffix for Qt4, "Qt5" suffix for
# Qt5.
_osgqt=Qt$(subst 4,,${QT_SELECT})

SYSTEM_SEARCH.qt-osgqt=							\
  'include/osgQt/Export'						\
  'lib/libosg${_osgqt}.so'						\
  'lib/pkgconfig/openscenegraph-osg${_osgqt}.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.openscenegraph-qt=\
  libopenscenegraph-dev for ${PKG_ALTERNATIVE.qt}
SYSTEM_PKG.Fedora.openscenegraph-qt=\
  OpenSceneGraph-qt-devel for ${PKG_ALTERNATIVE.qt}
SYSTEM_PKG.Arch.openscenegraph-qt=\
  osgqt (AUR) for ${PKG_ALTERNATIVE.qt}

include ../../mk/sysdep/qt.mk

endif # OSGQT_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
