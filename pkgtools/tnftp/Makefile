# robotpkg Makefile for:	pkgtools/tnftp
# Created:			Anthony Mallet on Thu, 7 Dec 2006
#

#
# This version of tnftp installs into ${PKG_TOOLS_BIN} as robotpkg_ftp.
#

DISTNAME=		tnftp-20091122
CATEGORIES=		pkgtools

MASTER_SITES=		# empty
DISTFILES=		# empty

# NetBSD distfile obtained from: ftp://ftp.NetBSD.org/pub/NetBSD/misc/tnftp

MAINTAINER=		openrobot@laas.fr
COMMENT=		The enhanced FTP client in NetBSD
LICENSE=		2-clause-bsd

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--bindir=${PKG_TOOLS_BIN}

NOT_FOR_PLATFORM=	# empty
NO_CHECKSUM=		yes
NO_PKGTOOLS_REQD_CHECK=	yes
PKG_PRESERVE=		yes

include ../../mk/sysdep/termcap.mk
include ../../mk/robotpkg.mk

do-extract:
	@${CP} -Rp ${CURDIR}/dist ${WRKSRC}
