# robotpkg Makefile for:	graphics/py-qt-hpp-gepetto-viewer
# Created:			Florent Lamiraux on Mon, 9 Mar 2015
#

HPP_PACKAGE=		hpp-gepetto-viewer
HPP_VERSION=		4.10.1
PKGNAME=		${PKGTAG.python-}${PKGTAG.qt-}${DISTNAME}

CATEGORIES=		graphics
HPP_COMMENT=		Bridge between hpp-corbaserver and gepetto-viewer-corba

include ../../meta-pkgs/hpp/Makefile.common

CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

# old package name and other Python / Qt versions
CONFLICTS=		hpp-gepetto-viewer-[0-9]*
CONFLICTS+=		py[0-9][0-9]-qt[0-9]-hpp-gepetto-viewer-[0-9]*

DYNAMIC_PLIST_DIRS+=	etc/gepetto-gui

CMAKE_ARGS+=\
  -DUSE_QT4=$(if $(filter qt4,${PKG_ALTERNATIVE.qt}),TRUE,FALSE)

include ../../graphics/py-qt-gepetto-viewer-corba/depend.mk
include ../../mapping/octomap/depend.mk
include ../../path/py-hpp-corbaserver/depend.mk
include ../../path/hpp-util/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/qt.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
