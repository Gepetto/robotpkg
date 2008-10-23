# $LAAS: gcc.mk 2008/10/23 16:20:57 mallet $
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


# Select required compilers based on _GCC_REQD.
#
ifneq (,$(shell ${PKG_ADMIN} pmatch 'gcc>=4.0' 'gcc-${_GCC_REQD}' && echo y))
  # Require C from sysdep
  ifneq (,$(filter c,${USE_LANGUAGES}))
    include ${ROBOTPKG_DIR}/mk/sysdep/gcc4-c.mk
  endif

  # Require C++ from sysdep
  ifneq (,$(filter c++,${USE_LANGUAGES}))
    include ${ROBOTPKG_DIR}/mk/sysdep/gcc4-c++.mk
  endif

  # Require fortran from sysdep
  ifneq (,$(filter fortran,${USE_LANGUAGES}))
    include ${ROBOTPKG_DIR}/mk/sysdep/gcc4-fortran.mk
  endif
endif

## GNU ld option used to set the rpath
LINKER_RPATH_FLAG=	-R

## GCC passes rpath directives to the linker using "-Wl,-R".
COMPILER_RPATH_FLAG=	-Wl,${LINKER_RPATH_FLAG}


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
