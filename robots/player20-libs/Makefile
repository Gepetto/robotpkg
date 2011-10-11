# robotpkg Makefile for:	robots/player20-libs
# Created:			Matthieu Herrb on Fri, 20 Nov 2009
#
V=2.0.5
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
USE_LANGUAGES=	c c++

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-alldrivers --disable-jplayer  --disable-libplayerc-py
CONFIGURE_ARGS+= have_python=no have_swig=no

INCLUDE_DIRS.libjpeg=	include
LIBRARY_DIRS.libjpeg=	lib
RPATH_DIRS.libjpeg=	lib

include ../../pkgtools/pkg-config/depend.mk
include ../../archivers/zlib/depend.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/robotpkg.mk
