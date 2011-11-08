# robotpkg Makefile for:	hardware/velodyne-libs
# Created:			Matthieu Herrb on Fri, 25 Jun 2010
#
DISTNAME=	velodyne-libs-0.4
CATEGORIES=	hardware

MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=velodyne/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/velodyne-libs
MAINTAINER=	openrobots@laas.fr
COMMENT=	interface library for the Velodyne Lidar sensor

LICENSE=	isc

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-tclsh=${TCLSH}

pre-configure:	autoreconf

DEPEND_METHOD.tcl=	build
DEPEND_METHOD.tdom=	build

INCLUDE_DIRS.libpcap=	include
LIBRARY_DIRS.libpcap=	lib
RPATH_DIRS.libpcap=	lib

include ../../middleware/pocolibs/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/tdom.mk
include ../../mk/sysdep/libpcap.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/robotpkg.mk
