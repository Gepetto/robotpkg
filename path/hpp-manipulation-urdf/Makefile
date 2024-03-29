# robotpkg Makefile for:	path/hpp-manipulation-urdf
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

HPP_PACKAGE=	hpp-manipulation-urdf
HPP_COMMENT=	URDF/SRDF parser for the package hpp-manipulation

CATEGORIES=	path

include ../../meta-pkgs/hpp/Makefile.common

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=	-DCXX_DISABLE_WERROR=yes

include ../../devel/log4cxx/depend.mk
include ../../math/pinocchio/depend.mk
include ../../math/hpp-pinocchio/depend.mk
include ../../path/hpp-manipulation/depend.mk
include ../../path/hpp-util/depend.mk
include ../../mapping/octomap/depend.mk
include ../../mk/sysdep/tinyxml2.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
