# robotpkg Makefile for:	path/hpp-manipulation
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

HPP_PACKAGE=	        hpp-manipulation
HPP_VERSION=		1.1.0
PKGREVISION=

CATEGORIES=		path
HPP_COMMENT=		Manipulation problem definition and resolution
LICENSE=		gnu-gpl-v3

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

include ../../path/hpp-core/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
