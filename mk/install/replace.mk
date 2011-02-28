# Copyright (c) 2008-2011 LAAS/CNRS
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# Redistribution  and  use  in  source  and  binary  forms,   with  or  without
# modification, are permitted provided that the following conditions are met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice,  this list of  conditions and  the following disclaimer in
#      the  documentation   and/or  other  materials   provided with  the
#      distribution.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
# From $NetBSD: replace.mk,v 1.10 2007/03/09 03:28:58 rillig Exp $
#
#                                             Anthony Mallet on Sun Jan 27 2008
#

# --- replace (PUBLIC) -----------------------------------------------------

# Updates a package in-place on the system.
# It will acquire elevated privileges just-in-time.
#
$(call require, ${ROBOTPKG_DIR}/mk/build/build-vars.mk)
$(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)

_REPLACE_TARGETS+=	$(call add-barrier, depends, replace)
_REPLACE_TARGETS+=	build
_REPLACE_TARGETS+=	replace-message
ifeq (,$(call isyes,${MAKE_SUDO_INSTALL}))
  _REPLACE_TARGETS+=	pkg-replace
else
  _REPLACE_TARGETS+=	su-target-replace
  _SU_TARGETS+=		replace
  su-replace:		pkg-replace
endif

ifneq (,$(filter replace,${MAKECMDGOALS})) # if we are asking for a replace
  ifneq (yes,$(call for-unsafe-pkg,yes))   # and the package is unsafe
    _REPLACE_TARGETS:= replace-up-to-date  # let us do nothing
  endif
endif

.PHONY: replace
replace: ${_REPLACE_TARGETS};


# --- replace-message (PRIVATE) --------------------------------------------

.PHONY: replace-message
replace-message:
	@${PHASE_MSG} "Replacing for ${PKGNAME}"


# --- replace-up-to-date (PRIVATE) -----------------------------------------

.PHONY: replace-up-to-date
replace-up-to-date: replace-message
	@${ECHO_MSG} "${PKGNAME} is already installed and up-to-date."
  ifeq (0,${MAKELEVEL})
	@if ${TEST} -t 1; then						\
	  ${ECHO_MSG} 							\
	    "Use '${MAKE} ${MAKECMDGOALS} confirm' to force updating.";	\
	fi
  endif
