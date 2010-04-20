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
#                                           Xavier Broquere, on Fri Feb 19 2010
#


DISTNAME=		genManip-genom-0.2
CATEGORIES=		manipulation

MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=genManip-genom/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/genManip-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Common manipulation-related structures for GenoM modules

GNU_CONFIGURE=		yes

GENOM_MODULE=		genManip
GENOM_ARGS=		-a

include ../../architecture/genom/depend.mk

include ../../architecture/genBasic-genom/depend.mk
include ../../math/gbM/depend.mk
include ../../pkgtools/pkg-config/depend.mk

include ../../mk/robotpkg.mk
