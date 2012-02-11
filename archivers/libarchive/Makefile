# robotpkg Makefile for:	archivers/libarchive
# Created:			Anthony Mallet on Sat, 19 Apr 2008
#

DISTNAME=	libarchive-2.8.4
CATEGORIES=	archivers
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://code.google.com/p/libarchive/
COMMENT=	Library to read/create different archive formats
LICENSE=	2-clause-bsd

NO_CHECKSUM=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--disable-dependency-tracking
CONFIGURE_ARGS+=--disable-bsdtar
CONFIGURE_ARGS+=--disable-bsdcpio
CONFIGURE_ARGS+=--without-expat
CONFIGURE_ARGS+=--without-xml2

do-extract:
	${CP} -Rp ${CURDIR}/dist ${WRKSRC}

BZIP2_STYLE=		inplace
ZLIB_STYLE=		inplace
include ../../archivers/bzip2/depend.mk
include ../../archivers/zlib/depend.mk
include ../../mk/robotpkg.mk
