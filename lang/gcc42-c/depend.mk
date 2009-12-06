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
#                                      Anthony Mallet on Fri Oct 17 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GCC42_C_DEPEND_MK:=	${GCC42_C_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		gcc42-c
endif

ifeq (+,$(GCC42_C_DEPEND_MK)) # --------------------------------------------

PREFER.gcc42?=		system
PREFER.gcc42-c?=	${PREFER.gcc42}

DEPEND_USE+=		gcc42-c

DEPEND_ABI.gcc42-c?=	gcc42-c>=4.2<4.3
DEPEND_DIR.gcc42-c?=	../../lang/gcc42-c

SYSTEM_DESCR.gcc42-c?=	'gcc C compiler, version 4.2'
SYSTEM_SEARCH.gcc42-c?=\
	'bin/gcc{42,}::% -dumpversion'	\
	'bin/cpp{42,}::% -dumpversion'

# make sure to use += here, for chainable compilers definitions.
ROBOTPKG_CC+=$(word 1,${SYSTEM_FILES.gcc42-c})
ROBOTPKG_CPP+=$(word 2,${SYSTEM_FILES.gcc42-c})

endif # GCC42_C_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
