# robotpkg Makefile for:	math/py-pinocchio
# Created:			Olivier Stasse on Thu, 4 Feb 2016
#

ORG=			stack-of-tasks
NAME=			pinocchio
VERSION=		2.1.0

DISTNAME=		${NAME}-${VERSION}
PKGNAME=		${PKGTAG.python-}${DISTNAME}

MASTER_SITES=\
  ${MASTER_SITE_GITHUB:=${ORG}/${NAME}/releases/download/v${VERSION}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}/${ORG}/${NAME}
CHECKOUT_VCS_OPTS=	--recursive

CATEGORIES=		math
COMMENT=		Efficient rigid body dynamics (python bindings)
HOMEPAGE=		http://${ORG}.github.io/${NAME}/
MAINTAINER=		gepetto@laas.fr
LICENSE=		2-clause-bsd

CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib

CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=ON
CMAKE_ARGS+=		-DINSTALL_DOCUMENTATION=OFF

USE_BOOST_LIBS=		python
Boost_PYTHON_LIBRARY=	$(filter %.so,${SYSTEM_FILES.boost-lib-python})
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_RELEASE=${Boost_PYTHON_LIBRARY}
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_DEBUG=${Boost_PYTHON_LIBRARY}

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../math/pinocchio/depend.mk
include ../../math/py-eigenpy/depend.mk
include ../../path/hpp-fcl/depend.mk
include ../../mapping/octomap/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk

DEPEND_ABI.cmake +=	cmake>=2.8.12

include ../../mk/robotpkg.mk
