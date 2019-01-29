# robotpkg Makefile for:	math/pinocchio
# Created:			Olivier Stasse on Thu, 4 Feb 2016
#

ORG=			stack-of-tasks
NAME=			pinocchio
VERSION=		1.3.3

DISTNAME=		${NAME}-${VERSION}

MASTER_SITES=\
  ${MASTER_SITE_GITHUB:=${ORG}/${NAME}/releases/download/v${VERSION}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}/${ORG}/${NAME}
CHECKOUT_VCS_OPTS=	--recursive

CATEGORIES=		math
COMMENT=		Efficient rigid body dynamics
HOMEPAGE=		http://${ORG}.github.io/${NAME}/
MAINTAINER=		gepetto@laas.fr
LICENSE=		gnu-lgpl-v3

CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib

CMAKE_ARGS+=		-DBUILD_BENCHMARK=OFF
CMAKE_ARGS+=		-DBUILD_UNIT_TESTS=OFF
CMAKE_ARGS+=		-DBUILD_UTILS=OFF
CMAKE_ARGS+=		-DBUILD_TESTS_WITH_HPP=OFF
CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=OFF
CMAKE_ARGS+=		-DINSTALL_DOCUMENTATION=OFF

USE_BOOST_LIBS=		system filesystem

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../math/eigen3/depend.mk
include ../../path/hpp-fcl/depend.mk
include ../../mapping/octomap/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk

DEPEND_ABI.cmake +=	cmake>=2.8.12
DEPEND_ABI.urdfdom +=	urdfdom>=0.2.3

include ../../mk/robotpkg.mk
