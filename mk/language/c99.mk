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

C_COMPILER_FLAGS_NDEBUG+=\
  $(if $(filter gcc ccache-gcc,${PKG_ALTERNATIVE.c-compiler}),-std=c99)
C_COMPILER_FLAGS_DEBUG+=\
  $(if $(filter gcc ccache-gcc,${PKG_ALTERNATIVE.c-compiler}),-std=c99)

endif # _language_c99_mk ---------------------------------------------------
