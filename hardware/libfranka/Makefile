# robotpkg Makefile for:	hardware/libfranka
# Created:			Anthony Mallet on Fri,  6 Dec 2024
#

VERSION=	0.14.2
DISTNAME=	libfranka-${VERSION}
GITHUB_TAG=	${VERSION}
MASTER_SITES=	${MASTER_SITE_GITHUB:=frankaemika/}
DISTFILES=	${GITHUB_DISTFILE} ${SUBMODULE}.tar.gz

CATEGORIES=	hardware
COMMENT=	Low-level control of Franka Robotics research robots
LICENSE=	apache-2.0
MAINTAINER=	openrobots@laas.fr

CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=lib
CMAKE_ARGS+=	-DBUILD_TESTS=OFF
CMAKE_ARGS+=	-DBUILD_EXAMPLES=ON

# Extra distfile matching the git submodule not exported in distfile
SUBMODULE_VERSION=	1.0.2
SUBMODULE=		libfranka-common-${SUBMODULE_VERSION}
SITES.${SUBMODULE}.tar.gz?=\
  -${MASTER_SITES:=libfranka-common/archive/${SUBMODULE_VERSION}.tar.gz}

#  documentation
PKG_SUGGESTED_OPTIONS+=	doc
PKG_SUPPORTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc=	Enable documentation generation and installation
define PKG_OPTION_SET.doc
  CMAKE_ARGS+=		-DBUILD_DOCUMENTATION=ON
  DYNAMIC_PLIST_DIRS+=	share/doc/${PKGBASE}/html

  include ../../mk/sysdep/doxygen.mk
endef

include ../../math/eigen3/depend.mk
include ../../math/pinocchio/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/poco.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

# link missing submodule from distfile to its sources
post-extract:
	${RUN}${RMDIR} ${WRKSRC}/common && \
	  ${LN} -sf ${WRKDIR}/libfranka-common-1.0.2 ${WRKSRC}/common
