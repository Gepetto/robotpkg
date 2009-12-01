# $LAAS: compiler-vars.mk 2009/11/28 23:44:50 tho $
#
# Copyright (c) 2006-2009 LAAS/CNRS
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice,  this list of  conditions and the following disclaimer in
#      the  documentation  and/or  other   materials provided  with  the
#      distribution.
#
# THIS  SOFTWARE IS PROVIDED BY  THE  COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND  ANY  EXPRESS OR IMPLIED  WARRANTIES,  INCLUDING,  BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES  OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR  PURPOSE ARE DISCLAIMED. IN  NO EVENT SHALL THE COPYRIGHT
# HOLDERS OR      CONTRIBUTORS  BE LIABLE FOR   ANY    DIRECT, INDIRECT,
# INCIDENTAL,  SPECIAL,  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF  SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR
# TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE   OF THIS SOFTWARE, EVEN   IF ADVISED OF   THE POSSIBILITY OF SUCH
# DAMAGE.
#
# From $NetBSD: compiler.mk,v 1.58 2006/12/03 08:34:45 seb Exp $
#
#                                      Anthony Mallet on Wed Dec  6 2006
#

# This Makefile fragment implements handling for supported C/C++/Fortran
# compilers.
#
# The following variables may be set by the robotpkg user in robotpkg.conf:
#
# ROBOTPKG_COMPILER
#	A list of values specifying the chain of compilers to be used by
#	robotpkg to build packages.
#
#	Valid values are:
#		ccache		compiler cache (chainable)
#		gcc		GNU
#
#	The default is "gcc".  You can use ccache with an appropriate
#	ROBOTPKG_COMPILER setting, e.g. "ccache gcc".  The chain should always
#	end in a real compiler. This should only be set in robotpkg.conf.
#
#
# The following variables may be set by a package:
#
# USE_LANGUAGES
#	Lists the languages used in the source code of the package,
#	and is used to determine the correct compilers to install.
#	Valid values are: c, c99, c++, fortran, java, objc.  The
#       default is "c".
#

ifndef ROBOTPKG_COMPILER_MK
ROBOTPKG_COMPILER_MK=	defined

# Add c support if c99 is set
ifneq (,$(filter c99,${USE_LANGUAGES}))
USE_LANGUAGES+=	c
endif

# List of supported compilers (yes, only one for now...) and pseudo compilers
# that can be chained
_COMPILERS=		gcc
_PSEUDO_COMPILERS=	ccache

# Compute the list of compilers for the current package
ifdef NOT_FOR_COMPILER
  _ACCEPTABLE_COMPILERS=$(filter-out ${NOT_FOR_COMPILER},${_COMPILERS})
else ifdef ONLY_FOR_COMPILER
  _ACCEPTABLE_COMPILERS=$(filter ${ONLY_FOR_COMPILER},${_COMPILERS})
else
  _ACCEPTABLE_COMPILERS=${_COMPILERS}
endif

# Select the compiler according to the user choice
ifneq (,${_ACCEPTABLE_COMPILERS})
  _COMPILER=$(firstword $(filter ${_ACCEPTABLE_COMPILERS},${ROBOTPKG_COMPILER}))
endif
ifeq (,${_COMPILER})
  PKG_FAIL_REASON+=\
	"$${bf}No acceptable compiler found for ${PKGNAME}.$${rm}"
  PKG_FAIL_REASON+= ""
  PKG_FAIL_REASON+=\
	"Please add one of the following compilers to your ROBOTPKG_COMPILER"
  PKG_FAIL_REASON+= "variable in robotpkg.conf:"
  PKG_FAIL_REASON+= ""
  PKG_FAIL_REASON+= "	${_ACCEPTABLE_COMPILERS}"
endif

# Prepend pseudo-compilers
_PSEUDO=$(filter ${_PSEUDO_COMPILERS},${ROBOTPKG_COMPILER})
_COMPILER:=${_PSEUDO} ${_COMPILER}


# Include compilers definitions
ROBOTPKG_CPP=
ROBOTPKG_CXXCPP=
ROBOTPKG_CC=
ROBOTPKG_CXX=
ROBOTPKG_FC=
$(call require,$(patsubst %,${ROBOTPKG_DIR}/mk/compiler/%.mk,${_COMPILER}))

# Remaining empty variables are explicitely set to 'false' so that missing
# languages in USE_LANGAGES are detected
#
ifeq (,${ROBOTPKG_CPP})
  override CPP=	${FALSE} "*** Missing USE_LANGUAGES+=c in package Makefile"
else
  override CPP=	$(strip ${ROBOTPKG_CPP})
endif
ifeq (,${ROBOTPKG_CXXPP})
  override CXXCPP=${CPP}
else
  override CXXCPP=${ROBOTPKG_CXXPP}
endif
ifeq (,${ROBOTPKG_CC})
  override CC=	${FALSE} "*** Missing USE_LANGUAGES+=c in package Makefile"
else
  override CC=	$(strip ${ROBOTPKG_CC})
endif
ifeq (,${ROBOTPKG_CXX})
  override CXX=	${FALSE} "*** Missing USE_LANGUAGES+=c++ in package Makefile"
else
  override CXX=	$(strip ${ROBOTPKG_CXX})
endif
ifeq (,${ROBOTPKG_FC})
  override FC=	${FALSE} "*** Missing USE_LANGUAGES+=fortran in package Makefile"
else
  override FC=	$(strip ${ROBOTPKG_FC})
endif

export CPP CXXCPP CC CXX FC

endif	# ROBOTPKG_COMPILER_MK
