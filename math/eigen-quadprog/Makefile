# robotpkg Makefile for:	math/eigen-quadprog
# Created:			Rohan Budhiraja on Tue, 14 Apr 2020
#

ORG=			jrl-umi3218
NAME=			eigen-quadprog
VERSION=		1.0.1
PKGREVISION=		1

PKGNAME=		${NAME}-${VERSION}
DISTNAME=		${NAME}-v${VERSION}

CATEGORIES=		math
COMMENT=		QuadProg QP solver using the Eigen3 library
LICENSE=		gnu-lgpl-v3
MAINTAINER=		gepetto@laas.fr

DYNAMIC_PLIST_DIRS+=	share/doc/${NAME}

# disable -Werror because of x86_64 warnings (must be fixed upstream) and
# boost + gcc that don't cohabit well depending on their respective versions
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

# man pages location
CMAKE_ARGS+=		-DMANDIR=${PREFIX}/${PKGMANDIR}

include ../../devel/jrl-cmakemodules/Makefile.common
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../math/eigen3/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/language/fortran.mk
include ../../mk/robotpkg.mk
