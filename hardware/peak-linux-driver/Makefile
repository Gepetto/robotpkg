# robotpkg Makefile for:	hardware/peak-linux-driver
# Created:			Matthieu Herrb on Wed, 31 Dec 2008
#

PKGREVISION=	1
DISTNAME=	peak-linux-driver-${VERSION}
VERSION=	7.6
CATEGORIES=	hardware
MASTER_SITES=	http://www.peak-system.com/fileadmin/media/linux/files/
HOMEPAGE=	http://www.peak-system.com/fileadmin/media/linux/
MAINTAINER=	openrobots@laas.fr
COMMENT=	Software Interface for PEAK-System CAN-Hardware.

LICENSE=	gnu-gpl-v3

ONLY_FOR_PLATFORM=	Linux-%
MAKE_JOBS_SAFE=		no
NO_CONFIGURE=		yes

INSTALLATION_DIRS=\
	bin		\
	include		\
	lib/pkgconfig

post-install:	${WRKSRC}/pcan.pc
	${INSTALL_DATA} ${WRKSRC}/pcan.pc ${PREFIX}/lib/pkgconfig
	${INSTALL_DATA} ${WRKSRC}/driver/pcan.h ${PREFIX}/include/

BUILD_MAKE_FLAGS=	NET=NO_NETDEV_SUPPORT PCC=NO_PCCARD_SUPPORT

${WRKSRC}/pcan.pc:
	@${SED} -e 's|@prefix@|${PREFIX}|' \
		-e 's|@libdir@|${PREFIX}/lib|' \
		-e 's|@includedir@|${PREFIX}/include|' \
		-e 's|@PACKAGE_VERSION@|${VERSION}|' \
		< ${FILESDIR}/pcan.pc.in > ${WRKSRC}/pcan.pc

include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/popt.mk
include ../../mk/sysdep/kernel.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
