# robotpkg Makefile for:	optimization/roboptim-trajectory
# Created:			florent on Sat, 9 May 2009
#

VERSION=	0.6
DISTNAME=	roboptim-trajectory-${VERSION}
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=roboptim/}
MASTER_REPOSITORY=git git://github.com/laas/roboptim-trajectory.git

CATEGORIES=	optimization
COMMENT=	Optimization for robotics: trajectory optimization
HOMEPAGE=	http://sourceforge.net/projects/roboptim/
LICENSE=	gnu-lgpl-v3
MAINTAINER=	roboptim-user@lists.sourceforge.net

USE_LANGUAGES+= c c++
DOXYGEN_PLIST_DIR+=	share/doc/roboptim-trajectory
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--docdir=${PREFIX}/share/doc/roboptim-trajectory

INCLUDE_DIRS.boost-headers=include

# Make sure git-version-gen is not confused by the robotpkg ``.git''
# directory.
BUILD_MAKE_FLAGS+=    GIT_DIR=/dev/null

# --------------------------------------------------------------------

include ../../devel/boost-headers/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../optimization/roboptim-core/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/latex.mk
include ../../mk/robotpkg.mk
