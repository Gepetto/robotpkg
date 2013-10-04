# robotpkg Makefile for:	architecture/orocos-ocl
# Created:			Arnaud Degroote on Thu, 22 Apr 2010
#

OROCOS_PKG=	ocl
CATEGORIES=	architecture
DISTINFO_FILE=  ${CURDIR}/distinfo
PKGREVISION=	2

include ../../meta-pkgs/orocos-toolchain/Makefile.common

HOMEPAGE=	http://www.orocos.org/ocl
COMMENT=	The Orocos Component Library
LICENSE=	gnu-lgpl-v2.1

DEPEND_ABI.boost-libs=boost-libs>=1.38
DEPEND_ABI.boost-headers=boost-headers>=1.38

PKG_SUPPORTED_OPTIONS+= lua
PKG_OPTION_DESCR.lua =	Enable lua support in orocos-ocl
define PKG_OPTION_SET.lua
  CMAKE_ARGS+=	-DBUILD_LUA_RTT=ON
  include ../../mk/sysdep/lua.mk
endef
define PKG_OPTION_UNSET.lua
  CMAKE_ARGS+=	-DBUILD_LUA_RTT=OFF
endef

PKG_SUPPORTED_OPTIONS+= corba
PKG_OPTION_DESCR.corba = Enable corba support in orocos
define PKG_OPTION_SET.corba
  DEPEND_ABI.orocos-rtt+=   orocos-rtt~corba
endef
define PKG_OPTION_UNSET.corba
  CMAKE_ARGS+=	-DBUILD_CORBA=OFF
endef

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/log4cxx/depend.mk
include ../../devel/orocos-log4cpp/depend.mk
include ../../middleware/orocos-rtt/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/ncurses.mk
include ../../mk/sysdep/netcdf.mk
include ../../mk/sysdep/readline.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
