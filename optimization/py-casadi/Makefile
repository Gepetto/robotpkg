# robotpkg Makefile for:	optimization/py-casadi
# Created:			Guilhem Saurel on Wed, 7 Aug 2019
#

ORG=			casadi
NAME=			casadi
VERSION=		3.5.5
PKGREVISION=		4

DISTNAME=		${NAME}-${VERSION}
PKGNAME=		${PKGTAG.python-}${DISTNAME}

HOMEPAGE=		${MASTER_SITE_GITHUB:=${ORG}/${NAME}}
MASTER_SITES=		${HOMEPAGE}/archive/${VERSION}/
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}${ORG}/${NAME}
CHECKOUT_VCS_OPTS+=	--recursive

CATEGORIES=		wip
COMMENT=		Symbolic framework for numeric optimization
LICENSE=		gnu-lgpl-v3
MAINTAINER=		gsaurel@laas.fr

CMAKE_ARGS+=		-DPYTHON_PREFIX=${PREFIX}/${PYTHON_SITELIB}
CMAKE_ARGS+=		-DSWIG_EXECUTABLE=${SWIG}
CMAKE_ARGS+=		-DWITH_LAPACK=ON
CMAKE_ARGS+=		-DWITH_OPENMP=ON
CMAKE_ARGS+=		-DWITH_PYTHON=ON
CMAKE_ARGS+=		-DWITH_PYTHON3=$(if $(filter 3,${PYTHON_MAJOR}),ON,OFF)
CMAKE_ARGS+=		-DWITH_QPOASES=ON
CMAKE_ARGS+=		-DWITH_THREAD=ON
CMAKE_ARGS+=		-DWITH_IPOPT=ON

CONFIGURE_DIRS=		build
CMAKE_ARG_PATH=		..

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/build

DEPEND_ABI.swig=	swig>=3

include ../../math/lapack/depend.mk
include ../../optimization/ipopt/depend.mk
include ../../optimization/qpoases/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/swig.mk
include ../../mk/sysdep/tinyxml2.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
