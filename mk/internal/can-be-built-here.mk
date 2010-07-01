#
# Copyright (c) 2007,2009-2010 LAAS/CNRS
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
# From $NetBSD: can-be-built-here.mk,v 1.4 2007/02/10 09:01:05 rillig Exp $
#
#                                       Anthony Mallet on Wed May 30 2007

#
# This file checks whether a package can be built in the current robotpkg
# environment. It sets the following variables:
#
# PKG_FAIL_REASON, PKG_SKIP_REASON
#

# Don't build BROKEN packages
#
ifdef BROKEN
  ifndef NO_BROKEN
    PKG_FAIL_REASON+= "$${bf}${PKGNAME} is marked as broken:$${rm}"
    PKG_FAIL_REASON+= "${BROKEN}"
  endif
endif

# Check RESTRICTED if we don't want to get into that
#
ifdef RESTRICTED
  ifdef NO_RESTRICTED
    PKG_FAIL_REASON+= "${PKGNAME} is restricted: ${RESTRICTED}"
  endif
endif

# Check LICENSE. License may not be empty, but until all package get their
# proper license, just print a warning.
#
ifneq (,${LICENSE})
  ifeq (,$(filter ${LICENSE},${ACCEPTABLE_LICENSES}))
PKG_FAIL_REASON+= "${PKGNAME} has an unacceptable license:"
PKG_FAIL_REASON+= "	 ${LICENSE}"
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= " . To view the license, enter \"${MAKE} show-license\"."
PKG_FAIL_REASON+= " . To indicate acceptance, add this line:"
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= "    ACCEPTABLE_LICENSES+=${LICENSE}"
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= "   to ${MAKECONF}"
PKG_FAIL_REASON+= ""
  endif
else
  $(shell echo >&2 '*** LICENSE is empty: every package should define a license.')
endif

# Check *_FOR_PLATFORM variables, unless confirm was given on the cmdline
#
ifeq (,$(filter confirm,${MAKECMDGOALS}))
  ifdef NOT_FOR_PLATFORM
    ifneq (,$(or							\
		$(filter ${NOT_FOR_PLATFORM},${MACHINE_PLATFORM}),	\
		$(findstring ${NOT_FOR_PLATFORM},${MACHINE_PLATFORM})))
PKG_FAIL_REASON+= "${PKGNAME} is not available for ${MACHINE_PLATFORM}."
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= "You can override this check by doing:"
PKG_FAIL_REASON+= "		${MAKE} ${MAKECMDGOALS} confirm"
    endif
  endif

  ifdef ONLY_FOR_PLATFORM
    ifeq (,$(or								\
		$(filter ${ONLY_FOR_PLATFORM},${MACHINE_PLATFORM}),	\
		$(findstring ${ONLY_FOR_PLATFORM},${MACHINE_PLATFORM})))
PKG_FAIL_REASON+= "${PKGNAME} is not available for ${MACHINE_PLATFORM}."
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= "You can override this check by doing:"
PKG_FAIL_REASON+= "		${MAKE} ${MAKECMDGOALS} confirm"
    endif
  endif
endif

#
# Summarize the result of tests in _CBBH
#
_CBBH=			yes#, but see below.

# Check PKG_FAIL_REASON
ifdef PKG_FAIL_REASON
ifneq (,${PKG_FAIL_REASON})
_CBBH=			no
_CBBH_MSGS+=		"This package has failed for the following reason:"
_CBBH_MSGS+=		"${hline}"
_CBBH_MSGS+=		${PKG_FAIL_REASON}
_CBBH_MSGS+=		"${hline}"
endif
endif

# Check PKG_SKIP_REASON
ifdef PKG_SKIP_REASON
ifneq (,$(PKG_SKIP_REASON))
_CBBH=			no
_CBBH_MSGS+=		"This package has set PKG_SKIP_REASON:"
_CBBH_MSGS+=		${PKG_SKIP_REASON}
endif
endif

# In the first line, this target prints either "yes" or "no", saying
# whether this package can be built. If the package can not be built,
# the reasons are given in the following lines.
#
.PHONY: can-be-built-here cbbh

can-be-built-here:
	@${ECHO} ${_CBBH}
	@${ECHO} ${_CBBH_MSGS}

cbbh:
ifeq (no,${_CBBH})
	@for str in ${_CBBH_MSGS}; do					\
		${ERROR_MSG} "$$str";					\
	done
	@exit 2
endif
