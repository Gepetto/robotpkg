# robotpkg Makefile for:	path/hpp-model
# Created:			Anthony Mallet on Mon, 18 Feb 2008
#

PKGREVISION=
HPP_PACKAGE=		hpp-model
HPP_VERSION=		2.4.3
MASTER_REPOSITORY=	git git@github.com:laas/hpp-model

CATEGORIES=	path
HPP_COMMENT=	robots, joints and bodies with dynamics properties
LICENSE=	gnu-lgpl-v2

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

include ../../path/hpp-kwsio/depend.mk
include ../../path/hpp-util/depend.mk
include ../../math/hpp-geometry/depend.mk
include ../../math/jrl-dynamics/depend.mk
include ../../mk/sysdep/kineoworks.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
