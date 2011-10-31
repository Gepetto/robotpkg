# robotpkg Makefile for:	motion/dynamic-graph-python
# Created:			Florent Lamiraux on Thu, 7 Jul 2011
#

VERSION=		2.5
PKGREVISION=		3
DISTNAME=		dynamic-graph-python-${VERSION}
PKGNAME=		${PKGTAG.python-}dynamic-graph-${VERSION}
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=dynamic-graph-python/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB_JRL}dynamic-graph-python

MAINTAINER=	gepetto@laas.fr
CATEGORIES=	motion
LICENSE=	gnu-lgpl-v3
COMMENT=	Python bindings for motion/dynamic-graph package

CONFLICTS+=		py-dynamic-graph-[0-9]*
CONFLICTS+=		py[0-9][0-9]-dynamic-graph-[0-9]*
USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/dynamic-graph-python

CMAKE_ARGS+=		-DPYTHON_SITELIB=${PYTHON_SITELIB}
CPPFLAGS+=		-DBOOST_FILESYSTEM_VERSION=2

include ../../mk/robotpkg.prefs.mk # MACHINE_ARCH
ifeq (x86_64,${MACHINE_ARCH})
  # disable -Werror on x86_64: too many warnings, must be fixed upstream
  CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes
endif

include ../../motion/dynamic-graph/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/py-sphinx.mk
include ../../mk/robotpkg.mk

post-install: python-compile-all(${PREFIX}/${PYTHON_SITELIB}/dynamic_graph)
