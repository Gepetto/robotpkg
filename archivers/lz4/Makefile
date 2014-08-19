# robotpkg Makefile for:	archivers/lz4
# Created:			Anthony Mallet on Mon, 18 Aug 2014
#

PKGREVISION=	1
VERSION=	121
DISTNAME=	lz4-r${VERSION}
PKGNAME=	lz4-${VERSION}
DISTFILES=	r${VERSION}${EXTRACT_SUFX}
DIST_SUBDIR=	lz4
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_GITHUB:=Cyan4973/lz4/archive/}

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://code.google.com/p/lz4/
COMMENT=	Extremely Fast Compression algorithm
LICENSE=	2-clause-bsd

INSTALLATION_DIRS=bin include lib/pkgconfig ${PKGMANDIR}/man1

include ../../pkgtools/install-sh/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
