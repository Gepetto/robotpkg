# robotpkg Makefile for:	optimization/ipopt
# Created:			florent on Sat, 9 May 2009
#

COMMIT=		ac9345f
VERSION=	1.2.2beta.20160615
DISTNAME=	acado-${VERSION}

CATEGORIES=	optimization
MASTER_SITES=   https://github.com/acado/acado.git@${COMMIT}
FETCH_METHOD=   git

MAINTAINER=	robotpkg@laas.fr
HOMEPAGE=	http://www.acadotoolkit.org
COMMENT=	Algorithms for automatic control and dynamic optimization
LICENSE=	gnu-lgpl-v3

CMAKE_ARGS+=	-DACADO_WITH_EXAMPLES=OFF

INCLUDE_DIRS.eigen3=	include

include ../../math/eigen3/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

post-extract:
	${RUN}${RM} -rf ${WRKSRC}/external_packages/eigen3
