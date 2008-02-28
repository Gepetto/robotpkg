# $Id: Makefile eb865049c1ea57fa4812ac4af73949e6 2008/02/17 13:50:55 tho $

DISTNAME=		mpfr-2.3.1
CATEGORIES=		math
MASTER_SITES=		http://www.mpfr.org/${DISTNAME}/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.mpfr.org/
COMMENT=		GMP-based library for multiple-precision floating-point computations

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes

CONFIGURE_ARGS+=        --with-gmp=${PREFIX}

DEPENDS+=		gmp>=4.2.2:../../math/gmp

include ../../mk/robotpkg.mk
