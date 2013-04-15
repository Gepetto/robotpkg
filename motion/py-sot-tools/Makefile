# robotpkg Makefile for:	motion/py-sot-tools
# Created:			Olivier Stasse on Mon, 15 Apr 2013
#

VERSION=		1.0.0
DISTNAME=		sot-tools-${VERSION}
PKGNAME=		${PKGTAG.python-}sot-tools-${VERSION}

MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=sot-tools/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}/laas/sot-tools

MAINTAINER=		gepetto@laas.fr
CATEGORIES=		motion
LICENSE=		gnu-lgpl-v3
COMMENT=		Python tools for motion/sot-core package

CONFLICTS+=		py[0-9][0-9]-sot-tools-[0-9]*
DYNAMIC_PLIST_DIRS+=	share/doc/sot-tools

CMAKE_ARGS+=		-DPYTHON_EXECUTABLE=${PYTHON}
CMAKE_ARGS+=		-DPYTHON_INCLUDE_DIR=${PYTHON_INCLUDE}
CMAKE_ARGS+=		-DPYTHON_LIBRARY=${PYTHON_LIB}
CMAKE_ARGS+=		-DPYTHON_SITELIB=${PYTHON_SITELIB}

CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib

# disable -Werror, some warnings from boost-filesystem (1.50, netbsd) cannot be
# fixed here
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

DEPEND_ABI.python+=	python<3

include ../../motion/sot-core/depend.mk
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
