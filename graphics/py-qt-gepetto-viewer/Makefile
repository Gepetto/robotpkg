# robotpkg Makefile for:	graphics/py-qt-gepetto-viewer
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#

HPP_PACKAGE=		gepetto-viewer

PKGNAME=		${PKGTAG.python-}${PKGTAG.qt-}${DISTNAME}

CATEGORIES=		graphics
HPP_COMMENT=		Simple viewer based on OpenSceneGraph
LICENSE=		2-clause-bsd

include ../../meta-pkgs/hpp/Makefile.common

# old package name and other Python / Qt versions
CONFLICTS=		gepetto-viewer-[0-9]*
CONFLICTS+=		py[0-9][0-9]-qt[0-9]-gepetto-viewer-[0-9]*

CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes
CMAKE_ARGS+=\
  -DPROJECT_USE_QT4=$(if $(filter qt4,${PKG_ALTERNATIVE.qt}),ON,OFF)

DEPEND_ABI.openthreads+= openthreads>=2
DEPEND_ABI.openscenegraph+= openscenegraph>=3.2

include ../../graphics/urdfdom-headers/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../mk/sysdep/openscenegraph.mk
include ../../mk/sysdep/openthreads.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/qt.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/robotpkg.mk
