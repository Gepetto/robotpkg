# robotpkg Makefile for:	graphics/py-qt-hpp-gui
# Created:			Guilhem Saurel on Tue, 26 Feb 2019
#

PKGNAME=	${PKGTAG.python-}${PKGTAG.qt-}${DISTNAME}
PKGREVISION=	1

HPP_PACKAGE=	hpp-gui
HPP_COMMENT=	Graphical interface for HPP

CATEGORIES=		graphics
CONFLICTS+=		qt[0-9]-hpp-gui-[0-9]*

PYTHON_NOTAG_CONFLICT=	yes

DYNAMIC_PLIST_DIRS+=	etc/gepetto-gui/pyplugin.conf.d

include ../../meta-pkgs/hpp/Makefile.common

CMAKE_ARGS+=\
  -DUSE_QT4=$(if $(filter qt4,${PKG_ALTERNATIVE.qt}),TRUE,FALSE)

# Qt4 requires qmake
include ../../mk/sysdep/qt.mk
define PKG_ALTERNATIVE_SET.qt4 +=

  include ../../mk/sysdep/qmake.mk
  CMAKE_ARGS+=		-DQT_QMAKE_EXECUTABLE=${QMAKE}
endef

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../graphics/py-qt-gepetto-viewer-corba/depend.mk
include ../../path/py-hpp-corbaserver/depend.mk
include ../../path/py-hpp-manipulation-corba/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/robotpkg.mk
