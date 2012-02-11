# robotpkg Makefile for:	pkgtools/digest
# Created:			Anthony Mallet on Wed, 2 May 2007
#

DISTNAME?=	digest-${VERSION}
CATEGORIES=	pkgtools
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.NetBSD.org/Documentation/software/packages.html
COMMENT=	Message digest wrapper utility
LICENSE=	original-bsd

NO_CHECKSUM=	yes
NOT_FOR_PLATFORM=# empty

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--bindir=${PREFIX}/sbin
CONFIGURE_ARGS+=	--program-transform-name='s/^/robotpkg_/'

LIBRARY_DIRS.bzip2+=	lib
RPATH_DIRS.bzip2+=	lib
LIBRARY_DIRS.zlib+=	lib
RPATH_DIRS.zlib+=	lib

include ../../mk/robotpkg.prefs.mk

VERSION:=	$(shell	${AWK} -F "'" '/^PACKAGE_VERSION=/ {print $$2}' \
			${CURDIR}/dist/configure)

BZIP2_STYLE=		inplace
LIBARCHIVE_STYLE=	inplace
ZLIB_STYLE=		inplace
include ../../archivers/bzip2/depend.mk
include ../../archivers/libarchive/depend.mk
include ../../archivers/zlib/depend.mk
include ../../mk/robotpkg.mk

do-extract:
	@${CP} -Rp ${CURDIR}/dist ${WRKSRC}

do-test:
	@${ECHO} "No news is good news"
	@cd ${WRKSRC} && ${SETENV} DIGESTDIR=${WRKSRC} ${SH} ./regress.sh
	@${ECHO} "All tests completed"
