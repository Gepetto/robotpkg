# $LAAS: Makefile 2008/11/01 22:12:53 tho $
#
# Copyright (c) 2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
# From $NetBSD: Makefile,v 1.1 2006/07/14 21:41:42 jlam Exp $
#
#                                      Anthony Mallet on Fri Apr 18 2008
#

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

include ../../mk/sysdep/termcap.mk
include ../../mk/robotpkg.mk

do-extract:
	@${CP} -Rp ${CURDIR}/dist ${WRKSRC}
