#
# Copyright (c) 2006-2013 LAAS/CNRS
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

# The following variables may be set by a package:
#
# USE_LANGUAGES
#	Lists the languages used in the source code of the package,
#	and is used to determine the correct compilers to install.
#	Valid values are: c, c++, fortran.  The default is "c".
#

# Include compilers definitions.
# Compilers explicitely default to 'false' so that missing languages
# dependencies are detected
#
ifneq (,$(filter c,${USE_LANGUAGES}))
  include ${ROBOTPKG_DIR}/mk/language/c.mk
endif
ifneq (,$(filter c++,${USE_LANGUAGES}))
  include ${ROBOTPKG_DIR}/mk/language/c++.mk
endif
ifneq (,$(filter fortran,${USE_LANGUAGES}))
  include ${ROBOTPKG_DIR}/mk/language/fortran.mk
endif
