# robotpkg Makefile for:	graphics/py-qt-gepetto-viewer-corba
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#

HPP_PACKAGE=		gepetto-viewer-corba
HPP_COMMENT=		Corba server for gepetto-viewer
HPP_VERSION=		5.7.2
HPP_NAMESPACE=		gepetto
PKGREVISION=		1

PKGNAME=		${PKGTAG.python-}${PKGTAG.qt-}${DISTNAME}

CATEGORIES=		graphics
LICENSE=		2-clause-bsd

include ../../meta-pkgs/hpp/Makefile.common

CONFIGURE_DIRS=		build
CMAKE_ARG_PATH=		..

CMAKE_ARGS+=		-DOMNIIDL=${PREFIX.omniORB}/bin/omniidl
CMAKE_ARGS+=		-DPYTHON_SITELIB=${PYTHON_SITELIB}

# old package name and other Python / Qt versions
CONFLICTS=		gepetto-viewer-corba-[0-9]*
CONFLICTS+=		qt[0-9]-gepetto-viewer-corba-[0-9]*
CONFLICTS+=		py[0-9][0-9]-qt[0-9]-gepetto-viewer-corba-[0-9]*

DYNAMIC_PLIST_DIRS+=	etc/gepetto-gui

# Qt4 requires some tweaks
include ../../mk/sysdep/qt.mk
define PKG_ALTERNATIVE_SET.qt4 +=

  include ../../mk/sysdep/qmake.mk
  CMAKE_ARGS+=		-DQT_QMAKE_EXECUTABLE=${QMAKE}
endef

# Mesa headers path
INCLUDE_DIRS.mesa+=	include

include ../../graphics/openscenegraph/depend.mk
include ../../graphics/py-qt-gepetto-viewer/depend.mk
include ../../graphics/qt-osgqt/depend.mk
include ../../math/eigen3/depend.mk
include ../../middleware/omniORB/depend.mk
include ../../middleware/py-omniORBpy/depend.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

 # create the build directory
pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/build
