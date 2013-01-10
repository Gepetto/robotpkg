# robotpkg Makefile for:	archivers/bzip2
# Created:			Anthony Mallet on Thu, 17 May 2007
#

DISTNAME=	bzip2-1.0.5
CATEGORIES=	archivers
MASTER_SITES=	http://www.bzip.org/1.0.5/
DISTFILES=	# empty

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.bzip.org/
COMMENT=	Block-sorting file compressor
LICENSE=	modified-bsd

MAKE_JOBS_SAFE=		no
NO_CHECKSUM=		yes
INSTALLATION_DIRS=	bin include lib ${PKGMANDIR}/man1

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

do-extract:
	${CP} -Rp ${CURDIR}/dist ${WRKSRC}

do-install:
	${RUN} ${LIBTOOL} --mode=install ${INSTALL_LIB}			\
		${WRKSRC}/libbz2.la ${DESTDIR}${PREFIX}/lib;		\
	${LIBTOOL} --mode=install ${INSTALL_PROGRAM}			\
		${WRKSRC}/bzip2 ${DESTDIR}${PREFIX}/bin;		\
	${LN} -f ${DESTDIR}${PREFIX}/bin/bzip2				\
		${DESTDIR}${PREFIX}/bin/bunzip2;			\
	${LN} -f ${DESTDIR}${PREFIX}/bin/bzip2				\
		${DESTDIR}${PREFIX}/bin/bzcat;				\
	${LIBTOOL} --mode=install ${INSTALL_PROGRAM}			\
		${WRKSRC}/bzip2recover ${DESTDIR}${PREFIX}/bin;		\
	${INSTALL_MAN} ${WRKSRC}/bzip2.1				\
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man1;			\
	cd ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1 &&			\
		${RM} -f bunzip2.1 bzcat.1 bzip2recover.1;		\
	${LN} -s bzip2.1						\
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/bunzip2.1;	\
	${LN} -s bzip2.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/bzcat.1;	\
	${LN} -s bzip2.1						\
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/bzip2recover.1;	\
	${INSTALL_DATA} ${WRKSRC}/bzlib.h ${DESTDIR}${PREFIX}/include
