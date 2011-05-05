# robotpkg Makefile for:	wip/eigen3
# Created:			Nizar Sallem on Tue, 26 Apr 2011
#

V=		3.0.0
DISTNAME=	${V}
PKGNAME=	eigen3-${V}
MASTER_SITES=	https://bitbucket.org/eigen/eigen/get/
DIST_SUBDIR=	eigen3

CATEGORIES=	wip
MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://eigen.tuxfamily.org/
COMMENT=	a C++ template library for linear algebra
LICENSE=	gnu-lgpl-v3

USE_LANGUAGES=	c c++
WRKSRC=		${WRKDIR}/eigen-eigen-65ee2328342f

CONFIGURE_DIRS=		build
CMAKE_ARG_PATH=		..
CMAKE_ARGS+=		-DBUILD_TESTING=OFF
CMAKE_ARGS+=		-DEIGEN_BUILD_PKGCONFIG=ON

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  BUILD_TARGET=		doc
  post-install:		eigen3-install-doc

  DOXYGEN_PLIST_DIR+=	share/doc/${PKGBASE}
  include ../../mk/sysdep/doxygen.mk
endef
define PKG_OPTION_UNSET.doc
  NO_BUILD=		yes
endef

# create the build directory
pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/build

# install doxygen documentation
.PHONY: eigen3-install-doc
eigen3-install-doc:
	${RUN}cd ${WRKSRC}/build/doc && ${INSTALL_LOGFILTER}		\
	${PAX} -r -w -v -pm html ${DESTDIR}${PREFIX}/${DOXYGEN_PLIST_DIR}

include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
