#
# Copyright (c) 2006,2008-2010 LAAS/CNRS
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
  _GCC_REQUIRED:=$(call versionreqd,${GCC_REQUIRED})
endif
ifeq (,$(_GCC_REQUIRED))
  PKG_FAIL_REASON+="The following requirements on gcc version cannot be satisfied:"
  PKG_FAIL_REASON+=""
  PKG_FAIL_REASON+="	GCC_REQUIRED = ${GCC_REQUIRED}"
  _GCC_REQUIRED:= >=2.8
endif


# GNU ld option used to set the rpath.
ifeq (yes,$(call isyes,${_USE_RPATH}))
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

endif # COMPILER_GCC_MK
