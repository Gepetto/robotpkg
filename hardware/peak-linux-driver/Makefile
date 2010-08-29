# robotpkg Makefile for:	hardware/peak-linux-driver
# Created:			Matthieu Herrb on Wed, 31 Dec 2008
#

DISTNAME=	peak-linux-driver.${VERSION}
PKGNAME=	peak-linux-driver-${VERSION}
VERSION=	6.20
CATEGORIES=	hardware
MASTER_SITES=	http://www.peak-system.com/fileadmin/media/linux/files/
HOMEPAGE=	http://www.peak-system.com/fileadmin/media/linux/
MAINTAINER=	openrobots@laas.fr
COMMENT=	Software Interface for PEAK-System CAN-Hardware.

LICENSE=	gnu-gpl-v3

WRKSRC=		${WRKDIR}/${PKGNAME}

post-install:	${WRKSRC}/pcan.pc
	${INSTALL_DATA} ${WRKSRC}/pcan.pc ${PREFIX}/lib/pkgconfig

BUILD_MAKE_FLAGS=	NET=NO_NETDEV_SUPPORT

${WRKSRC}/pcan.pc:
	@${SED} -e 's|@prefix@|${PREFIX}|' \
		-e 's|@libdir@|${PREFIX}/lib|' \
		-e 's|@includedir@|${PREFIX}/include|' \
		-e 's|@PACKAGE_VERSION@|${VERSION}|' \
		< ${FILESDIR}/pcan.pc.in > ${WRKSRC}/pcan.pc

include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk
