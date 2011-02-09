#
# Copyright (c) 2010 CNRS/LAAS
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
#                                          Severin Lemaignan on Tue, 25 Jan 2011


DISTNAME=	    	dialogs-${PKGVERSION}
PKGVERSION=	    	0.5

MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=dialogs/}
MASTER_REPOSITORY=	git http://trac.laas.fr/git/robots/dialogs.git

CATEGORIES=	speech
LICENSE=	2-clause-bsd
MAINTAINER=	slemaign@laas.fr
COMMENT=    A natural language processor for human-robot interaction

USE_LANGUAGES+=		python
PYTHON_REQUIRED=	>=2.5 <3

PYDISTUTILSPKG=		yes

include ../../mk/sysdep/py-setuptools.mk
include ../../mk/robotpkg.mk

