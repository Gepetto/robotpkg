# robotpkg language/avr-c.mk
# Created:			Anthony Mallet on Wed, 11 Feb 2015
#
ifndef _language_avr_c_mk
_language_avr_c_mk:=defined

#
# AVR C compiler definitions
#

# define an alternative for available avr-c-compilers packages
PKG_ALTERNATIVES+=			avr-c-compiler
PKG_ALTERNATIVES.avr-c-compiler=	avr-gcc
PREFER_ALTERNATIVE.avr-c-compiler?=	avr-gcc

PREFER.avr-c-compiler?=		system
DEPEND_ABI.avr-c-compiler=	avr-c-compiler

PKG_ALTERNATIVE_DESCR.avr-gcc=	Use the GNU C compiler
PKG_ALTERNATIVE_SELECT.avr-gcc=	ok # non-empty
define PKG_ALTERNATIVE_SET.avr-gcc
  include ../../mk/sysdep/avr-gcc.mk

  export CC=	${AVR_GCC}
  export CPP=	${AVR_GCC} -E
endef

# compiler flags
include ../../mk/language/c-c++-flags.mk

endif # _language_avr_c_mk -------------------------------------------------
