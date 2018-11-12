# robotpkg Makefile for:	graphics/gepetto-viewer-corba
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#

HPP_PACKAGE=		gepetto-viewer-corba
HPP_COMMENT=		Corba server for gepetto-viewer
HPP_VERSION=		5.0.0
HPP_NAMESPACE=		gepetto
PKGNAME=		${PKGTAG.qt-}${DISTNAME}

CATEGORIES=		graphics
LICENSE=		2-clause-bsd

include ../../meta-pkgs/hpp/Makefile.common

# old package name and other Qt versions
CONFLICTS=		gepetto-viewer-corba-[0-9]*
CONFLICTS+=		qt[0-9]-gepetto-viewer-corba-[0-9]*

CMAKE_ARGS+=\
  -DUSE_QT4=$(if $(filter qt4,${PKG_ALTERNATIVES.qt}),TRUE,FALSE)
DEPEND_ABI.python=	python<3

include ../../graphics/gepetto-viewer/depend.mk
include ../../math/eigen3/depend.mk
include ../../middleware/omniORB/depend.mk
include ../../middleware/omniORBpy/depend.mk
include ../../mk/sysdep/openscenegraph.mk
include ../../mk/sysdep/openscenegraph-qt.mk
include ../../mk/sysdep/openthreads.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/qt.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/robotpkg.mk
