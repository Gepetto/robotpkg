# robotpkg Makefile for:	optimization/qpOASES
# Created:			Rohan Budhiraja on Fri, 8 Apr 2016
#

PKGREVISION=	1
VERSION=	3.2.1
PKGNAME=	qpoases-${VERSION}
DISTNAME=	qpOASES-${VERSION}
EXTRACT_SUFX=	.zip

CATEGORIES=	optimization
MASTER_SITES=	https://www.coin-or.org/download/source/qpOASES/

HOMEPAGE=	https://projects.coin-or.org/qpOASES
COMMENT=	C++ implementation of the online active set strategy
LICENSE=	gnu-lgpl-v2.1
MAINTAINER=	gepetto@laas.fr

WRKSRC=		${WRKDIR}/qpOASES-${VERSION}

CMAKE_ARGS+=	-DQPOASES_BUILD_EXAMPLES=OFF
CMAKE_ARGS+=	'-DLAPACK_LIB=${LAPACK_LIB}'
CMAKE_ARGS+=	'-DBLAS_LIB=${BLAS_LIB}'

# option for doxygen documentation
PKG_SUGGESTED_OPTIONS+=		doc
PKG_SUPPORTED_OPTIONS+=		doc
PKG_OPTION_DESCR.doc=		Enable documentation generation
define PKG_OPTION_SET.doc
  DYNAMIC_PLIST_DIRS=	share/doc/qpOASES/html
  INSTALLATION_DIRS+=	${DYNAMIC_PLIST_DIRS}

  post-build: generate-doc
  post-install: install-doc

  include ../../archivers/pax/depend.mk
  include ../../mk/sysdep/doxygen.mk
endef

include ../../math/lapack/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

# Remove DoxygenLayout.xml, this makes doxygen-1.7.5.1 reliably segfault
.PHONY: generate-doc
generate-doc:
	${RUN}${RM} -f ${WRKSRC}/doc/DoxygenLayout.xml
	${RUN}cd ${WRKSRC}/doc && ${DOXYGEN} doxygen.config

.PHONY: install-doc
install-doc:
	${RUN}cd ${WRKSRC}/doc/html &&				\
	  ${PAX} -rwp ma . ${PREFIX}/${DYNAMIC_PLIST_DIRS};
	${RUN}cd ${WRKSRC}/doc &&				\
	  ${PAX} -rwp ma manual.pdf ${PREFIX}/share/doc/qpOASES/
