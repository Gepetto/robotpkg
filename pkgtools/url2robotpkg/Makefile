# $LAAS: Makefile 2009/03/06 19:39:44 mallet $
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
#                                             Anthony Mallet on Fri Mar  6 2009
#

DISTNAME=	url2pkg-2.7
CATEGORIES=	pkgtools
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	anthony.mallet@laas.fr
HOMEPAGE=	# empty
COMMENT=	Tool to automate initial steps in building a package

WRKSRC=		${WRKDIR}
NO_CHECKSUM=	yes
NO_BUILD=	yes
USE_LANGUAGES=	# none

SUBST_CLASSES+=		up
SUBST_STAGE.up=		do-configure
SUBST_FILES.up=		url2robotpkg.pl
SUBST_SED.up=		-e 's,@MAKE@,${MAKE},g'
SUBST_SED.up+=		-e 's,@PERL@,${PERL},g'

include ../../mk/sysdep/perl.mk
include ../../mk/robotpkg.mk

do-extract:
	cd ${FILESDIR} && cp *.pl ${WRKSRC}/

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/url2robotpkg.pl ${PREFIX}/bin/url2robotpkg
	${INSTALL_MAN} ${FILESDIR}/url2robotpkg.8 ${PREFIX}/man/man8/url2robotpkg.8
