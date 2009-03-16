# $LAAS: Makefile 2009/03/15 18:09:41 tho $
#
# Copyright (c) 2009 LAAS/CNRS
# All rights reserved.
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
#                                             Anthony Mallet on Sat Mar 14 2009
#

DISTNAME=       robotpkg_chk-1.0
CATEGORIES=     pkgtools
MASTER_SITES=   # empty
DISTFILES=      # empty

MAINTAINER=	anthony.mallet@laas.fr
HOMEPAGE=       http://www.laas.fr/~mallet/robotpkg
COMMENT=        Check installed packages versions against robotpkg

WRKSRC=		${WRKDIR}
NO_CHECKSUM=    yes
NO_BUILD=       yes

USE_LANGUAGES=  # empty

SUBST_CLASSES+=         vars
SUBST_STAGE.vars=       pre-configure
SUBST_MESSAGE.vars=     Configuring sources
SUBST_FILES.vars=       robotpkg_chk.sh robotpkg_chk.8
SUBST_SED.vars=		$(foreach v,					\
	EXPR AWK GREP DATE GZIP_CMD ID MAKE ROBOTPKG_DIR		\
                        PKG_ADD PKG_ADMIN PKG_DELETE PKG_INFO		\
                        SED SH SORT TSORT PREFIX XARGS,			\
	-e 's|@$v@|${$v}|g')

do-extract:
	cp ${FILESDIR}/robotpkg_chk.sh ${WRKSRC}
	cp ${FILESDIR}/robotpkg_chk.8 ${WRKSRC}

do-install:
	${INSTALL_SCRIPT_DIR} ${PREFIX}/sbin
	${INSTALL_SCRIPT} ${WRKSRC}/robotpkg_chk.sh ${PREFIX}/sbin/robotpkg_chk
	${INSTALL_MAN_DIR} ${PREFIX}/man/man8
	${INSTALL_MAN} ${WRKSRC}/robotpkg_chk.8 ${PREFIX}/man/man8/robotpkg_chk.8

include ../../mk/robotpkg.mk
