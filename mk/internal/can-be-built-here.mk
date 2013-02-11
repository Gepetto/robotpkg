#
# Copyright (c) 2007,2009-2013 LAAS/CNRS
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
# This file checks whether a package can be extracted or built in the current
# robotpkg environment. In addition to the checks performed here, two variables
# can be set by packages or .mk files to indicate failure, with the following
# behaviour:
#
# PKG_FAIL_REASON: most of the targets cannot be invoked
#
# PKG_CBBH_REASON: targets involving building the package cannot be invoked,
#                  but the package can be fetch, extracted or patched.
#


# Don't build BROKEN packages
#
ifdef BROKEN
  ifndef NO_BROKEN
    PKG_CBBH_REASON+= "$${bf}${PKGNAME} is marked as broken:$${rm}"
    PKG_CBBH_REASON+= "${BROKEN}"
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
$(foreach l,$(filter-out ${ACCEPTABLE_LICENSES},${LICENSE}),$(eval	\
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
		$(filter ${NOT_FOR_PLATFORM},				\
			${MACHINE_PLATFORM} ${MACHINE_KERNEL}),		\
		$(findstring ${NOT_FOR_PLATFORM},			\
			${MACHINE_PLATFORM} ${MACHINE_KERNEL})))
PKG_CBBH_REASON+= "${PKGNAME} is not available for ${MACHINE_PLATFORM}."
PKG_CBBH_REASON+= ""
PKG_CBBH_REASON+= "You can override this check by doing:"
PKG_CBBH_REASON+= "		${MAKE} ${MAKECMDGOALS} confirm"
    endif
  endif

  ifdef ONLY_FOR_PLATFORM
    ifeq (,$(or								\
		$(filter ${ONLY_FOR_PLATFORM},				\
			${MACHINE_PLATFORM} ${MACHINE_KERNEL}),		\
		$(findstring ${ONLY_FOR_PLATFORM},			\
			${MACHINE_PLATFORM} ${MACHINE_KERNEL})))
PKG_CBBH_REASON+= "${PKGNAME} is not available for ${MACHINE_PLATFORM}."
PKG_CBBH_REASON+= ""
PKG_CBBH_REASON+= "You can override this check by doing:"
PKG_CBBH_REASON+= "		${MAKE} ${MAKECMDGOALS} confirm"
    endif
  endif
endif

# Warn about obsolete USE_LANGUAGES
ifdef USE_LANGUAGES
  $(shell echo >&2 'Warning: USE_LANGUAGES in ${PKGPATH} is deprecated.')
endif


# --- check PKGREQD --------------------------------------------------------
#
ifdef PKGREQD
  ifeq (no,$(call pmatch,${PKGREQD},${PKGNAME}))
    PKG_FAIL_REASON+= "$${bf}Required package unavailable$${rm}"
    PKG_FAIL_REASON+= "Required package:	${PKGREQD}"
    PKG_FAIL_REASON+= "Current package:		${PKGNAME}"
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

  ifneq (${PKGVERSION_NOREV},${_COOKIE.wrkdir.pkgversion})
    PKG_FAIL_REASON+= "$${bf}Extracted version mismatch for ${PKGNAME}$${rm}"
    PKG_FAIL_REASON+= "Extracted version:	${_COOKIE.wrkdir.pkgversion}"
    PKG_FAIL_REASON+= "Current version:		${PKGVERSION_NOREV}"
    PKG_FAIL_REASON+= ""
    _wrk_stale:=yes
  endif

  ifneq (${PKG_OPTIONS},${_COOKIE.wrkdir.pkgoptions})
    PKG_FAIL_REASON+= "$${bf}Options for ${PKGNAME_NOTAG} have changed$${rm}"
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
    _wrk_stale:=yes
  endif

  _wrk_alt:=$(strip $(foreach _,${PKG_ALTERNATIVES},${PKG_ALTERNATIVE.$_}))
  ifneq (,$(filter-out ${_wrk_alt},${_COOKIE.wrkdir.alternatives}))
    PKG_FAIL_REASON+= "$${bf}Alternatives for ${PKGNAME} have changed$${rm}"
    ifeq (,${_COOKIE.wrkdir.alternatives})
      PKG_FAIL_REASON+= "Working directory:	(none)"
    else
      PKG_FAIL_REASON+= "Working directory:	${_COOKIE.wrkdir.alternatives}"
    endif
    ifeq (,${_wrk_alt})
      PKG_FAIL_REASON+= "Current alternatives:	(none)"
    else
      PKG_FAIL_REASON+= "Current alternatives:	${_wrk_alt}"
    endif
    PKG_FAIL_REASON+= ""
    _wrk_stale:=yes
  endif

  ifeq (yes,${_wrk_stale})
    PKG_FAIL_REASON+= "You have a stale working directory, please"
    PKG_FAIL_REASON+= "		\`$${bf}${MAKE} clean$${rm}\` in ${PKGPATH}"
  endif
endif


# --- cbeh/cbbh -------------------------------------------------------------
#
# "can-be-extracted-here" and "can-be-built-here". If the package can not be
# extracted or built, the reasons are given in the following lines.
#

.PHONY: cbeh
cbeh:
  ifeq (,$(strip ${PKG_FAIL_REASON}))
	@:
  else
	${RUN}${_SETFANCY_CMD};						\
	${ERROR_MSG}							\
	  "This package cannot be extracted for the following reason:";	\
	${ERROR_MSG} "${hline}";					\
	for str in ${PKG_FAIL_REASON}; do				\
	  ${ERROR_MSG} "$$str";						\
	done;								\
	${ERROR_MSG} "${hline}";					\
	exit 2
  endif


.PHONY: cbbh
cbbh: cbeh
  ifeq (,$(strip ${PKG_CBBH_REASON}))
	@:
  else
	${RUN}${_SETFANCY_CMD};						\
	${ERROR_MSG}							\
	  "This package cannot be built for the following reason:";	\
	${ERROR_MSG} "${hline}";					\
	for str in ${PKG_CBBH_REASON}; do				\
	  ${ERROR_MSG} "$$str";						\
	done;								\
	${ERROR_MSG} "${hline}";					\
	exit 2
  endif

# Include cookies or other files required by other makefiles, so that this may
# trigger again the corresponding phase if needed and the package allows it.
# This is done as follow:
# - if cbbh is not required, include cbeh iff !PKG_FAIL_REASON
# - if cbbh is required, include cbeh+cbbh iff !PKG_FAIL_REASON+PKG_CBBH_REASON
#
ifeq (,$(strip ${_cbbh_requires}${PKG_FAIL_REASON}))
  $(call -require,$(sort ${_cbeh_requires}))
else ifeq (,$(strip ${PKG_CBBH_REASON}${PKG_FAIL_REASON}))
  $(call -require,$(sort ${_cbeh_requires} ${_cbbh_requires}))
endif
