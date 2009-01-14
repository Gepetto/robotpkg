#
# Copyright (c) 2009 CNRS/LAAS
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

PKGNAME=	sahand-2008.1.10
DISTNAME=	sahand-linux_2008-01-10

CATEGORIES=	hardware
COMMENT=	Schunk Antropomorphic Hand Linux driver and library

MASTER_SITES=	file:///usr/local/openrobots/nonfree/hardlib/SAHand_cd/Linux/

WRKSRC=		${WRKDIR}/SAHand


do-configure:

do-build:
	(cd ${WRKSRC}/sahand_driver ; ${MAKE} default )
	(cd ${WRKSRC}/sahand_api ; sh create_sah_lib.sh)

do-install:
	(cd ${WRKSRC}/sahand_driver ; \
		${SUDO} ${INSTALL} -c sahand_driver.ko \
		/lib/modules/$(shell uname -r)/kernel/drivers/misc ; \
	 	${INSTALL} load_sahand_driver.sh ${ROBOTPKG_BASE}/bin ; \
		${INSTALL} unload_sahand_driver.sh ${ROBOTPKG_BASE}/bin )
	(cd ${WRKSRC}/sahand_api ; \
		${INSTALL} -c libsahand_api_41.a ${ROBOTPKG_BASE}/lib ; \
		${INSTALL} -c SAHandCtrlApi.h ${ROBOTPKG_BASE}/include )


include ../../mk/robotpkg.mk
