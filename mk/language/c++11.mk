# robotpkg language/c++11.mk
# Created:			Anthony Mallet on Tue, 4 Sep 2018
#
ifndef _language_c++11_mk
_language_c++11_mk:=defined

include ../../mk/language/c++.mk

#
# C++11 compiler definitions for g++
#
DEPEND_ABI.g++ += g++>=4.8

define _c++11_flags

  CXX+= -std=c++11
endef

PKG_ALTERNATIVE_SET.g++:=\
  $(value PKG_ALTERNATIVE_SET.g++)$(value _c++11_flags)
PKG_ALTERNATIVE_SET.ccache-g++:=\
  $(value PKG_ALTERNATIVE_SET.ccache-g++)$(value _c++11_flags)

endif # _language_c++11_mk -------------------------------------------------
