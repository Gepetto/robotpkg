# robotpkg Makefile for:	path/py38-coal
# Created:			Guilhem Saurel on Tue, 19 Nov 2019
#

ORG=			coal-library
NAME=			coal
VERSION=		3.0.0

CATEGORIES=		path
HPP_COMMENT=		collision detection and distance computations (python bindingss)
LICENSE=		2-clause-bsd
CONFLICTS+=		${PKGTAG.python-}hpp-fcl-[0-9]*

USE_BOOST_LIBS= thread date_time system filesystem unit_test_framework chrono
USE_BOOST_LIBS+=	python
USE_MASTER_GITHUB=	true
USE_PYTHON_ONLY=	yes

CMAKE_ARGS+=		-DCOAL_BACKWARD_COMPATIBILITY_WITH_HPP_FCL=ON

include ../../devel/jrl-cmakemodules/Makefile.common

include ../../mk/robotpkg.prefs.mk
ifeq (,$(filter Ubuntu-16.04 Debian-9,${OPSYS}-${OS_VERSION}))
  CMAKE_ARGS+=		-DHPP_FCL_HAS_QHULL=ON
  include ../../mk/sysdep/qhull.mk
endif

DEPEND_ABI.assimp+=	assimp>=5

include ../../mapping/octomap/depend.mk
include ../../math/py-eigenpy/depend.mk
include ../../path/coal/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/assimp.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
