# robotpkg Makefile for:	optimization/py-casadi
# Created:			Guilhem Saurel on Wed, 7 Aug 2019
#

DISTNAME=		casadi-3.6.7
PKGNAME=		${PKGTAG.python-}${DISTNAME}
MASTER_SITES=		${MASTER_SITE_GITHUB:=casadi/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}casadi/casadi
CHECKOUT_VCS_OPTS+=	--recursive

HOMEPAGE=		${MASTER_SITES}
CATEGORIES=		optimization
COMMENT=		Symbolic framework for numeric optimization
LICENSE=		gnu-lgpl-v3
MAINTAINER=		gsaurel@laas.fr

CMAKE_ARGS+=\
  -DWITH_DEEPBIND=$(if $(filter ${OS_KERNEL},Linux),ON,OFF)

CMAKE_ARGS+=		-DPYTHON_PREFIX=${PREFIX}/${PYTHON_SITELIB}
CMAKE_ARGS+=		-DSWIG_EXECUTABLE=${SWIG}
CMAKE_ARGS+=		-DWITH_LAPACK=ON
CMAKE_ARGS+=		-DWITH_OPENMP=ON
CMAKE_ARGS+=		-DWITH_PYTHON=ON
CMAKE_ARGS+=		-DWITH_PYTHON3=$(if $(filter 3,${PYTHON_MAJOR}),ON,OFF)
CMAKE_ARGS+=		-DWITH_QPOASES=ON
CMAKE_ARGS+=		-DWITH_THREAD=ON
CMAKE_ARGS+=		-DWITH_IPOPT=ON

CMAKE_ARGS+=		-DWITH_BUILD_TINYXML=NO

CONFIGURE_DIRS=		build
CMAKE_ARG_PATH=		..

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/build

DEPEND_ABI.cmake=	cmake>=3.15
DEPEND_ABI.swig=	swig>=3

include ../casadi/depend.mk

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
