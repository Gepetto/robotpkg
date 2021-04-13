# robotpkg Makefile for:	path/py39-hpp-centroidal-dynamics
# Created:			Guilhem Saurel on Tue, 13 Apr 2021
#

HPP_PACKAGE=		hpp-centroidal-dynamics
HPP_COMMENT=		testing equilibrium

CATEGORIES=		path

USE_BOOST_LIBS=		python
PYTHON_NOTAG_CONFLICT=	yes

CMAKE_ARGS+=		-DqpOASES_PREFIX=${PREFIX.qpoases}

include ../../meta-pkgs/hpp/Makefile.common

include ../../math/py-eigenpy/depend.mk
include ../../math/eigen3/depend.mk
include ../../optimization/qpoases/depend.mk

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk

include ../../mk/sysdep/libcdd.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
