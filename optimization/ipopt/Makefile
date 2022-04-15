# robotpkg Makefile for:	optimization/ipopt
# Created:			florent on Sat, 9 May 2009
#

PKGREVISION=	1
DISTNAME=	Ipopt-3.13.4
PKGNAME=	$(subst Ip,ip,${DISTNAME})
MASTER_SITES=	${MASTER_SITE_GITHUB:=coin-or/}
GITHUB_TAG=	releases/${PKGVERSION_NOREV}

CATEGORIES=	optimization
MAINTAINER=	guilhem.saurel@laas.fr
COMMENT=	Interior Point OPTimizer, pronounced I-P-Opt
LICENSE=	eclipse

WRKSRC=		${WRKDIR}/Ipopt-$(subst /,-,${GITHUB_TAG})

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--disable-java

# compiler flags for lapack
LIBRARY_DIRS.lapack= $(dir ${LAPACK_LIB})
RPATH_DIRS.lapack= $(dir ${LAPACK_LIB})

include ../../pkgtools/pkg-config/depend.mk
include ../../math/lapack/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/latex.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/language/fortran.mk
include ../../mk/robotpkg.mk
