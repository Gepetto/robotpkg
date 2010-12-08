# robotpkg Makefile for:	optimization/roboptim-trajectory
# Created:			florent on Sat, 9 May 2009
#

DISTNAME=	roboptim-trajectory-${VERSION}
PKGNAME=	roboptim-trajectory-${VERSION}
VERSION=	0.6

CATEGORIES=	optimization
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=roboptim/}
MASTER_REPOSITORY=git git://github.com/laas/roboptim-trajectory.git

MAINTAINER=	roboptim-user@lists.sourceforge.net
HOMEPAGE=	http://sourceforge.net/projects/roboptim/
COMMENT=	Optimization for robotics: trajectory optimization
LICENSE=	gnu-lgpl-v3

USE_LANGUAGES+= c c++

DOXYGEN_PLIST_DIR+=	share/doc/roboptim-trajectory

GNU_CONFIGURE=	yes

# Make sure git-version-gen is not confused by the robotpkg ``.git''
# directory.
BUILD_MAKE_FLAGS+=    GIT_DIR=/dev/null

# --------------------------------------------------------------------

include ../../pkgtools/pkg-config/depend.mk
include ../../optimization/roboptim-core/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/latex.mk
include ../../mk/robotpkg.mk
