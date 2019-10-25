# robotpkg Makefile for:	graphics/qt-hpp-gui
# Created:			Guilhem Saurel on Tue, 26 Feb 2019
#

PKGNAME=	${PKGTAG.python-}${PKGTAG.qt-}${DISTNAME}

HPP_PACKAGE=	hpp-gui
HPP_COMMENT=	Graphical interface for HPP
PKGREVISION=	1

CATEGORIES=		graphics
CONFLICTS+=		qt[0-9]-hpp-gui-[0-9]*

USE_PYTHON=		true

DYNAMIC_PLIST_DIRS+=	etc/gepetto-gui/pyplugin.conf.d

include ../../meta-pkgs/hpp/Makefile.common

CMAKE_ARGS+=\
  -DUSE_QT4=$(if $(filter qt4,${PKG_ALTERNATIVE.qt}),TRUE,FALSE)

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../graphics/gepetto-viewer-corba/depend.mk
include ../../path/py-hpp-corbaserver/depend.mk
include ../../path/hpp-manipulation-corba/depend.mk
include ../../mk/sysdep/qt.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
