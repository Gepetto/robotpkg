# robotpkg Makefile for:	path/py38-hpp-fcl
# Created:			Guilhem Saurel on Tue, 19 Nov 2019
#

HPP_PACKAGE=		hpp-fcl
HPP_VERSION=		1.8.1

CATEGORIES=		path
HPP_COMMENT=		collision detection and distance computations (python bindingss)
LICENSE=		2-clause-bsd

HPP_DOC=		no # already in path/hpp-fcl
USE_PYTHON_ONLY=	yes

include ../../meta-pkgs/hpp/Makefile.common

USE_BOOST_LIBS= thread date_time system filesystem unit_test_framework python
USE_BOOST_LIBS+= chrono

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mapping/octomap/depend.mk
include ../../math/py-eigenpy/depend.mk
include ../../path/hpp-fcl/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
