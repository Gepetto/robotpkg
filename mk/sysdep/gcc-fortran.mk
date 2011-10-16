#
# Copyright (c) 2009,2011 LAAS/CNRS
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
#                                      Anthony Mallet on Mon Jan 26 2009
#

ifndef ROBOTPKG_COMPILER_MK # ==============================================

# If we are included directly, simply register the compiler requirements
USE_LANGUAGES+=	fortan

else # =====================================================================

# If we are included from compiler-vars.mk, register the proper dependencies.

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GCC_FORTRAN_DEPEND_MK:=	${GCC_FORTRAN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		${_GCC_FORTRAN_PKG}
endif

ifeq (+,$(GCC_FORTRAN_DEPEND_MK)) # ----------------------------------------

PREFER.gcc?=			system
PREFER.gcc-fortran?=		${PREFER.gcc}

DEPEND_USE+=			gcc-fortran

DEPEND_ABI.gcc-fortran?=	gcc-fortran${_GCC_REQUIRED}

SYSTEM_PKG.Fedora.gcc-fortran=	gcc-gfortran
SYSTEM_PKG.Ubuntu.gcc-fortran=	gfortran

SYSTEM_DESCR.gcc-fortran=	gcc Fortran77 compiler, version ${_GCC_REQUIRED}
SYSTEM_SEARCH.gcc-fortran=	\
	'{,gcc[0-9]*/}bin/{gfortran,g77}:${_vregex.gcc-fortran}:% -dumpversion'
_vregex.gcc-fortran=1s/[^0-9.]*\([0-9.]*\).*$$/\1/p

# make sure to use += here, for chainable compilers definitions.
ROBOTPKG_FC+=$(word 1,${SYSTEM_FILES.gcc-fortran})

CMAKE_ARGS+=	-DCMAKE_SHARED_LIBRARY_SONAME_Fortran_FLAG=-Wl,-soname,

endif # GCC_FORTRAN_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

endif # ROBOTPKG_COMPILER_MK ===============================================
