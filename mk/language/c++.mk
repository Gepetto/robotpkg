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
#	Possible values: g++ clang++ ccache-g++ ccache-clang++
#	Default: g++ clang++
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

PKG_ALTERNATIVE_DESCR.clang++ =	Use the LLVM C++ compiler
PKG_ALTERNATIVE_SELECT.clang++ ?=ok # non-empty
define PKG_ALTERNATIVE_SET.clang++
  include ../../mk/sysdep/clang++.mk

  export CXX=	${CLANGXX}
  export CXXCPP=${CLANGXX} -E
endef

PKG_ALTERNATIVE_DESCR.ccache-g++ =	Use ccache and the GNU C++ compiler
PKG_ALTERNATIVE_SELECT.ccache-g++ ?=	ok # non-empty
define PKG_ALTERNATIVE_SET.ccache-g++
  include ../../mk/sysdep/ccache.mk
  include ../../mk/sysdep/g++.mk

  DEPEND_ABI.ccache-g++ =${DEPEND_ABI.ccache} ${DEPEND_ABI.g++}

  export CXX=	${CCACHE} ${GXX}
  export CXXCPP=${GXX} -E
endef

PKG_ALTERNATIVE_DESCR.ccache-clang++ =	Use ccache and the LLVM C++ compiler
PKG_ALTERNATIVE_SELECT.ccache-clang++ ?=ok # non-empty
define PKG_ALTERNATIVE_SET.ccache-clang++
  include ../../mk/sysdep/ccache.mk
  include ../../mk/sysdep/clang++.mk

  DEPEND_ABI.ccache-clang++ =${DEPEND_ABI.ccache} ${DEPEND_ABI.clang++}
  CPPFLAGS+=-Qunused-arguments # because of ccache

  export CXX=	${CCACHE} ${CLANGXX}
  export CXXCPP=${CLANGXX} -E
endef

# compiler flags
include ../../mk/language/c-c++-flags.mk

endif # _language_c++_mk ---------------------------------------------------
