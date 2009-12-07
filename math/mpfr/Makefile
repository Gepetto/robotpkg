#
# Copyright (c) 2008-2009 LAAS/CNRS
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
#                                             Anthony Mallet on Thu Feb 28 2008
#

DISTNAME=		mpfr-2.3.1
CATEGORIES=		math
MASTER_SITES=		http://www.mpfr.org/${DISTNAME}/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.mpfr.org/
COMMENT=		GMP-based library for multiple-precision floating-point computations

GNU_CONFIGURE=		yes

CONFIGURE_ARGS+=        --with-gmp=${PREFIX.gmp}

include ../../math/gmp/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk
