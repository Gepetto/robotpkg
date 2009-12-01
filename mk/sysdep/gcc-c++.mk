# $LAAS: gcc-c++.mk 2009/11/28 23:33:39 tho $
#
# Copyright (c) 2008-2009 LAAS/CNRS
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

ifndef ROBOTPKG_COMPILER_MK # ==============================================

# If we are included directly, simply register the compiler requirements
USE_LANGUAGES+=	c++

else # =====================================================================

# If we are included from compiler-vars.mk, register the proper dependencies.

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GCC_C++_DEPEND_MK:=	${GCC_C++_DEPEND_MK}+

# Select gcc package according to the version required. If the package provided
# by lang/gcc42 matches the requirements, use this one. Otherwise, rely on the
# system.
#
ifneq (,$(shell ${PKG_ADMIN} pmatch 'gcc${_GCC_REQUIRED}' 'gcc-4.2.4' && echo y))
  _GCC_PKG:=		gcc42
  _GCC_C++_PKG:=	gcc42-c++
  _GCC_C++_DIR:=	../../lang/gcc42-c++
else
  _GCC_PKG:=		gcc
  _GCC_C++_PKG:=	gcc-c++
  _GCC_C++_DIR:=# empty
endif

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		${_GCC_C++_PKG}
endif

ifeq (+,$(GCC_C++_DEPEND_MK)) # --------------------------------------------

PREFER.gcc?=			system
PREFER.${_GCC_PKG}?=		${PREFER.gcc}
PREFER.${_GCC_C++_PKG}?=	${PREFER.${_GCC_PKG}}

DEPEND_USE+=			${_GCC_C++_PKG}

DEPEND_ABI.${_GCC_C++_PKG}?=	${_GCC_C++_PKG}${_GCC_REQUIRED}
DEPEND_DIR.${_GCC_C++_PKG}?=	${_GCC_C++_DIR}

SYSTEM_PKG.Linux-fedora.${_GCC_C++_PKG}=	gcc-c++
SYSTEM_PKG.Linux-ubuntu.${_GCC_C++_PKG}=	g++
SYSTEM_PKG.Linux-debian.${_GCC_C++_PKG}=	g++

SYSTEM_DESCR.${_GCC_C++_PKG}=	'gcc C++ compiler, version ${_GCC_REQUIRED}'
SYSTEM_SEARCH.${_GCC_C++_PKG} =\
	'bin/g++::% -dumpversion'	\
	'bin/cpp::% -dumpversion'

# make sure to use += here, for chainable compilers definitions.
ROBOTPKG_CXX+=$(word 1,${SYSTEM_FILES.${_GCC_C++_PKG}})
ROBOTPKG_CXXCPP+=$(word 2,${SYSTEM_FILES.${_GCC_C++_PKG}})

endif # GCC_C++_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

endif # ROBOTPKG_COMPILER_MK ===============================================
