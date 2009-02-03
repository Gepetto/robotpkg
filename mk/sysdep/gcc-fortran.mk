# $LAAS: gcc-fortran.mk 2009/02/03 19:07:16 mallet $
#
# Copyright (c) 2009 LAAS/CNRS
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

# Select gcc package according to the version required. If the package provided
# by lang/gcc42 matches the requirements, use this one. Otherwise, rely on the
# system.
#
ifeq (y,$(shell ${PKG_ADMIN} pmatch 'gcc${_GCC_REQUIRED}' 'gcc-4.2.4' && echo y))
  _GCC_FORTRAN_BIN:=	gfortran
  _GCC_PKG:=		gcc42
  _GCC_FORTRAN_PKG:=	gcc42-fortran
  _GCC_FORTRAN_DIR:=	../../lang/gcc42-fortran
else
  _GCC_FORTRAN_BIN:=	{gfortran,g77}
  _GCC_PKG:=		gcc
  _GCC_FORTRAN_PKG:=	gcc-fortran
  _GCC_FORTRAN_DIR:=# empty
endif

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		${_GCC_FORTRAN_PKG}
endif

ifeq (+,$(GCC_FORTRAN_DEPEND_MK)) # ----------------------------------------

PREFER.gcc?=			system
PREFER.${_GCC_PKG}?=		${PREFER.gcc}
PREFER.${_GCC_FORTRAN_PKG}?=	${PREFER.${_GCC_PKG}}

DEPEND_USE+=			${_GCC_FORTRAN_PKG}

DEPEND_ABI.${_GCC_FORTRAN_PKG}?=${_GCC_FORTRAN_PKG}${_GCC_REQUIRED}
DEPEND_DIR.${_GCC_FORTRAN_PKG}?=${_GCC_FORTRAN_DIR}

SYSTEM_DESCR.${_GCC_FORTRAN_PKG}='gcc Fortran77 compiler, version ${_GCC_REQUIRED}'
SYSTEM_SEARCH.${_GCC_FORTRAN_PKG}=	\
	'bin/${_GCC_FORTRAN_BIN}:1s/[^0-9.]*\\([0-9.]*\\).*$$/\\1/p:% -dumpversion'

include ../../mk/robotpkg.prefs.mk
ifeq (robotpkg,${PREFER.${_GCC_FORTRAN_PKG}})
  override FC=${PREFIX.${_GCC_FORTRAN_PKG}}/bin/gfortran
else
  override FC=$(word 1,${SYSTEM_FILES.${_GCC_FORTRAN_PKG}})
endif

endif # GCC_FORTRAN_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

endif # ROBOTPKG_COMPILER_MK ===============================================
