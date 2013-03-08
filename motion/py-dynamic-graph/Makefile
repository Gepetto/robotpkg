# robotpkg Makefile for:	motion/dynamic-graph-python
# Created:			Florent Lamiraux on Thu, 7 Jul 2011
#

VERSION=		2.5.3
PKGREVISION=		1
DISTNAME=		dynamic-graph-python-${VERSION}
PKGNAME=		${PKGTAG.python-}dynamic-graph-${VERSION}
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=dynamic-graph-python/}
MASTER_REPOSITORY=\
	${MASTER_REPOSITORY_GITHUB}/jrl-umi3218/dynamic-graph-python

MAINTAINER=	gepetto@laas.fr
CATEGORIES=	motion
LICENSE=	gnu-lgpl-v3
COMMENT=	Python bindings for motion/dynamic-graph package

CONFLICTS+=		py-dynamic-graph-[0-9]*
CONFLICTS+=		py[0-9][0-9]-dynamic-graph-[0-9]*
DYNAMIC_PLIST_DIRS+=	share/doc/dynamic-graph-python

CMAKE_ARGS+=		-DPYTHON_EXECUTABLE=${PYTHON}
CMAKE_ARGS+=		-DPYTHON_INCLUDE_DIR=${PYTHON_INCLUDE}
CMAKE_ARGS+=		-DPYTHON_LIBRARY=${PYTHON_LIB}
CMAKE_ARGS+=		-DPYTHON_SITELIB=${PYTHON_SITELIB}

# disable -Werror, some warnings from boost-filesystem (1.50, netbsd) cannot be
# fixed here
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

DEPEND_ABI.python+=	python<3

include ../../motion/dynamic-graph/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/py-sphinx.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
