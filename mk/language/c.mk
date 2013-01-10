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
PKG_ALTERNATIVES.c-compiler=	gcc clang ccache-gcc ccache-clang
PREFER_ALTERNATIVE.c-compiler?=	gcc clang

PREFER.c-compiler?=		system
DEPEND_ABI.c-compiler=		c-compiler

PKG_ALTERNATIVE_DESCR.gcc=	Use the GNU C compiler
PKG_ALTERNATIVE_SELECT.gcc=	ok # non-empty
define PKG_ALTERNATIVE_SET.gcc
  include ../../mk/sysdep/gcc.mk

  export CC=	${GCC}
  export CPP=	${GCC} -E
endef

PKG_ALTERNATIVE_DESCR.clang=	Use the LLVM C compiler
PKG_ALTERNATIVE_SELECT.clang=	ok # non-empty
define PKG_ALTERNATIVE_SET.clang
  include ../../mk/sysdep/clang.mk

  export CC=	${CLANG}
  export CPP=	${CLANG} -E
endef

PKG_ALTERNATIVE_DESCR.ccache-gcc=	Use ccache and the GNU C compiler
PKG_ALTERNATIVE_SELECT.ccache-gcc=	ok # non-empty
define PKG_ALTERNATIVE_SET.ccache-gcc
  include ../../mk/sysdep/ccache.mk
  include ../../mk/sysdep/gcc.mk

  DEPEND_ABI.ccache-gcc=${DEPEND_ABI.ccache} ${DEPEND_ABI.gcc}

  export CC=	${CCACHE} ${GCC}
  export CPP=	${GCC} -E
endef

PKG_ALTERNATIVE_DESCR.ccache-clang=	Use ccache and the LLVM C compiler
PKG_ALTERNATIVE_SELECT.ccache-clang=	ok # non-empty
define PKG_ALTERNATIVE_SET.ccache-clang
  include ../../mk/sysdep/ccache.mk
  include ../../mk/sysdep/clang.mk

  DEPEND_ABI.ccache-clang=${DEPEND_ABI.ccache} ${DEPEND_ABI.clang}
  CPPFLAGS+=-Qunused-arguments # because of ccache

  export CC=	${CCACHE} ${CLANG}
  export CPP=	${CLANG} -E
endef

# compiler flags
include ../../mk/language/c-c++-flags.mk

endif # _language_c_mk -----------------------------------------------------
