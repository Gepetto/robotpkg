DISTNAME=	velodyne-libs-0.3
PKGREVISION=	1
CATEGORIES=	hardware

MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=velodyne/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/velodyne-libs
MAINTAINER=	openrobots@laas.fr
COMMENT=	interface library for the Velodyne Lidar sensor

LICENSE=	isc

GNU_CONFIGURE=	yes

pre-configure:	autoreconf

include ../../devel/pocolibs/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/libpcap.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/robotpkg.mk
