# robotpkg Makefile for:	middleware/fastrtps
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

VERSION=	2.6.0
PKGNAME=	fastrtps-${VERSION}
DISTNAME=	Fast-DDS-${VERSION}
MASTER_SITES=	${MASTER_SITE_GITHUB:=eProsima/}
GITHUB_TAG=	v${VERSION}

COMMENT=	Implementation of the Data Distribution Service (DDS) standard.
CATEGORIES=	middleware

ROS2_AMENTPKG=	no
include ../../meta-pkgs/ros2-core/Makefile.common

CMAKE_ARGS+=	-DTHIRDPARTY_UPDATE=OFF
CMAKE_ARGS+=	-DTHIRDPARTY_Asio=OFF
CMAKE_ARGS+=	-DTHIRDPARTY_TinyXML2=OFF

SUBST_CLASSES+=	py-interp
SUBST_FILES.py_interp=\
  tools/fastdds/fastdds		\
  tools/fastdds/ros-discovery

PYTHON_PLIST_COMPILE_PATTERN=\
  /libexec[\/].*[.]py$$/

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

DEPEND_ABI.python+= python>=3.6

include ../../devel/foonathan-memory/depend.mk
include ../../middleware/fastcdr/depend.mk
include ../../mk/sysdep/asio.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/openssl.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/tinyxml2.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
