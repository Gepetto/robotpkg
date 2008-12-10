# $LAAS: gcc-c.mk 2008/12/10 23:36:59 tho $
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
USE_LANGUAGES+=	c

else

# If we are included from compiler-vars.mk, register the proper dependencies.

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GCC_C_DEPEND_MK:=	${GCC_C_DEPEND_MK}+

# Select gcc package according to the version required
#
ifneq (,$(shell ${PKG_ADMIN} pmatch 'gcc>=4.2<4.3' 'gcc-${_GCC_REQD}' && echo y))
  # gcc>=4.2<4.3 can be provided by lang/gcc42-c
  _GCC_C_PKG:=	gcc42-c
  _GCC_C_DIR:=	../../lang/gcc42-c
else
  ifneq (,$(shell ${PKG_ADMIN} pmatch 'gcc>=4<4.2' 'gcc-${_GCC_REQD}' && echo y))
    # gcc>=4<4.2 can be provided by lang/gcc4-c
    _GCC_C_PKG:=	gcc4-c
    _GCC_C_DIR:=	../../lang/gcc4-c
  else
    # no robotpkg package
    _GCC_C_PKG:=	gcc-c
    _GCC_C_DIR:=# empty
  endif
endif

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		${_GCC_C_PKG}
endif

ifeq (+,$(GCC_C_DEPEND_MK)) # ---------------------------------------------

PREFER.${_GCC_C_PKG}?=	system

DEPEND_USE+=		${_GCC_C_PKG}

DEPEND_ABI.${_GCC_C_PKG}?=${_GCC_C_PKG}>=${_GCC_REQD}
DEPEND_DIR.${_GCC_C_PKG}?=${_GCC_C_DIR}

SYSTEM_SEARCH.${_GCC_C_PKG}=	\
	'bin/gcc::% -dumpversion'	\
	'bin/cpp::% -dumpversion'

include ../../mk/robotpkg.prefs.mk
ifeq (robotpkg,${PREFER.${_GCC_C++_PKG}})
  override CC=${PREFIX.${_GCC_C_PKG}}/bin/gcc
  override CPP=${PREFIX.${_GCC_C_PKG}}/bin/cpp
else
  override CC=$(word 1,${SYSTEM_FILES.${_GCC_C_PKG}})
  override CPP=$(word 2,${SYSTEM_FILES.${_GCC_C_PKG}})
endif


endif # GCC4_C_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

endif # ROBOTPKG_COMPILER_MK
