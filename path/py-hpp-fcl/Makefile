# robotpkg Makefile for:	path/py38-hpp-fcl
# Created:			Guilhem Saurel on Tue, 19 Nov 2019
#

HPP_PACKAGE=		hpp-fcl
HPP_VERSION=		2.4.4
PKGREVISION=		1

CATEGORIES=		path
HPP_COMMENT=		collision detection and distance computations (python bindingss)
LICENSE=		2-clause-bsd

HPP_DOC=		no # already in path/hpp-fcl
USE_PYTHON_ONLY=	yes

include ../../meta-pkgs/hpp/Makefile.common

USE_BOOST_LIBS= thread date_time system filesystem unit_test_framework python
USE_BOOST_LIBS+= chrono

include ../../mk/robotpkg.prefs.mk
ifeq (,$(filter Ubuntu-16.04 Debian-9,${OPSYS}-${OS_VERSION}))
  CMAKE_ARGS+=		-DHPP_FCL_HAS_QHULL=ON
  include ../../mk/sysdep/qhull.mk
endif

DEPEND_ABI.assimp+=	assimp>=5

include ../../mapping/octomap/depend.mk
include ../../math/py-eigenpy/depend.mk
include ../../path/hpp-fcl/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/assimp.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
