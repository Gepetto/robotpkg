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
#                                      Anthony Mallet on Thu Feb 28 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GCC42_FORTRAN_DEPEND_MK:=${GCC42_FORTRAN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gcc42-fortran
endif

ifeq (+,$(GCC42_FORTRAN_DEPEND_MK)) # --------------------------------------

PREFER.gcc42?=			system
PREFER.gcc42-fortran?=		${PREFER.gcc42}

DEPEND_USE+=			gcc42-fortran

DEPEND_ABI.gcc42-fortran?=	gcc42-fortran>=4.2<4.3
DEPEND_DIR.gcc42-fortran?=	../../lang/gcc42-fortran

SYSTEM_DESCR.gcc42-fortran=	gcc Fortran77 compiler, version 4.2
SYSTEM_SEARCH.gcc42-fortran=	\
	'bin/gfortran{42,}:1s/[^0-9.]*\([0-9.]*\).*$$/\1/p:% -dumpversion'

# make sure to use += here, for chainable compilers definitions.
ROBOTPKG_FC+=$(word 1,${SYSTEM_FILES.gcc42-fortran})

CMAKE_ARGS+=	-DCMAKE_SHARED_LIBRARY_SONAME_Fortran_FLAG=-Wl,-soname,

endif # GCC42_FORTRAN_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
