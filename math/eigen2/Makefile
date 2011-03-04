# robotpkg Makefile for:	math/eigen2
# Created:			Matthieu Herrb on Wed, 19 May 2010
#
V=		2.0.15
PKGNAME=	eigen2-${V}
DISTNAME=	${V}
DIST_SUBDIR=	eigen2

CATEGORIES=	math
MASTER_SITES=	https://bitbucket.org/eigen/eigen/get/
WRKSRC=		${WRKDIR}/eigen

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://eigen.tuxfamily.org/
COMMENT=	a C++ template library for linear algebra
LICENSE=	gnu-lgpl-v3

USE_LANGUAGES=	c c++
WRKSRC=		${WRKDIR}/eigen-eigen-0938af7840b0

include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
