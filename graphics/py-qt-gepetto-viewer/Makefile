# robotpkg Makefile for:	graphics/py-qt-gepetto-viewer
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#

HPP_PACKAGE=		gepetto-viewer
HPP_VERSION=		4.12.0
PKGNAME=		${PKGTAG.python-}${PKGTAG.qt-}${DISTNAME}

CATEGORIES=		graphics
HPP_COMMENT=		Simple viewer based on OpenSceneGraph
LICENSE=		2-clause-bsd

USE_BOOST_LIBS+=	python unit_test_framework system regex

include ../../meta-pkgs/hpp/Makefile.common

# old package name and other Python / Qt versions
CONFLICTS=		gepetto-viewer-[0-9]*
CONFLICTS+=		py[0-9][0-9]-qt[0-9]-gepetto-viewer-[0-9]*

CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes
CMAKE_ARGS+=\
  -DPROJECT_USE_QT4=$(if $(filter qt4,${PKG_ALTERNATIVE.qt}),ON,OFF)

# Qt4 requires some tweaks
include ../../mk/sysdep/qt.mk
define PKG_ALTERNATIVE_SET.qt4 +=

  include ../../mk/sysdep/qmake.mk
  CMAKE_ARGS+=		-DQT_QMAKE_EXECUTABLE=${QMAKE}
endef

# For Qt5 we can enable py-PythonQt
define PKG_ALTERNATIVE_SET.qt5 +=

  include ../../graphics/py-pythonqt/depend.mk
  CMAKE_ARGS+=		-DGEPETTO_GUI_HAS_PYTHONQT=ON
  PLIST_SRC+=		${PKGDIR}/PLIST.qt5
  DYNAMIC_PLIST_DIRS+=	etc/gepetto-gui/pyplugin.conf.d
endef


include ../../graphics/openscenegraph/depend.mk
include ../../graphics/qt-osgqt/depend.mk
include ../../graphics/urdfdom-headers/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
