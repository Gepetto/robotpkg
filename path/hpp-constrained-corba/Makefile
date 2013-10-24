# robotpkg Makefile for:	path/hpp-constrained-corba
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

PKGREVISION=		1
HPP_PACKAGE=		hpp-constrained-corba
HPP_VERSION=		1.0.0
MASTER_REPOSITORY=	git git@github.com:laas/hpp-constrained-corba

CATEGORIES=		path
HPP_COMMENT=		CORBA server for planning on constrained manifolds
LICENSE=		gnu-lgpl-v3

HPP_BUILD_SYSTEM=	cmake

include ../../meta-pkgs/hpp/Makefile.common

include ../../path/hpp-corbaserver/depend.mk
include ../../path/hpp-util/depend.mk
include ../../middleware/hpp-template-corba/depend.mk
include ../../path/hpp-constrained-planner/depend.mk
include ../../mk/sysdep/assimp2.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
