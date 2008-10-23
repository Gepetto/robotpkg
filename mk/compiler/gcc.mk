# $LAAS: gcc.mk 2008/10/23 14:09:33 mallet $
#
# Copyright (c) 2006,2008 LAAS/CNRS
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice,  this list of  conditions and  the following disclaimer in
#      the  documentation   and/or  other  materials   provided with  the
#      distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
# ANY  EXPRESS OR IMPLIED WARRANTIES, INCLUDING,  BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES   OF MERCHANTABILITY AND  FITNESS  FOR  A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO  EVENT SHALL THE AUTHOR OR  CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT,  INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING,  BUT  NOT LIMITED TO, PROCUREMENT  OF
# SUBSTITUTE  GOODS OR SERVICES;  LOSS   OF  USE,  DATA, OR PROFITS;   OR
# BUSINESS  INTERRUPTION) HOWEVER CAUSED AND  ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE  USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# From $NetBSD: gcc.mk,v 1.86 2006/12/02 22:32:59 jschauma Exp $
#
#					Anthony Mallet on Wed Dec  6 2006
#

#
# This is the compiler definition for the GNU Compiler Collection.
#

ifndef COMPILER_GCC_MK
COMPILER_GCC_MK=	defined

include ../../mk/robotpkg.prefs.mk

GCC_REQD+=	2.8.0

# Distill the GCC_REQD list into a single _GCC_REQD value that is the
# highest version of GCC required.
#
_GCC_REQD=$(firstword $(foreach _rqd_,${GCC_REQD},$(if	\
  $(strip $(foreach _sat_,${GCC_REQD},$(shell				\
    ${PKG_ADMIN} pmatch 'gcc>=${_sat_}' 'gcc-${_rqd_}' || echo n))	\
  ),,${_rqd_})))

# Require gcc>=4.2 from lang/gcc42
ifneq (,$(shell ${PKG_ADMIN} pmatch 'gcc>=4.2' 'gcc-${_GCC_REQD}' && echo y))
  ifneq (,$(filter c,${USE_LANGUAGES}))
    include ${ROBOTPKG_DIR}/lang/gcc42-c/depend.mk
  endif
  ifneq (,$(filter c++,${USE_LANGUAGES}))
    include ${ROBOTPKG_DIR}/lang/gcc42-c++/depend.mk
  endif
  ifneq (,$(filter fortran,${USE_LANGUAGES}))
    include ${ROBOTPKG_DIR}/lang/gcc42-fortran/depend.mk
    FC=${PREFIX.gcc42-fortran}/bin/gfortran
  endif
endif

# Require fortran from sysdep
ifneq (,$(filter fortran,${USE_LANGUAGES}))
  ifneq (,$(shell ${PKG_ADMIN} pmatch 'gcc>=4.0' 'gcc-${_GCC_REQD}' && echo y))
    include ${ROBOTPKG_DIR}/mk/sysdep/gcc4-fortran.mk
  endif
endif

## _CC is the full path to the compiler named by ${CC} if it can be found.
ifndef _CC
  ifneq (,$(realpath ${CC}))
    _CC:=	${CC}
  else
    _CC:=	$(call pathsearch,${CC},${PATH})
    ifeq (,$(strip ${_CC}))
      _CC:=	${CC}
    endif
  endif
MAKEOVERRIDES+=	_CC=$(call quote,${_CC})
endif

ifndef _GCC_VERSION
_GCC_VERSION_STRING:=\
	$(shell ${_CC} -v 2>&1 | ${GREP} 'gcc version' 2>/dev/null || ${ECHO} 0)
  ifneq (,$(filter gcc%,${_GCC_VERSION_STRING}))
_GCC_VERSION:=	$(shell ${_CC} -dumpversion)
  else
_GCC_VERSION=	0
  endif
endif

## Check if we are using robotpkg gcc
ifneq (,$(filter ${LOCALBASE}/%,${_CC}))
_IS_ROBOTPKG_GCC=	yes
else
_IS_ROBOTPKG_GCC=	no
endif

_GCCBINDIR=		$(dirname ${_CC})

## GNU ld option used to set the rpath
LINKER_RPATH_FLAG=	-R

## GCC passes rpath directives to the linker using "-Wl,-R".
COMPILER_RPATH_FLAG=	-Wl,${LINKER_RPATH_FLAG}


## Point the variables that specify the compiler to the installed
## GCC executables.
##
#_GCC_DIR=	${WRKDIR}/.gcc
#_GCC_VARS=	# empty

#_GCCBINDIR=	${_CC:H}
#.endif
#.if exists(${_GCCBINDIR}/gcc)
#_GCC_VARS+=	CC
#_GCC_CC=	${_GCC_DIR}/bin/gcc
#_ALIASES.CC=	cc gcc
#CCPATH=		${_GCCBINDIR}/gcc
#PKG_CC:=	${_GCC_CC}
#.endif
#.if exists(${_GCCBINDIR}/cpp)
#_GCC_VARS+=	CPP
#_GCC_CPP=	${_GCC_DIR}/bin/cpp
#_ALIASES.CPP=	cpp
#CPPPATH=	${_GCCBINDIR}/cpp
#PKG_CPP:=	${_GCC_CPP}
#.endif
#.if exists(${_GCCBINDIR}/g++)
#_GCC_VARS+=	CXX
#_GCC_CXX=	${_GCC_DIR}/bin/g++
#_ALIASES.CXX=	c++ g++
#CXXPATH=	${_GCCBINDIR}/g++
#PKG_CXX:=	${_GCC_CXX}
#.endif


# --- common compiler options ----------------------------------------
#

ifndef NO_BUILD
PKG_SUPPORTED_OPTIONS+=		debug

PKG_OPTION_DESCR.debug:=	Produce debugging information for binary programs

define PKG_OPTION_SET.debug
  CFLAGS+=	-g -O0 -Wall
  CXXFLAGS+=	-g -O0 -Wall
endef

define PKG_OPTION_UNSET.debug
  CFLAGS+=	-O3 -DNDEBUG
  CXXFLAGS+=	-O3 -DNDEBUG
endef

endif	# NO_BUILD

endif	# COMPILER_GCC_MK
