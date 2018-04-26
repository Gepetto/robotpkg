# robotpkg Makefile for:	math/py-pinocchio
# Created:			Olivier Stasse on Thu, 4 Feb 2016
#

VERSION=		1.2.7
PKGNAME=		${PKGTAG.python-}pinocchio-${VERSION}
DISTNAME=		pinocchio-${VERSION}
MASTER_SITES=\
  ${MASTER_SITE_BASE:=${PKGBASE}/releases/download/v${VERSION}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}/stack-of-tasks/${PKGBASE}
CHECKOUT_VCS_OPTS=	--recursive

CATEGORIES=		math
COMMENT=		Efficient rigid body dynamics (python bindings)
HOMEPAGE=		http://stack-of-tasks.github.io/pinocchio/
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

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../math/pinocchio/depend.mk
include ../../math/py-eigenpy/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk

DEPEND_ABI.python+=	python<3

include ../../mk/robotpkg.mk
