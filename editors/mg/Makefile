#
# Copyright (c) 2009-2010 LAAS/CNRS
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
#                                             Matthieu Herrb on Thu Apr  2 2009
#

PKGNAME=	mg-20080818
DISTNAME=	mg-p-080818
EXTRACT_SUFX=	.tgz

CATEGORIES=	editors
COMMENT=	tiny emacs-like text editor
LICENSE=	modified-bsd 2-clause-bsd isc public-domain
MASTER_SITES=	http://pintday.org/hack/mg/

MAINTAINER=	matthieu.herrb@laas.fr
HOMEPAGE=	http://pintday.org/hack/mg/

INSTALLATION_DIRS=bin

WRKSRC=		${WRKDIR}/mg-p

MAKE_ENV=	PREFIX=${PREFIX}
MAKE_ENV+=	LDADD=$(call quote,${LDFLAGS})

# Define CFLAGS and LDFLAGS for ncurses
DEPEND_INCDIRS.ncurses=		$(if $(filter NetBSD,${OPSYS}),include/ncurses)
DEPEND_INCDIRS.ncurses+=	include
DEPEND_LIBDIRS.ncurses=		lib
DEPEND_RPATHDIRS.ncurses=	lib

include ../../mk/sysdep/ncurses.mk
include ../../mk/robotpkg.mk
