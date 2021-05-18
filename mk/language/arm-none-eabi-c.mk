# robotpkg language/arm-none-eabi-c.mk
# Created:			Anthony Mallet on Tue, 18 May 2021
#
ifndef _language_arm-none-eabi_c_mk
_language_arm-none-eabi_c_mk:=defined

#
# arm-none-eabi C compiler definitions
#

# define an alternative for available arm-none-eabi-c-compilers packages
PKG_ALTERNATIVES+=			arm-none-eabi-c-compiler
PKG_ALTERNATIVES.arm-none-eabi-c-compiler=	arm-none-eabi-gcc
PREFER_ALTERNATIVE.arm-none-eabi-c-compiler?=	arm-none-eabi-gcc

PREFER.arm-none-eabi-c-compiler?=	system
DEPEND_ABI.arm-none-eabi-c-compiler=	arm-none-eabi-c-compiler

PKG_ALTERNATIVE_DESCR.arm-none-eabi-gcc=	Use the GNU C compiler
PKG_ALTERNATIVE_SELECT.arm-none-eabi-gcc=	ok # non-empty
define PKG_ALTERNATIVE_SET.arm-none-eabi-gcc
  include ../../mk/sysdep/arm-none-eabi-gcc.mk

  export CC=	${ARM_NONE_EABI_GCC}
  export CPP=	${ARM_NONE_EABI_GCC} -E
endef

# compiler flags
include ../../mk/language/c-c++-flags.mk

endif # _language_arm-none-eabi_c_mk ---------------------------------------
