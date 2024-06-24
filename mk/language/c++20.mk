# robotpkg language/c++20.mk
# Created:			Anthony Mallet on Mon, 24 Jun 2024
#
ifndef _language_c++20_mk
_language_c++20_mk:=defined

include ../../mk/language/c++.mk

#
# C++20 compiler definitions for g++
#
DEPEND_ABI.g++ += g++>=8

CXXFLAGS+=$(strip \
  $(if $(filter g++ ccache-g++,${PKG_ALTERNATIVE.c++-compiler}),\
    $(if $(filter gcc-8% gcc-9%,${PKGVERSION.gcc}),-std=gnu++2a) \
    $(if $(filter gcc-10% gcc-11% gcc-12% gcc-13% gcc-14%,\
      ${PKGVERSION.gcc}),-std=gnu++20)))

endif # _language_c++20_mk -------------------------------------------------
