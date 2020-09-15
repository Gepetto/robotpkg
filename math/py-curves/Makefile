# robotpkg Makefile for:	math/py27-curves
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

ORG=			loco-3d
NAME=			curves
VERSION=		0.5.2

CATEGORIES=		math
COMMENT=		Library for creating curves (python bindings)
LICENSE=		2-clause-bsd
MAINTAINER=		gepetto@laas.fr

USE_BOOST_LIBS=		python
USE_PYTHON_ONLY=	yes

include ../../devel/jrl-cmakemodules/Makefile.common

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../math/curves/depend.mk
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
