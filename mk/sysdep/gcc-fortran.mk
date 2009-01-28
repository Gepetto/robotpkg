# $LAAS: gcc-fortran.mk 2009/01/26 17:01:13 mallet $
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

ifndef ROBOTPKG_COMPILER_MK

# If we are included directly, simply register the compiler requirements
USE_LANGUAGES+=	fortan

else

# If we are included from compiler-vars.mk, register the proper dependencies.

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GCC_FORTRAN_DEPEND_MK:=	${GCC_FORTRAN_DEPEND_MK}+

# Select gcc package according to the version required
#
ifneq (,$(shell ${PKG_ADMIN} pmatch 'gcc>=4.2<4.3' 'gcc-${_GCC_REQD}' && echo y))
  # gcc>=4.2<4.3 can be provided by lang/gcc42-fortran
  _GCC_FORTRAN_BIN:=	gfortran
  _GCC_FORTRAN_PKG:=	gcc42-fortran
  _GCC_FORTRAN_DIR:=	../../lang/gcc42-fortran
else
  ifneq (,$(shell ${PKG_ADMIN} pmatch 'gcc>=4<4.2' 'gcc-${_GCC_REQD}' && echo y))
    # gcc>=4<4.2 can be provided by lang/gcc4-fortran
    _GCC_FORTRAN_BIN:=	gfortran
    _GCC_FORTRAN_PKG:=	gcc4-fortran
    _GCC_FORTRAN_DIR:=	../../lang/gcc4-fortran
  else
    # no robotpkg package
    _GCC_FORTRAN_BIN:=	{g77,gfortran}
    _GCC_FORTRAN_PKG:=	gcc-fortran
    _GCC_FORTRAN_DIR:=# empty
  endif
endif

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		${_GCC_FORTRAN_PKG}
endif

ifeq (+,$(GCC_FORTRAN_DEPEND_MK)) # ----------------------------------------

PREFER.${_GCC_FORTRAN_PKG}?=	system

DEPEND_USE+=			${_GCC_FORTRAN_PKG}

DEPEND_ABI.${_GCC_FORTRAN_PKG}?=${_GCC_FORTRAN_PKG}>=${_GCC_REQD}
DEPEND_DIR.${_GCC_FORTRAN_PKG}?=${_GCC_FORTRAN_DIR}

SYSTEM_SEARCH.${_GCC_FORTRAN_PKG}=	\
	'bin/${_GCC_FORTRAN_BIN}:1s/[^0-9.]*\\([0-9.]*\\).*$$/\\1/p:% -dumpversion'

include ../../mk/robotpkg.prefs.mk
ifeq (robotpkg,${PREFER.${_GCC_FORTRAN_PKG}})
  override FC=${PREFIX.${_GCC_FORTRAN_PKG}}/bin/gfortran
else
  override FC=$(word 1,${SYSTEM_FILES.${_GCC_FORTRAN_PKG}})
endif

endif # GCC_FORTRAN_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

endif # ROBOTPKG_COMPILER_MK
