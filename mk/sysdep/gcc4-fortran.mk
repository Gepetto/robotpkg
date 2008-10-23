# $LAAS: gcc4-fortran.mk 2008/10/23 12:45:45 mallet $
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
#                                      Anthony Mallet on Web Oct 22 2008
#

ifndef ROBOTPKG_COMPILER_MK

# If we are included directly, simply register the compiler requirements
GCC_REQD+=	4.0
USE_LANGUAGES+=	fortran

else

# If we are included from compiler-vars.mk, register the proper dependencies.
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GCC4_FORTRAN_DEPEND_MK:=	${GCC4_FORTRAN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gcc42-fortran
endif

ifeq (+,$(GCC4_FORTRAN_DEPEND_MK)) # ---------------------------------------

PREFER.gcc42-fortran?=		system

DEPEND_USE+=			gcc42-fortran

DEPEND_ABI.gcc42-fortran?=	gcc42-fortran>=${_GCC_REQD}
DEPEND_DIR.gcc42-fortran?=	../../lang/gcc42-fortran

DEPEND_LIBS.gcc42-fortran+=	-lgfortran

SYSTEM_SEARCH.gcc42-fortran=	\
	'bin/gfortran:s/[^0-9.]*\\([0-9.]*\\).*/\\1/p:% -dumpversion'	\
	'lib/libgfortran.so*'

FC=${PREFIX.gcc42-fortran}/bin/gfortran

endif # GCC4_FORTRAN_DEPEND_MK ---------------------------------------------

endif # ROBOTPKG_COMPILER_MK
