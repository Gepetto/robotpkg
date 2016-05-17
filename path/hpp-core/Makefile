# robotpkg Makefile for:	path/hpp-core
# Created:			Anthony Mallet on Fri, 13 Jul 2007
#

HPP_PACKAGE=		hpp-core
HPP_VERSION=		3.1.0
PKGREVISION=		1

CATEGORIES=	path
HPP_COMMENT=	Basic classes for general path planning
LICENSE=	gnu-lgpl-v2

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

include ../../path/hpp-constraints/depend.mk
include ../../path/hpp-model/depend.mk
include ../../path/hpp-util/depend.mk
include ../../path/hpp-statistics/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
