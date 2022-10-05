# robotpkg Makefile for:	graphics/py-qt-gepetto-viewer
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#

HPP_PACKAGE=		gepetto-viewer
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
CMAKE_ARGS+=		-DBUILD_PY_QCUSTOM_PLOT=ON
CMAKE_ARGS+=		-DPROJECT_USE_QT4=OFF
CMAKE_ARGS+=		-DGEPETTO_GUI_HAS_PYTHONQT=ON
CMAKE_ARGS+=		-DPYTHON_SITELIB=${PYTHON_SITELIB}
CMAKE_ARGS+=		-DPYTHONQT_INSTALL_DIR=${PREFIX.py-pythonqt}

DYNAMIC_PLIST_DIRS+=	etc/gepetto-gui/pyplugin.conf.d

include ../../graphics/openscenegraph/depend.mk
include ../../graphics/py-pythonqt/depend.mk
include ../../graphics/qt-osgqt/depend.mk
include ../../graphics/urdfdom-headers/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../mk/sysdep/ffmpeg.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk

DEPEND_ABI.qt+=		qt>=5

include ../../mk/robotpkg.mk
