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
CONFIGURE_ARGS+= --with-boost-thread=${SYSTEM_FILES.boost-lib-thread}
CONFIGURE_ARGS+= --with-boost-signals=${SYSTEM_FILES.boost-lib-signals}

# unfortunately, the configure script does not check for the required
# boost_system library
LIBRARY_DIRS.boost-lib-system=	$(dir ${SYSTEM_FILES.boost-lib-system})
RPATH_DIRS.boost-lib-system=	$(dir ${SYSTEM_FILES.boost-lib-system})
LDFLAGS+=	-lboost_system${BOOST_LIB_SUFFIX}

INCLUDE_DIRS.libjpeg=	include
LIBRARY_DIRS.libjpeg=	lib
RPATH_DIRS.libjpeg=	lib

include ../../archivers/zlib/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
