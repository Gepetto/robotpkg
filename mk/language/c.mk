# robotpkg language/c.mk
# Created:			Anthony Mallet on Wed, 9 Jan 2013
#
ifndef _language_c_mk
_language_c_mk:=defined

#
# C compiler definitions
#
# This file determines which C compiler version is used.
#
# === User-settable variables ===
#
# PREFER_ALTERNATIVE.c-compiler
#	The preferred C compiler to use. The order of the entries matters,
#	since earlier entries are preferred over later ones.
#
#	Possible values: gcc clang ccache-gcc ccache-clang
#	Default: gcc clang
#

# define an alternative for available c-compilers packages
PKG_ALTERNATIVES+=		c-compiler
PKG_ALTERNATIVES.c-compiler=	gcc ccache-gcc
PREFER_ALTERNATIVE.c-compiler?=	gcc

PREFER.c-compiler?=		system
DEPEND_ABI.c-compiler=		c-compiler

PKG_ALTERNATIVE_DESCR.gcc=	Use the GNU C compiler
PKG_ALTERNATIVE_SELECT.gcc=	ok # non-empty
define PKG_ALTERNATIVE_SET.gcc
  include ../../mk/sysdep/gcc.mk

  export CC=	${GCC}
  export CPP=	${GCC} -E
endef

PKG_ALTERNATIVE_DESCR.ccache-gcc=	Use ccache and the GNU C compiler
PKG_ALTERNATIVE_SELECT.ccache-gcc=	ok # non-empty
define PKG_ALTERNATIVE_SET.ccache-gcc
  include ../../mk/sysdep/ccache.mk
  include ../../mk/sysdep/gcc.mk

  export CC=	${CCACHE} ${GCC}
  export CPP=	${GCC} -E
endef

# compiler flags
include ../../mk/language/c-c++-flags.mk

endif # _language_c_mk -----------------------------------------------------
