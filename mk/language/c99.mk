# robotpkg language/c99.mk
# Created:			Anthony Mallet on Wed, 22 Aug 2018
#
ifndef _language_c99_mk
_language_c99_mk:=defined

include ../../mk/language/c.mk

#
# C99 compiler definitions for gcc
#
DEPEND_ABI.gcc += gcc>=4.5

define _c99_flags

  CC+= -std=c99
endef

PKG_ALTERNATIVE_SET.gcc:=\
  $(value PKG_ALTERNATIVE_SET.gcc)$(value _c99_flags)
PKG_ALTERNATIVE_SET.ccache-gcc:=\
  $(value PKG_ALTERNATIVE_SET.ccache-gcc)$(value _c99_flags)

endif # _language_c99_mk ---------------------------------------------------
