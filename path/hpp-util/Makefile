# robotpkg Makefile for:	path/hpp-util
# Created:			Thomas Moulard on Wed, 8 Sep 2010
#

HPP_PACKAGE=	hpp-util
HPP_COMMENT=	utility tools

CATEGORIES=	path

include ../../meta-pkgs/hpp/Makefile.common

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=	-DCXX_DISABLE_WERROR=yes

CMAKE_ARGS+=	-DTinyXML_PREFIX=${PREFIX.tinyxml}

include ../../devel/tinyxml/depend.mk
include ../../mk/language/c++.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
