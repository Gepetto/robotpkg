# robotpkg Makefile for:	math/hpp-geometry
# Created:			Florent Lamiraux on Mon, 21 Jul 2013
#

HPP_PACKAGE=		hpp-geometry
HPP_VERSION=		1.1
PKGREVISION=
MASTER_REPOSITORY=	git git@github.com:laas/hpp-geometry

CATEGORIES=	math
HPP_COMMENT=	Extension of Kineo collision detector with capsules
LICENSE=	gnu-lgpl-v2

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

CMAKE_ARGS+=	-DGEOMETRIC_TOOLS_INSTALL_PREFIX=${PREFIX.geometric-tools}

include ../../math/geometric-tools/depend.mk
include ../../path/kineo-pp/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
