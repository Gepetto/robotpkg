# robotpkg Makefile for:	path/hpp-statistics
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

PKGREVISION=
HPP_PACKAGE=		hpp-statistics
HPP_VERSION=		1.0.0

CATEGORIES=	path
HPP_COMMENT=	Tools to make statistics
LICENSE=	gnu-lgpl-v2

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

# the software may not be 64bits clean, but let it build
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

include ../../path/hpp-util/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
