# robotpkg Makefile for:	archivers/libarchive
# Created:			Anthony Mallet on Sat, 19 Apr 2008
#

DISTNAME=	libarchive-2.5.5
CATEGORIES=	archivers
MASTER_SITES=	http://people.freebsd.org/~kientzle/libarchive/src/
DISTFILES=	# empty

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://code.google.com/p/libarchive/
COMMENT=	Library to read/create different archive formats
LICENSE=	2-clause-bsd

NO_CHECKSUM=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--disable-bsdtar
CONFIGURE_ARGS+=--disable-dependency-tracking

CONFIGURE_LOG_ETA=	300
BUILD_LOG_ETA=		170
INSTALL_LOG_ETA=	50

do-extract:
	${CP} -Rp ${CURDIR}/dist ${WRKSRC}

include ../../archivers/bzip2/depend.mk
include ../../archivers/zlib/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk
