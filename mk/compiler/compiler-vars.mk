# $LAAS: compiler-vars.mk 2009/03/09 21:32:23 tho $
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
# The following variables may be set by the pkgsrc user in mk.conf:
#
# PKGSRC_COMPILER - XXX NOT SUPPORTED YET
#	A list of values specifying the chain of compilers to be used by
#	pkgsrc to build packages.
#
#	Valid values are:
#		ccc		Compaq C Compilers (Tru64)
#		ccache		compiler cache (chainable)
#		distcc		distributed C/C++ (chainable)
#		f2c		Fortran 77 to C compiler (chainable)
#		icc		Intel C++ Compiler (Linux)
#		ido		SGI IRIS Development Option cc (IRIX 5)
#		gcc		GNU
#		mipspro		Silicon Graphics, Inc. MIPSpro (n32/n64)
#		mipspro-ucode	Silicon Graphics, Inc. MIPSpro (o32)
#		sunpro		Sun Microsystems, Inc. WorkShip/Forte/Sun
#				ONE Studio
#		xlc		IBM's XL C/C++ compiler suite (Darwin/MacOSX)
#
#	The default is "gcc".  You can use ccache and/or distcc with
#	an appropriate PKGSRC_COMPILER setting, e.g. "ccache distcc
#	gcc".  You can also use "f2c" to overlay the lang/f2c package
#	over the C compiler instead of using the system Fortran
#	compiler.  The chain should always end in a real compiler.
#	This should only be set in /etc/mk.conf.
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

_COMPILERS=		ccc gcc icc ido mipspro mipspro-ucode sunpro xlc
_PSEUDO_COMPILERS=	ccache distcc f2c

ifneq (,${NOT_FOR_COMPILER})
_ACCEPTABLE_COMPILERS+=	$(filter-out ${NOT_FOR_COMPILER},${_COMPILERS})
else
  ifneq (,${ONLY_FOR_COMPILER})
_ACCEPTABLE_COMPILERS+=	$(filter ${ONLY_FOR_COMPILER},${_COMPILERS})
  else
_ACCEPTABLE_COMPILERS+=	${_COMPILERS}
  endif
endif

ifneq (,${_ACCEPTABLE_COMPILERS})
_COMPILER=$(firstword $(filter ${_ACCEPTABLE_COMPILERS},${PKGSRC_COMPILER}))
endif

ifeq (,${_COMPILER})
PKG_FAIL_REASON+=	"No acceptable compiler found for ${PKGNAME}."
endif

_PKGSRC_COMPILER=	$(filter ${_PSEUDO_COMPILERS},${PKGSRC_COMPILER}) ${_COMPILER}

include $(patsubst %,${ROBOTPKG_DIR}/mk/compiler/%.mk,${_PKGSRC_COMPILER})

endif	# ROBOTPKG_COMPILER_MK
