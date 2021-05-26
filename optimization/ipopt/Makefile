# robotpkg Makefile for:	optimization/ipopt
# Created:			florent on Sat, 9 May 2009
#

PKGREVISION=	1
ORG=		coin-or
NAME=		Ipopt
VERSION=	3.13.4

CATEGORIES=	optimization
MASTER_SITES=	${MASTER_SITE_GITHUB:=${ORG}/${NAME}}/archive/refs/tags/releases/

DISTNAME=	${VERSION}
PKGNAME=	ipopt-${VERSION}
WRKSRC=		${WRKDIR}/${NAME}-releases-${VERSION}

MAINTAINER=	guilhem.saurel@laas.fr
HOMEPAGE=	${MASTER_SITE_GITHUB:=${ORG}/${NAME}}
COMMENT=	Interior Point OPTimizer, pronounced I-P-Opt
LICENSE=	eclipse

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--disable-java

# --------------------------------------------------------------------

include ../../pkgtools/pkg-config/depend.mk
include ../../math/lapack/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/latex.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/language/fortran.mk
include ../../mk/robotpkg.mk
