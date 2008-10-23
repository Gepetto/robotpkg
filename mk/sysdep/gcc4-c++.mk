# $LAAS: gcc4-c++.mk 2008/10/23 15:59:57 mallet $
#
# Copyright (c) 2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Anthony Mallet on Thu Oct 23 2008
#

ifndef ROBOTPKG_COMPILER_MK

# If we are included directly, simply register the compiler requirements
GCC_REQD+=	4.0
USE_LANGUAGES+=	c++

else

# If we are included from compiler-vars.mk, register the proper dependencies.

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GCC4_C++_DEPEND_MK:=	${GCC4_C++_DEPEND_MK}+

# Require g++>=4.2 from lang/gcc42-c++
ifneq (,$(shell ${PKG_ADMIN} pmatch 'gcc>=4.2' 'gcc-${_GCC_REQD}' && echo y))
  _GCC_C++_PKG:=	gcc42-c++
  _GCC_C++_DIR:=	../../lang/gcc42-c++
else
  _GCC_C++_PKG:=	gcc4-c++
  _GCC_C++_DIR:=# empty
endif

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		${_GCC_C++_PKG}
endif

ifeq (+,$(GCC4_C++_DEPEND_MK)) # -------------------------------------------

PREFER.${_GCC_C++_PKG}?=	system

DEPEND_USE+=			${_GCC_C++_PKG}

DEPEND_ABI.${_GCC_C++_PKG}?=	${_GCC_C++_PKG}>=${_GCC_REQD}
DEPEND_DIR.${_GCC_C++_PKG}?=	${_GCC_C++_DIR}

SYSTEM_SEARCH.${_GCC_C++_PKG} =	\
	'bin/g++::% -dumpversion'

CXX=${PREFIX.${_GCC_C++_PKG}}/bin/g++

endif # GCC4_C++_DEPEND_MK -------------------------------------------------

endif # ROBOTPKG_COMPILER_MK
