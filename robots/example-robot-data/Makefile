# robotpkg Makefile for:	robots/example-robot-data
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

ORG=			gepetto
NAME=			example-robot-data
VERSION=		3.6.0

CATEGORIES=		robots
COMMENT=		Robot URDFs for benchmarking and developed examples
LICENSE=		2-clause-bsd
MAINTAINER=		gepetto@laas.fr

CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=OFF

include ../../devel/jrl-cmakemodules/Makefile.common

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
