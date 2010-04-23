#
# Copyright (c) 2010 LAAS/CNRS
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
#                                            Anthony Mallet on Fri Apr 23 2010
#

PKGNAME=		y2l-1.0
DISTNAME=		y2l

COMMENT=		Yacc to LaTeX translator

MAINTAINER=		openrobots@laas.fr
CATEGORIES=		sysutils
HOMEPAGE=		http://www.alchar.org/~aedil/Projects/y2l.html
MASTER_SITES=		http://y2l.sourceforge.net/download/

WRKSRC=			${WRKDIR}/${PKGNAME}
NO_CONFIGURE=		yes
NO_BUILD=		yes

DOCDIR=			share/doc/y2l
INSTALLATION_DIRS=	bin
INSTALLATION_DIRS+=	${PKGMANDIR}/man1
INSTALLATION_DIRS+=	${DOCDIR}

include ../../mk/robotpkg.mk

do-install:
	cd ${WRKSRC} && { 						\
	  ${INSTALL_PROGRAM} y2l ${PREFIX}/bin/.;			\
	  ${INSTALL_DATA} y2l.man ${PREFIX}/${PKGMANDIR}/man1/y2l.1;	\
	  ${INSTALL_DATA} y2lman.html ${PREFIX}/${DOCDIR}/.;		\
	  ${INSTALL_DATA} README ${PREFIX}/${DOCDIR}/.;			\
	}
