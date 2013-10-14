# robotpkg Makefile for:	devel/hpp-model
# Created:			Anthony Mallet on Mon, 18 Feb 2008
#

PKGREVISION=		1
HPP_PACKAGE=		hpp-model
HPP_VERSION=		2.4.0
MASTER_REPOSITORY=	git git@github.com:laas/hpp-model

CATEGORIES=	devel
HPP_COMMENT=	robots, joints and bodies with dynamics properties
LICENSE=	gnu-lgpl-v2

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

include ../../devel/hpp-kwsio/depend.mk
include ../../devel/hpp-util/depend.mk
include ../../math/hpp-geometry/depend.mk
include ../../math/jrl-dynamics/depend.mk
include ../../mk/sysdep/kineoworks.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
