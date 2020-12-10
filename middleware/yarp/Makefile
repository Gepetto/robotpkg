# robotpkg Makefile for:	middleware/yarp
# Created:			Anthony Mallet on Thu, 22 Jan 2009
#

VERSION=	3.4.1
PKGNAME=	yarp-${VERSION}
DISTNAME=	v${VERSION}
CATEGORIES=	middleware
MASTER_SITES=	https://github.com/robotology/yarp/archive/
DIST_SUBDIR=	${PKGBASE}

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	https://www.yarp.it/
COMMENT=	Yet Another Robot Platform
LICENSE=	modified-bsd

WRKSRC=		${WRKDIR}/yarp-${VERSION}

CMAKE_ARGS+=	-DYARP_COMPILE_GUIS=FALSE

CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_GStreamer=TRUE
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_GStreamerPluginsBase=TRUE
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_Libedit=TRUE
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_MPI=TRUE

CMAKE_ARGS+=	-DTinyXML_INCLUDE_DIRS=${PREFIX.tinyxml}/include
CMAKE_ARGS+=	-DTinyXML_LIBRARIES=$(filter %.so,${SYSTEM_FILES.tinyxml})

CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=lib

DEPEND_ABI.cmake=	cmake>=3.12

include ../../devel/tinyxml/depend.mk
include ../../devel/ycm/depend.mk
include ../../image/opencv/depend.mk
include ../../math/eigen3/depend.mk
include ../../middleware/ace/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/glib2.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/sysdep/sqlite3.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
