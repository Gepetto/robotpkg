#
# Copyright (C) 2008-2009 LAAS/CNRS
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
# From $NetBSD: Makefile,v 1.24 2008/03/29 14:41:01 joerg Exp $
#
#                                             Anthony Mallet on Fri Apr 18 2008

DISTNAME=	libarchive-2.5.5
CATEGORIES=	archivers
MASTER_SITES=	http://people.freebsd.org/~kientzle/libarchive/src/
DISTFILES=	# empty

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://code.google.com/p/libarchive/
COMMENT=	Library to read/create different archive formats

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
