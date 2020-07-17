# robotpkg language/c11.mk
# Created:			Anthony Mallet on Fri, 17 Jul 2020
#
ifndef _language_c11_mk
_language_c11_mk:=defined

include ../../mk/language/c.mk

#
# C11 compiler definitions for gcc
#
DEPEND_ABI.gcc += gcc>=4.9

CFLAGS+=$(strip \
  $(if $(filter gcc ccache-gcc,${PKG_ALTERNATIVE.c-compiler}),\
    $(if $(filter gcc-4%,${PKGVERSION.gcc}),-std=gnu11)))

endif # _language_c11_mk ---------------------------------------------------
