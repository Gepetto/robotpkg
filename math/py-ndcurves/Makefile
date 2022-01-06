# robotpkg Makefile for:	math/py27-ndcurves
# Created:			Guilhem Saurel on Tue, 16 Mar 2021
#

ORG=			loco-3d
NAME=			ndcurves
VERSION=		1.1.1

CATEGORIES=		math
COMMENT=		Library for creating curves (python bindings)
LICENSE=		2-clause-bsd
MAINTAINER=		gepetto@laas.fr

USE_BOOST_LIBS=		python
USE_PYTHON_ONLY=	yes

include ../../devel/jrl-cmakemodules/Makefile.common

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../math/ndcurves/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/pinocchio/depend.mk
include ../../math/py-eigenpy/depend.mk
include ../../math/py-pinocchio/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
