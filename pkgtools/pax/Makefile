#
# Copyright (C) 2008 LAAS/CNRS
#
# Authored by Anthony Mallet on Fri Apr 18 2008
# From $NetBSD: Makefile,v 1.13 2006/07/14 20:11:10 jlam Exp $
#
# This version of pax installs into ${PKG_TOOLS_BIN} as robotpkg_pax.
#

DISTNAME=		pax-20080110
CATEGORIES=     	pkgtools
MASTER_SITES=		# empty
DISTFILES=		# empty

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.NetBSD.org/
COMMENT=		POSIX standard archiver with many extensions

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--bindir=${PKG_TOOLS_BIN}
CONFIGURE_ARGS+=	--program-transform-name='s/^/robotpkg_/'

NO_CHECKSUM=		yes
NO_PKGTOOLS_REQD_CHECK= yes
PKG_PRESERVE=           yes

LIBNBCOMPAT_STYLE=	inplace
include ../../pkgtools/libnbcompat/depend.mk

include ../../mk/robotpkg.mk

do-extract:
	${CP} -Rp ${CURDIR}/dist ${WRKSRC}
