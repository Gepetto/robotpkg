#
# Copyright (c) 2007-2008,2010 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
# From $NetBSD: Makefile,v 1.47 2008/03/26 19:06:06 adrianp Exp $
#
#                                            Anthony Mallet on Thu May 17 2007

DISTNAME=	bzip2-1.0.5
CATEGORIES=	archivers
MASTER_SITES=	http://www.bzip.org/1.0.5/

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.bzip.org/
COMMENT=	Block-sorting file compressor
LICENSE=	modified-bsd

DISTFILES=	# empty

NO_CHECKSUM=	yes

include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk

do-extract:
	${CP} -Rp ${CURDIR}/dist ${WRKSRC}

do-install:
	${LIBTOOL} --mode=install ${INSTALL_LIB} \
		${WRKSRC}/libbz2.la ${DESTDIR}${PREFIX}/lib
	${LIBTOOL} --mode=install ${INSTALL_PROGRAM} \
		${WRKSRC}/bzip2 ${DESTDIR}${PREFIX}/bin
	${LN} -f ${DESTDIR}${PREFIX}/bin/bzip2 ${DESTDIR}${PREFIX}/bin/bunzip2
	${LN} -f ${DESTDIR}${PREFIX}/bin/bzip2 ${DESTDIR}${PREFIX}/bin/bzcat
	${LIBTOOL} --mode=install ${INSTALL_PROGRAM} \
		${WRKSRC}/bzip2recover ${DESTDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/bzip2.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	cd ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1 && \
		rm -f bunzip2.1 bzcat.1 bzip2recover.1
	${LN} -s bzip2.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/bunzip2.1
	${LN} -s bzip2.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/bzcat.1
	${LN} -s bzip2.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/bzip2recover.1
	${INSTALL_DATA} ${WRKSRC}/bzlib.h ${DESTDIR}${PREFIX}/include
