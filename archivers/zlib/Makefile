#
# Copyright (C) 2008 LAAS/CNRS
#
# Authored by Anthony Mallet on Fri Apr 18 2008
# From $NetBSD: Makefile,v 1.40 2007/08/22 18:36:09 jlam Exp $

DISTNAME=	zlib-1.2.3
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=libpng/} \
		http://www.gzip.org/zlib/
DISTFILES=	# empty

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.zlib.net/
COMMENT=	General purpose data compression library

NO_CHECKSUM=		yes
USE_LIBTOOL=		yes

CFLAGS+=		${CPPFLAGS}

do-extract:
	${CP} -Rp ${CURDIR}/dist ${WRKSRC}

do-install:
	${LIBTOOL} --mode=install ${INSTALL_LIB} ${WRKSRC}/libz.la ${DESTDIR}${PREFIX}/lib
	${INSTALL_MAN} ${WRKSRC}/zlib.3 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man3
	${INSTALL_DATA} ${WRKSRC}/zconf.h ${DESTDIR}${PREFIX}/include
	${INSTALL_DATA} ${WRKSRC}/zlib.h ${DESTDIR}${PREFIX}/include

include ../../mk/robotpkg.mk
