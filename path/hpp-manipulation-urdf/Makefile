# robotpkg Makefile for:	path/hpp-manipulation-urdf
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

HPP_PACKAGE=	hpp-manipulation-urdf
HPP_VERSION=	4.10.1

CATEGORIES=	path
HPP_COMMENT=	URDF/SRDF parser for the package hpp-manipulation

include ../../meta-pkgs/hpp/Makefile.common

CMAKE_ARGS+=	-DTinyXML_PREFIX=${PREFIX.tinyxml}

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=	-DCXX_DISABLE_WERROR=yes

include ../../devel/log4cxx/depend.mk
include ../../devel/tinyxml/depend.mk
include ../../math/pinocchio/depend.mk
include ../../math/hpp-pinocchio/depend.mk
include ../../path/hpp-manipulation/depend.mk
include ../../path/hpp-util/depend.mk
include ../../mapping/octomap/depend.mk
include ../../optimization/roboptim-trajectory/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
