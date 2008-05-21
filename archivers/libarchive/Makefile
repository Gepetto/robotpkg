#
# Copyright (C) 2008 LAAS/CNRS
#
# Authored by Anthony Mallet on Fri Apr 18 2008
# From $NetBSD: Makefile,v 1.24 2008/03/29 14:41:01 joerg Exp $
#

DISTNAME=	libarchive-2.5.0b
CATEGORIES=	archivers
MASTER_SITES=	http://people.freebsd.org/~kientzle/libarchive/src/
DISTFILES=	# empty

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://people.freebsd.org/~kientzle/libarchive/
COMMENT=	Library to read/create different archive formats

NO_CHECKSUM=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--disable-bsdtar

do-extract:
	${CP} -Rp ${CURDIR}/dist ${WRKSRC}

include ../../archivers/bzip2/depend.mk
include ../../archivers/zlib/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk
