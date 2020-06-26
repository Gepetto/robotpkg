# robotpkg Makefile for:	graphics/py-qt-hpp-plot
# Created:			Guilhem Saurel on Tue, 26 Feb 2019
#

HPP_PACKAGE=		hpp-plot
HPP_COMMENT=		Plotting tools for hpp

PKGNAME=		${PKGTAG.python-}${PKGTAG.qt-}${DISTNAME}

CATEGORIES=		graphics

PYTHON_NOTAG_CONFLICT=	yes

include ../../meta-pkgs/hpp/Makefile.common

# Qt4 requires qmake
include ../../mk/sysdep/qt.mk
define PKG_ALTERNATIVE_SET.qt4 +=

  include ../../mk/sysdep/qmake.mk
  CMAKE_ARGS+=		-DQT_QMAKE_EXECUTABLE=${QMAKE}
endef

include ../../graphics/py-qt-gepetto-viewer-corba/depend.mk
include ../../graphics/qt-qgv/depend.mk
include ../../path/py-hpp-corbaserver/depend.mk
include ../../path/py-hpp-manipulation-corba/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/robotpkg.mk
