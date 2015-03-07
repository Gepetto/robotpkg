# robotpkg Makefile for:	path/hpp-util
# Created:			Florent Lamirax on Sat, 7 Mar 2015
#

HPP_PACKAGE=		hpp-fcl
HPP_VERSION=		0.4
PKGREVISION=

CATEGORIES=		path
HPP_COMMENT=		collision detection and distance computations
LICENSE=		2-clause-bsd

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

include ../../mapping/octomap/depend.mk
include ../../math/libccd/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
