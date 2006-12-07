# $NetBSD: Makefile,v 1.1 2006/07/14 21:41:42 jlam Exp $
#
# This version of tnftp installs into ${PKG_TOOLS_BIN}.
#

DISTNAME=		tnftp-20050625
CATEGORIES=		pkgtools
MASTER_SITES=		# empty
DISTFILES=		# empty

# distfile obtained from: ftp://ftp.NetBSD.org/pub/NetBSD/misc/tnftp

MAINTAINER=		lukem@NetBSD.org
COMMENT=		The enhanced FTP client in NetBSD

GNU_CONFIGURE=		YES

NO_CHECKSUM=		yes
NO_PKGTOOLS_REQD_CHECK=	yes
PKG_PRESERVE=		yes

include ../../mk/robotpkg.mk

do-extract:
	@${CP} -R ${FILESDIR} ${WRKSRC}
