# robotpkg Makefile for:	robots/player20-libs
# Created:			Matthieu Herrb on Fri, 20 Nov 2009
#
V=2.0.5
PKGREVISION=	2
PKGNAME=	player20-libs-${V}
DISTNAME=	player-${V}
EXTRACT_SUFX=	.tar.bz2
CATEGORIES=	robots
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=playerstage/}

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://playerstage.sourceforge.net/index.php?src=player
COMMENT=	Cross-platform robot device interface & server
LICENSE=	gnu-gpl-v2

MAKE_JOBS_SAFE=	no
USE_BOOST_LIBS=	thread signals system

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-alldrivers --disable-jplayer  --disable-libplayerc-py
CONFIGURE_ARGS+= have_python=no have_swig=no
CONFIGURE_ARGS+=\
  --with-boost-thread=$(lastword ${SYSTEM_FILES.boost-lib-thread})	\
  --with-boost-signals=$(lastword ${SYSTEM_FILES.boost-lib-signals})

# unfortunately, the configure script does not check for the required
# boost_system library
LIBRARY_DIRS.boost-lib-system=	$(dir ${SYSTEM_FILES.boost-lib-system})
RPATH_DIRS.boost-lib-system=	$(dir ${SYSTEM_FILES.boost-lib-system})
LDFLAGS+=	-lboost_system${BOOST_LIB_SUFFIX}

INCLUDE_DIRS.libjpeg=	include
LIBRARY_DIRS.libjpeg=	lib
RPATH_DIRS.libjpeg=	lib

# If libtirpc rpc alternative is used
INCLUDE_DIRS.libtirpc=	include/tirpc
LIBRARY_DIRS.libtirpc=	lib
RPATH_DIRS.libtirpc=	lib
LDFLAGS+= $(if $(filter libtirpc,${PKG_ALTERNATIVE.rpc}),-ltirpc)

include ../../archivers/zlib/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/language/rpc.mk
include ../../mk/robotpkg.mk
