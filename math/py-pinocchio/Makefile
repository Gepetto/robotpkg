# robotpkg Makefile for:	math/py-pinocchio
# Created:			Olivier Stasse on Thu, 4 Feb 2016
#

PKGREVISION=		1
VERSION=		1.3.1
NAME=			pinocchio
PKGNAME=		${PKGTAG.python-}${NAME}-${VERSION}
DISTNAME=		${NAME}-${VERSION}
MASTER_SITES=\
  ${MASTER_SITE_GITHUB:=stack-of-tasks/${NAME}/releases/download/v${VERSION}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}/stack-of-tasks/${NAME}
CHECKOUT_VCS_OPTS=	--recursive

CATEGORIES=		math
COMMENT=		Efficient rigid body dynamics (python bindings)
HOMEPAGE=		http://stack-of-tasks.github.io/${NAME}/
MAINTAINER=		gepetto@laas.fr
LICENSE=		gnu-lgpl-v3

CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib
CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=ON

CMAKE_ARGS+=		-DBUILD_BENCHMARK=OFF
CMAKE_ARGS+=		-DBUILD_UNIT_TESTS=OFF
CMAKE_ARGS+=		-DBUILD_UTILS=OFF
CMAKE_ARGS+=		-DBUILD_TESTS_WITH_HPP=OFF
CMAKE_ARGS+=		-DINSTALL_DOCUMENTATION=OFF

USE_BOOST_LIBS=		python
Boost_PYTHON_LIBRARY=	$(filter %.so,${SYSTEM_FILES.boost-lib-python})
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_RELEASE=${Boost_PYTHON_LIBRARY}
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_DEBUG=${Boost_PYTHON_LIBRARY}

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../math/pinocchio/depend.mk
include ../../math/py-eigenpy/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk

DEPEND_ABI.cmake +=	cmake>=2.8.12

include ../../mk/robotpkg.mk
