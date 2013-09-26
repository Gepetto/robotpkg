# robotpkg Makefile for:	path/hpp-constrained
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

HPP_PACKAGE=		hpp-constrained
HPP_VERSION=		1.0.2
MASTER_REPOSITORY=	git git@github.com:laas/hpp-constrained

CATEGORIES=		path
HPP_COMMENT=		Motion planning on constrained manifolds
LICENSE=		gnu-lgpl-v3

HPP_BUILD_SYSTEM=	cmake

include ../../meta-pkgs/hpp/Makefile.common

include ../../devel/hpp-kwsio/depend.mk
include ../../devel/hpp-model/depend.mk
include ../../path/hpp-gik/depend.mk
include ../../interfaces/abstract-gik-task/depend.mk
include ../../devel/hpp-util/depend.mk
include ../../mk/sysdep/assimp2.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
