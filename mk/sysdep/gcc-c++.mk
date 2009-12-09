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

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gcc-c++
endif

ifeq (+,$(GCC_C++_DEPEND_MK)) # --------------------------------------------

PREFER.gcc?=		system
PREFER.gcc-c++?=	${PREFER.gcc}

DEPEND_USE+=		gcc-c++

DEPEND_ABI.gcc-c++?=	gcc-c++${_GCC_REQUIRED}

SYSTEM_PKG.Linux-fedora.gcc-c++ =	gcc-c++
SYSTEM_PKG.Linux-ubuntu.gcc-c++ =	g++
SYSTEM_PKG.Linux-debian.gcc-c++ =	g++

SYSTEM_DESCR.gcc-c++ =	gcc C++ compiler, version ${_GCC_REQUIRED}
SYSTEM_SEARCH.gcc-c++ =\
	'bin/g++::% -dumpversion'	\
	'bin/cpp::% -dumpversion'

# make sure to use += here, for chainable compilers definitions.
ROBOTPKG_CXX+=$(word 1,${SYSTEM_FILES.gcc-c++})
ROBOTPKG_CXXCPP+=$(word 2,${SYSTEM_FILES.gcc-c++})

endif # GCC_C++_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

endif # ROBOTPKG_COMPILER_MK ===============================================
