# robotpkg Makefile for:	pkgtools/tnftp
# Created:			Anthony Mallet on Thu, 7 Dec 2006
#

#
# This version of tnftp installs into ${PREFIX/sbin} as tnftp.
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
CONFIGURE_ARGS+=	--bindir=${PREFIX}/sbin

NOT_FOR_PLATFORM=	# empty
NO_CHECKSUM=		yes
NO_PKGTOOLS_REQD_CHECK=	yes

include ../../mk/sysdep/termcap.mk
include ../../mk/robotpkg.mk

do-extract:
	@${CP} -Rp ${CURDIR}/dist ${WRKSRC}
