# robotpkg Makefile for:	archivers/zlib
# Created:			Anthony Mallet on Sat, 19 Apr 2008
#

DISTNAME=	zlib-1.2.3
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=libpng/} \
		http://www.gzip.org/zlib/
DISTFILES=	# empty

COMMENT=	General purpose data compression library
HOMEPAGE=	http://www.zlib.net/
LICENSE=	2-clause-bsd
MAINTAINER=	openrobots@laas.fr

NO_CHECKSUM=		yes
INSTALLATION_DIRS=	include lib ${PKGMANDIR}/man3

CFLAGS+=	${CPPFLAGS}

do-extract:
	${CP} -Rp ${CURDIR}/dist ${WRKSRC}

do-install:
	${RUN} ${LIBTOOL} --mode=install ${INSTALL_LIB}			\
		${WRKSRC}/libz.la ${DESTDIR}${PREFIX}/lib;		\
	${INSTALL_MAN} ${WRKSRC}/zlib.3					\
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man3;			\
	${INSTALL_DATA} ${WRKSRC}/zconf.h				\
		${DESTDIR}${PREFIX}/include;				\
	${INSTALL_DATA} ${WRKSRC}/zlib.h				\
		${DESTDIR}${PREFIX}/include

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk
