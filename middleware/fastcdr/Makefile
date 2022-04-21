# robotpkg Makefile for:	middleware/fastcdr
# Created:			Anthony Mallet on Tue,  5 Apr 2022
#

VERSION=	1.0.24
PKGNAME=	fastcdr-${VERSION}
DISTNAME=	Fast-CDR-${VERSION}
MASTER_SITES=	${MASTER_SITE_GITHUB:=eProsima/}
GITHUB_TAG=	v${VERSION}

COMMENT=	C++ serialization library.
CATEGORIES=	middleware
MAINTAINER=	mallet@laas.fr
LICENSE=	apache-2.0

ROS2_AMENTPKG=	no
include ../../meta-pkgs/ros2-core/Makefile.common

PKG_SUPPORTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc=	Enable documentation generation and installation
define PKG_OPTION_SET.doc
  BUILD_TARGET+=	doc
  CMAKE_ARGS+=\
    -DCHECK_DOCUMENTATION=TRUE	\
    -DDOC_INSTALL_DIR=${PREFIX}/share/doc/${PKGBASE}
  DYNAMIC_PLIST_DIRS+=	share/doc/${PKGBASE}

  include ../../mk/sysdep/doxygen.mk
endef

DEPEND_ABI.cmake= cmake>=3.3

include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
