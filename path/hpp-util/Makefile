# robotpkg Makefile for:	path/hpp-util
# Created:			Thomas Moulard on Wed, 8 Sep 2010
#

HPP_PACKAGE=	hpp-util
HPP_VERSION=	4.5.0

CATEGORIES=	path
HPP_COMMENT=	utility tools

include ../../meta-pkgs/hpp/Makefile.common

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=	-DCXX_DISABLE_WERROR=yes

CMAKE_ARGS+=	-DTinyXML_INCLUDE_PATH=${PREFIX.tinyxml}/include
CMAKE_ARGS+=	-DTinyXML_LIBRARY_PATH=${PREFIX.tinyxml}/lib

include ../../devel/tinyxml/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
