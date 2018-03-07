# robotpkg Makefile for:	scripts/py-sot-application
# Created:			Aurélie Clodic on Wed, 11 Jun 2014
#

PKGREVISION=		3
VERSION=		1.0.0
PKGNAME=		${PKGTAG.python-}sot-application-${VERSION}
DISTNAME=		sot-application-${VERSION}
GH_REPO=		stack-of-tasks/sot-application
MASTER_SITES=\
  ${MASTER_SITE_GITHUB:=${GH_REPO}/releases/download/${VERSION}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}${GH_REPO}

CATEGORIES=		scripts
COMMENT=		Application dependent scripts for the Stack of Tasks
HOMEPAGE=		https://github.com/stack-of-tasks/sot-application
LICENSE=		gnu-lgpl-v3
MAINTAINER=		hpp@laas.fr

# this does not support multiple parallel python version
CONFLICTS+=		py[0-9][0-9]-sot-application-[0-9]*
# old package name
CONFLICTS+=		sot-application-[0-9]*

DYNAMIC_PLIST_DIRS+=	share/doc/sot-application

CMAKE_ARGS+=		-DSPHINX_BUILD=${SPHINX_BUILD}

include ../../motion/sot-dynamic/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/sysdep/py-sphinx.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
