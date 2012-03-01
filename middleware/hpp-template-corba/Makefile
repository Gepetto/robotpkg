# robotpkg Makefile for:	middleware/hpp-template-corba
# Created:			Florent Lamiraux on Thu, 7 Jul 2011
#

HPP_PACKAGE=	hpp-template-corba
HPP_VERSION=	1.1.1
MASTER_REPOSITORY=${MASTER_REPOSITORY_GITHUB_LAAS}${HPP_PACKAGE}

CATEGORIES=	middleware
HPP_COMMENT=	CORBA server factory
LICENSE=	gnu-lgpl-v3

HPP_BUILD_SYSTEM=	autoconf

include ../../meta-pkgs/hpp/Makefile.common

# --- options --------------------------------------------------------

# hpp-util support
PKG_SUPPORTED_OPTIONS+=	hpp-util
PKG_SUGGESTED_OPTIONS+=	hpp-util

PKG_OPTION_DESCR.hpp-util=	Trigger a dependency on hpp-util
define PKG_OPTION_SET.hpp-util
  CONFIGURE_ARGS+=	--enable-hpp-util
  include ../../devel/hpp-util/depend.mk
endef

# --------------------------------------------------------------------

include ../../mk/sysdep/cmake.mk
include ../../middleware/omniORB/depend.mk
include ../../mk/robotpkg.mk
