# robotpkg Makefile for:	devel/hpp-template-corba
# Created:			Thomas Moulard on Wed, 8 Sep 2010
#

HPP_PACKAGE=	hpp-template-corba
VERSION=	0.4

CATEGORIES=	devel
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}corba/hpp-template-corba

COMMENT=	Template CORBA server

USE_LANGUAGES+=	c c++
GNU_CONFIGURE=	yes

# --- options --------------------------------------------------------

# hpp-util support
PKG_SUPPORTED_OPTIONS+=	hpp-util
PKG_SUGGESTED_OPTIONS+=	hpp-util

PKG_OPTION_DESCR.hpp-util=	Trigger a dependency to hpp-util
define PKG_OPTION_SET.hpp-util
  CONFIGURE_ARGS+=	--enable-hpp-util
  include ../../devel/hpp-util/depend.mk
endef

# --------------------------------------------------------------------

include ../../meta-pkgs/hpp/Makefile.common
include ../../middleware/omniORB/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
