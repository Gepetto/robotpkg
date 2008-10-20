# $LAAS: depend.mk 2008/10/20 16:45:51 mallet $
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
#                                      Anthony Mallet on Thu Feb 28 2008
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GCC42_FORTRAN_DEPEND_MK:=	${GCC42_FORTRAN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gcc42-fortran
endif

ifeq (+,$(GCC42_FORTRAN_DEPEND_MK)) # --------------------------------

PREFER.gcc42-fortran?=		system

DEPEND_USE+=			gcc42-fortran

DEPEND_ABI.gcc42-fortran?=	gcc42-fortran>=4.2
DEPEND_DIR.gcc42-fortran?=	../../lang/gcc42-fortran

DEPEND_LIBS.gcc42-fortran+=	-lgfortran

SYSTEM_SEARCH.gcc42-fortran=	\
	'bin/gfortran:/[0-9.]/s/[^0-9.]//gp:% -dumpversion'	\
	'lib/libgfortran.so*'

endif # GCC42_FORTRAN_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
