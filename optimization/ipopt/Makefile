# robotpkg Makefile for:	optimization/ipopt
# Created:			florent on Sat, 9 May 2009
#

DISTNAME=	Ipopt-${VERSION}
PKGNAME=	ipopt-${VERSION}
VERSION=	3.6.1
EXTRACT_SUFX=	.tgz

CATEGORIES=	optimization
MASTER_SITES=	http://www.coin-or.org/download/source/Ipopt/

MAINTAINER=	ipopt@list.coin-or.org
HOMEPAGE=	https://projects.coin-or.org/Ipopt
COMMENT=	Interior Point OPTimizer, pronounced I-P-Opt
LICENSE=	cpl

USE_LANGUAGES=	c c++ fortran
GNU_CONFIGURE=	yes

# --------------------------------------------------------------------

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/latex.mk
include ../../mk/robotpkg.mk
