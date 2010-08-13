#
# Copyright (c) 2008,2010 LAAS/CNRS
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
