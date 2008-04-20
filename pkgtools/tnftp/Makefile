#
# Copyright (C) 2008 LAAS/CNRS
#
# Authored by Anthony Mallet on Fri Apr 18 2008
# From $NetBSD: Makefile,v 1.1 2006/07/14 21:41:42 jlam Exp $
#
# This version of tnftp installs into ${PKG_TOOLS_BIN} as robotpkg_ftp.
#

DISTNAME=		tnftp-20070806
CATEGORIES=		pkgtools

MASTER_SITES=		# empty
DISTFILES=		# empty

# NetBSD distfile obtained from: ftp://ftp.NetBSD.org/pub/NetBSD/misc/tnftp

MAINTAINER=		openrobot@laas.fr
COMMENT=		The enhanced FTP client in NetBSD

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--bindir=${PKG_TOOLS_BIN}
CONFIGURE_ARGS+=	--program-transform-name='s/^/robotpkg_/'

NO_CHECKSUM=		yes
NO_PKGTOOLS_REQD_CHECK=	yes
PKG_PRESERVE=		yes

include ../../mk/robotpkg.mk

do-extract:
	@${CP} -Rp ${CURDIR}/dist ${WRKSRC}
