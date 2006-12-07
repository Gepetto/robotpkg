# $NetBSD: Makefile,v 1.13 2006/07/14 20:11:10 jlam Exp $
#
# This version of pax installs into ${PKG_TOOLS_BIN}.
#
DISTNAME=		pax-20060202
CATEGORIES=     	pkgtools
MASTER_SITES=		# empty
DISTFILES=		# empty

MAINTAINER=		grant@NetBSD.org
HOMEPAGE=		http://www.NetBSD.org/
COMMENT=		POSIX standard archiver with many extensions

GNU_CONFIGURE=		yes

NO_CHECKSUM=		yes
NO_PKGTOOLS_REQD_CHECK= yes
PKG_PRESERVE=           yes

include ../../mk/robotpkg.mk

do-extract:
	${CP} -R ${FILESDIR} ${WRKSRC}

include ../../pkgtools/libnbcompat/inplace.mk
