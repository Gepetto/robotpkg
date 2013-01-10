# robotpkg sysdep/c-compiler.mk
# Created:			Anthony Mallet on Wed, 9 Jan 2013
#
ifndef _language_c++_mk
_language_c++_mk:=defined

#
# C++ compiler definitions
#
# This file determines which C++ compiler is used.
#
# === User-settable variables ===
#
# PREFER_ALTERNATIVE.c++-compiler
#	The preferred C++ compiler to use. The order of the entries matters,
#	since earlier entries are preferred over later ones.
#
#	Possible values: g++ ccache-g++
#	Default: g++
#

# define an alternative for available c-compilers packages
PKG_ALTERNATIVES+=		c++-compiler
PKG_ALTERNATIVES.c++-compiler=	g++ clang++ ccache-g++ ccache-clang++
PREFER_ALTERNATIVE.c++-compiler?=g++ clang++

PREFER.c++-compiler?=		system
DEPEND_ABI.c++-compiler=	c++-compiler

PKG_ALTERNATIVE_DESCR.g++ =	Use the GNU C++ compiler
PKG_ALTERNATIVE_SELECT.g++ ?=	ok # non-empty
define PKG_ALTERNATIVE_SET.g++
  include ../../mk/sysdep/g++.mk

  export CXX=	${GXX}
  export CXXCPP=${GXX} -E
endef

PKG_ALTERNATIVE_DESCR.ccache-g++ =	Use ccache and the GNU C++ compiler
PKG_ALTERNATIVE_SELECT.ccache-g++ ?=	ok # non-empty
define PKG_ALTERNATIVE_SET.ccache-g++
  include ../../mk/sysdep/ccache.mk
  include ../../mk/sysdep/g++.mk

  export CXX=	${CCACHE} ${GXX}
  export CXXCPP=${GXX} -E
endef

# compiler flags
include ../../mk/language/c-c++-flags.mk

endif # _language_c++_mk ---------------------------------------------------
