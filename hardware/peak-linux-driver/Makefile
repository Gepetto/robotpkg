#
# Copyright (c) 2008 CNRS/LAAS
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#

DISTNAME=	peak-linux-driver.${VERSION}
PKGNAME=	peak-linux-driver-${VERSION}
VERSION=	6.7
CATEGORIES=	hardware
MASTER_SITES=	http://www.peak-system.com/fileadmin/media/linux/files/
HOMEPAGE=	http://www.peak-system.com/fileadmin/media/linux/
MAINTAINER=	openrobots@laas.fr
COMMENT=	Software Interface for PEAK-System CAN-Hardware.

WRKSRC=		${WRKDIR}/${PKGNAME}

post-install:	${WRKSRC}/pcan.pc
	${INSTALL_DATA} ${WRKSRC}/pcan.pc ${ROBOTPKG_BASE}/lib/pkgconfig

BUILD_MAKE_FLAGS=	NET=NO_NETDEV_SUPPORT

${WRKSRC}/pcan.pc:
	@${SED} -e 's|@prefix@|${ROBOTPKG_BASE}|' \
		-e 's|@libdir@|${ROBOTPKG_BASE}/lib|' \
		-e 's|@includedir@|${ROBOTPKG_BASE}/include|' \
		-e 's|@PACKAGE_VERSION@|${VERSION}|' \
		< ${FILESDIR}/pcan.pc.in > ${WRKSRC}/pcan.pc

include ../../mk/robotpkg.mk
