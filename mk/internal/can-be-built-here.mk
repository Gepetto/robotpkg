#
# Copyright (c) 2007,2009-2011 LAAS/CNRS
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
  ifneq (,$(filter-out ${ACCEPTABLE_LICENSES},${LICENSE}))
PKG_FAIL_REASON+= "${PKGNAME} has an unacceptable license:"
PKG_FAIL_REASON+= "	 $(filter-out ${ACCEPTABLE_LICENSES},${LICENSE})"
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= " . To view the license, enter \"${MAKE} show-license\"."
PKG_FAIL_REASON+= " . To indicate acceptance, add this line:"
PKG_FAIL_REASON+= ""
$(foreach l,$(filter-out ${ACCEPTABLE_LICENSES},${LICENSE}),$(eval 	\
  PKG_FAIL_REASON+= "    ACCEPTABLE_LICENSES+=$l"			\
))
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= "   to ${MAKECONF}"
PKG_FAIL_REASON+= ""
  endif
else ifeq (2,${_ROBOTPKG_DEPTH})
  $(shell echo >&2 'Warning: the LICENSE of ${PKGPATH} is undefined.')
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


# --- check-wrkdir-version -------------------------------------------------
#
# - Verify that the extracted package in ${WRKDIR} matches the version
#   specified in the package Makefile.
# - Verify that current package options did not change since workdir creation.
# This is a check against stale work directories.
#
ifeq (yes,$(call exists,${_COOKIE.wrkdir}))
  $(call require,${_COOKIE.wrkdir})

  # filter .checkout. Grr.
  _v_:=$(strip $(if $(filter .checkout,				\
        $(suffix $(basename $(basename ${PKGVERSION})))),	\
	$(basename $(basename $(basename ${PKGVERSION}))),	\
	${PKGVERSION}))
  ifneq (${_v_},${_COOKIE.wrkdir.pkgversion})
    PKG_FAIL_REASON+= "$${bf}Extracted version mismatch for ${PKGNAME}$${rm}"
    PKG_FAIL_REASON+= "Extracted version:	${_COOKIE.wrkdir.pkgversion}"
    PKG_FAIL_REASON+= "Current version:		${_v_}"
    PKG_FAIL_REASON+= ""
    PKG_FAIL_REASON+= "You have a stale working directory, please"
    PKG_FAIL_REASON+= "		\`$${bf}${MAKE} clean$${rm}\` in ${PKGPATH}"
  endif

  ifneq (${PKG_OPTIONS},${_COOKIE.wrkdir.pkgoptions})
    PKG_FAIL_REASON+= "$${bf}Options for ${PKGNAME} have changed$${rm}"
    ifeq (,${_COOKIE.wrkdir.pkgoptions})
      PKG_FAIL_REASON+= "Working directory:	(none)"
    else
      PKG_FAIL_REASON+= "Working directory:	${_COOKIE.wrkdir.pkgoptions}"
    endif
    ifeq (,${PKG_OPTIONS})
      PKG_FAIL_REASON+= "Current options:		(none)"
    else
      PKG_FAIL_REASON+= "Current options:		${PKG_OPTIONS}"
    endif
    PKG_FAIL_REASON+= ""
    PKG_FAIL_REASON+= "You have a stale working directory, please"
    PKG_FAIL_REASON+= "		\`$${bf}${MAKE} clean$${rm}\` in ${PKGPATH}"
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

# --- cbbh -----------------------------------------------------------------
#
# In the first line, this target prints either "yes" or "no", saying
# whether this package can be built. If the package can not be built,
# the reasons are given in the following lines.
#
.PHONY: can-be-built-here
can-be-built-here:
	@${ECHO} ${_CBBH}
	@${ECHO} ${_CBBH_MSGS}

.PHONY: cbbh
cbbh:
  ifeq (no,${_CBBH})
	@for str in ${_CBBH_MSGS}; do					\
		${ERROR_MSG} "$$str";					\
	done
	@exit 2
  endif


# Include cookies or other files required by other makefiles, so that this may
# trigger again the corresponding phase if needed and the package allows it.
#
ifeq (yes,${_CBBH})
  $(call -require,${_cbbh_requires})
endif
