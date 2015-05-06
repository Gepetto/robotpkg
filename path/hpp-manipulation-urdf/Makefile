# robotpkg Makefile for:	path/hpp-manipulation-urdf
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

HPP_PACKAGE=	        hpp-manipulation-urdf
HPP_VERSION=		1.1.0
PKGREVISION=

CATEGORIES=		path
HPP_COMMENT=		URDF/SRDF parser for the package hpp-manipulation
LICENSE=		gnu-gpl-v3

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

CMAKE_ARGS+=		-DTINYXML_ROOT=${PREFIX.tinyxml}

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

include ../../path/hpp-manipulation/depend.mk
include ../../path/hpp-model-urdf/depend.mk
include ../../mk/language/c.mk
include ../../mk/sysdep/tinyxml.mk
include ../../mk/robotpkg.mk
