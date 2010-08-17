# robotpkg Makefile for:	archivers/zlib
# Created:			Anthony Mallet on Sat, 19 Apr 2008
#

DISTNAME=	zlib-1.2.3
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=libpng/} \
		http://www.gzip.org/zlib/
DISTFILES=	# empty
LICENSE=	2-clause-bsd

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.zlib.net/
COMMENT=	General purpose data compression library

NO_CHECKSUM=		yes

CFLAGS+=		${CPPFLAGS}

do-extract:
	${CP} -Rp ${CURDIR}/dist ${WRKSRC}

do-install:
	${LIBTOOL} --mode=install ${INSTALL_LIB} ${WRKSRC}/libz.la ${DESTDIR}${PREFIX}/lib
	${INSTALL_MAN} ${WRKSRC}/zlib.3 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man3
	${INSTALL_DATA} ${WRKSRC}/zconf.h ${DESTDIR}${PREFIX}/include
	${INSTALL_DATA} ${WRKSRC}/zlib.h ${DESTDIR}${PREFIX}/include

include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk
