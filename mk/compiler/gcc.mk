# $LAAS: gcc.mk 2009/10/28 17:09:13 mallet $
#
# Copyright (c) 2006,2008-2009 LAAS/CNRS
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
#
# The following variables may be set by a package:
#
# GCC_REQUIRED
#	A list of constraints on gcc version number used to determine the
#	range of allowed versions of GCC required by a package. This list
#	should contain patterns suitable for evaluation by "robotpkg_admin
#	pmatch", i.e. optionaly start with >,>=,<= or < and followed by a
#	version number (see robotpkg_info(1)). This value should only be
#	appended to by a package Makefile.
#

ifndef COMPILER_GCC_MK
COMPILER_GCC_MK:=	defined

# Sensible default value for _GCC_REQUIRED
#
_GCC_REQUIRED?=	>=2.8

# Distill the GCC_REQUIRED list into a single _GCC_REQUIRED value that is the
# strictest versions of GCC required.
#
ifdef GCC_REQUIRED
  $(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)

  # split constraints into <= and >= categories
  _equ_:=$(patsubst -%,%,$(filter-out <%,$(filter-out >%,${GCC_REQUIRED})))
  _min_:=$(sort $(filter >%,${GCC_REQUIRED}) $(addprefix >=,${_equ_}))
  _max_:=$(sort $(filter <%,${GCC_REQUIRED}) $(addprefix <=,${_equ_}))

  # find out the strictest constraint of type >=, please breathe
  _maxmin_:=\
    $(firstword $(foreach _rqd_,${_min_},$(if $(strip 			\
    $(foreach _sat_,$(filter-out ${_rqd_},${_min_} ${_max_}),$(shell	\
    ${PKG_ADMIN} pmatch 'x${_sat_}' 'x-$(call substs,> >=,,${_rqd_})' ||\
    echo no))),,${_rqd_})))

  # breathe, then find out the strictest constraint of type <=
  _minmax_:=\
    $(firstword $(foreach _rqd_,${_max_},$(if $(strip			\
    $(foreach _sat_,$(filter-out ${_rqd_},${_min_} ${_max_}),$(shell	\
    ${PKG_ADMIN} pmatch 'x${_sat_}' 'x-$(call substs,< <=,,${_rqd_})' ||\
    echo no))),,${_rqd_})))

  # _GCC_REQUIRED is the union of both
  _GCC_REQUIRED:=	${_maxmin_}${_minmax_}
endif
ifeq (,$(_GCC_REQUIRED))
  PKG_FAIL_REASON+=	${hline}
  PKG_FAIL_REASON+=	"The following requirements on gcc version cannot be satisfied:"
  PKG_FAIL_REASON+=	""
  PKG_FAIL_REASON+=	"	GCC_REQUIRED = ${GCC_REQUIRED}"
  PKG_FAIL_REASON+=	""
  PKG_FAIL_REASON+=	"Reverting to sane default >=2.8"
  PKG_FAIL_REASON+=	${hline}
  _GCC_REQUIRED:= >=2.8
endif

# Select required compilers based on COMPILER_TARGET and USE_LANGUAGES.
#
ifneq (,$(strip ${USE_LANGUAGES}))
  $(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)
endif

ifeq (i386-mingw32,${COMPILER_TARGET})
  ifneq (,$(filter c c++,${USE_LANGUAGES}))
    include ${ROBOTPKG_DIR}/cross/i386-mingw32/depend.mk
  endif
else
  ifneq (,$(filter c,${USE_LANGUAGES}))
    include ${ROBOTPKG_DIR}/mk/sysdep/gcc-c.mk
  endif
  ifneq (,$(filter c++,${USE_LANGUAGES}))
    include ${ROBOTPKG_DIR}/mk/sysdep/gcc-c++.mk
  endif
  ifneq (,$(filter fortran,${USE_LANGUAGES}))
    include ${ROBOTPKG_DIR}/mk/sysdep/gcc-fortran.mk
  endif
endif

## GNU ld option used to set the rpath.
ifeq (yes,${_USE_RPATH})
  LINKER_RPATH_FLAG=	-rpath
  COMPILER_RPATH_FLAG=	-Wl,${LINKER_RPATH_FLAG},
endif



# --- compiler options -----------------------------------------------------
#
# Each compiler can define the _CFLAGS_DEBUG and _CFLAGS_NDEBUG flags
# corresponding to the common `debug' option.
#
_CFLAGS_DEBUG?=	-g -O0 -Wall
_CFLAGS_NDEBUG?=-O3 -DNDEBUG

endif	# COMPILER_GCC_MK
