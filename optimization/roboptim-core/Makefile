# robotpkg Makefile for:	optimization/roboptim-core
# Created:			florent@laas.fr on Tue, 28 Apr 2009
#

DISTNAME=	roboptim-core-${VERSION}
PKGNAME=	roboptim-core-${VERSION}
VERSION=	0.5

CATEGORIES=	optimization
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=roboptim/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}roboptim/core

MAINTAINER=	roboptim-user@lists.sourceforge.net
HOMEPAGE=	http://sourceforge.net/projects/roboptim/
COMMENT=	Optimization for robotics: common API to various solvers.
LICENSE=	gnu-lgpl-v3

USE_LANGUAGES+= c c++

DOXYGEN_PLIST_DIR+=	share/doc/roboptim-core

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-boost=${PREFIX.boost-headers}

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
