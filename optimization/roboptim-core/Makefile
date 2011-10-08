# robotpkg Makefile for:	optimization/roboptim-core
# Created:			florent@laas.fr on Tue, 28 Apr 2009
#

VERSION=	0.6
PKGREVISION=	1
DISTNAME=	roboptim-core-${VERSION}
MASTER_SITES=	https://github.com/downloads/laas/roboptim-core/
MASTER_REPOSITORY=git git://github.com/laas/roboptim-core.git

CATEGORIES=	optimization
COMMENT=	Optimization for robotics: common API to various solvers
HOMEPAGE=	http://sourceforge.net/projects/roboptim/
LICENSE=	gnu-lgpl-v3
MAINTAINER=	roboptim-user@lists.sourceforge.net

USE_LANGUAGES+=		c c++
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-boost=${PREFIX.boost-headers}
DOXYGEN_PLIST_DIR+=	share/doc/roboptim-core

LIBRARY_DIRS.libtool-ltdl=	lib
RPATH_DIRS.libtool-ltdl=	lib

# Make sure git-version-gen is not confused by the robotpkg ``.git''
# directory.
BUILD_MAKE_FLAGS+=    GIT_DIR=/dev/null

# --------------------------------------------------------------------

include ../../pkgtools/pkg-config/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mk/sysdep/libtool-ltdl.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/latex.mk
include ../../mk/robotpkg.mk
