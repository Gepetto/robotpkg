# robotpkg Makefile for:	math/mpfr
# Created:			Anthony Mallet on Thu, 28 Feb 2008
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
