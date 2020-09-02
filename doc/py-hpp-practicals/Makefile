# robotpkg Makefile for:	doc/py-hpp-practicals
# Created:			Florent Lamiraux on Wed, 29 May 2019
#

HPP_PACKAGE=		hpp_practicals
HPP_COMMENT=		Practicals for hpp software
PKGREVISION=		1

PKGNAME=		${PKGTAG.python-}${PKGTAG.qt-}${DISTNAME}

CATEGORIES=		doc

PYTHON_NOTAG_CONFLICT=	yes

include ../../meta-pkgs/hpp/Makefile.common

include ../../graphics/py-qt-hpp-gepetto-viewer/depend.mk
include ../../graphics/py-qt-hpp-gui/depend.mk
include ../../graphics/py-qt-hpp-plot/depend.mk
include ../../path/py-hpp-manipulation-corba/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/robotpkg.mk
