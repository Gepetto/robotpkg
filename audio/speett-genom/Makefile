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
#                                      Anthony Mallet on Sat Mar  7 2009
#

DISTNAME=	speett-genom-1.0
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=speett-genom/}
MASTER_REPOSITORY=git ssh://softs.laas.fr/git/robots/speett-genom

MAINTAINER=	mallet@laas.fr
#HOMEPAGE=	http://softs.laas.fr/openrobots/distfiles/speett-genom/
COMMENT=	Speech recognition engine based on Sphinx2 - GenoM module
LICENSE=	2-clause-bsd

GENOM_MODULE=	speett

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-sphinx2=${PREFIX.sphinx2}

include ../../audio/sphinx2/depend.mk
include ../../architecture/genom/depend.mk
include ../../mk/robotpkg.mk
