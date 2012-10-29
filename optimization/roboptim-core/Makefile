# robotpkg Makefile for:	optimization/roboptim-core
# Created:			florent@laas.fr on Tue, 28 Apr 2009
#

VERSION=	1.0
PKGREVISION=	2
DISTNAME=	roboptim-core-${VERSION}
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=roboptim/}
MASTER_REPOSITORY=git git://github.com/laas/roboptim-core.git

CATEGORIES=	optimization
COMMENT=	Optimization for robotics: common API to various solvers
HOMEPAGE=	https://github.com/laas/roboptim-core
LICENSE=	gnu-lgpl-v3
MAINTAINER=	roboptim-user@lists.sourceforge.net

USE_LANGUAGES+=		c c++
CMAKE_ARGS+=		-DBOOST_ROOT=${PREFIX.boost-headers}
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes
DOXYGEN_PLIST_DIR+=	share/doc/roboptim-core

INCLUDE_DIRS.libtool-ltdl=	include
LIBRARY_DIRS.libtool-ltdl=	lib
RPATH_DIRS.libtool-ltdl=	lib

# Make sure git-version-gen is not confused by the robotpkg ``.git''
# directory.
BUILD_MAKE_FLAGS+=    GIT_DIR=/dev/null

# --------------------------------------------------------------------

include ../../mk/sysdep/cmake.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mk/sysdep/libtool-ltdl.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/latex.mk
include ../../mk/robotpkg.mk
