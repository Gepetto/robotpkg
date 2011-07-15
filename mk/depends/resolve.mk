#
# Copyright (c) 2008-2011 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use  in  source  and binary  forms,  with  or  without
# modification, are permitted provided that the following conditions are met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
# THE SOFTWARE  IS PROVIDED "AS IS"  AND THE AUTHOR  DISCLAIMS ALL WARRANTIES
# WITH  REGARD   TO  THIS  SOFTWARE  INCLUDING  ALL   IMPLIED  WARRANTIES  OF
# MERCHANTABILITY AND  FITNESS.  IN NO EVENT  SHALL THE AUTHOR  BE LIABLE FOR
# ANY  SPECIAL, DIRECT,  INDIRECT, OR  CONSEQUENTIAL DAMAGES  OR  ANY DAMAGES
# WHATSOEVER  RESULTING FROM  LOSS OF  USE, DATA  OR PROFITS,  WHETHER  IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR  OTHER TORTIOUS ACTION, ARISING OUT OF OR
# IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
# Ideas from $NetBSD: bsd.buildlink3.mk,v 1.199 2007/12/05 21:36:43 tron Exp $
#
#                                       Anthony Mallet on Thu Feb 28 2008
#

# An example package depend.mk file:
#
# -------------8<-------------8<-------------8<-------------8<-------------
# DEPEND_DEPTH:=	${DEPEND_DEPTH}+
# FOO_DEPEND_MK:=	${FOO_DEPEND_MK}+
#
# ifeq (+,$(DEPEND_DEPTH))
# DEPEND_PKG+=		foo
# endif
#
# ifeq (+,$(FOO_DEPEND_MK))
# DEPEND_USE+=		foo
# DEPEND_DIR.foo?=	../../category/foo
# endif  # FOO_DEPEND_MK
#
# include ../../category/baz/depend.mk
#
# DEPEND_DEPTH:=	${DEPEND_DEPTH:+=}
# -------------8<-------------8<-------------8<-------------8<-------------
#
# Most of the depend.mk file is protected against multiple inclusion,
# except for the parts related to manipulating DEPEND_DEPTH.
#
# Note that if a depend.mk file is included, then the package Makefile
# has the expectation that it can use the value of PREFIX.<pkg>.
# If the depend.mk tries to handle dependencies satisfied directly by
# the base system, then it should provide an appropriate value for
# PREFIX.<pkg> for that case.  The case where a dependency is
# satisfied by a robotpkg-installed package is handled automatically by
# this file.
#
# The different variables that may be set in a depend.mk file are
# described below.
#
# The variable name convention used in this Makefile are:
#
# DEPEND_*	public variables usable in other Makefiles
# _DPD_*	private variables to this Makefile


# DEPEND_PKG contains the list of packages for which we add a direct
# dependency.
#
DEPEND_PKG?=# empty

# DEPEND_USE contains the full list of packages on which we have a
# dependency (direct or indirect).
#
DEPEND_USE?=# empty

# By default, prefer the robotpkg version of all packages. Individual
# packages might override this, and users can set their preferences in
# robotpkg.conf.
#
$(foreach _pkg_,${DEPEND_USE},$(eval PREFER.${_pkg_}?=robotpkg))

# By default, every package receives a full dependency.
#
$(foreach _pkg_,${DEPEND_USE},$(eval DEPEND_METHOD.${_pkg_}?=full))


# Add the proper dependency on each package pulled in by depend.mk
# files.  DEPEND_METHOD.<pkg> contains a list of either "full", "build"
# or "bootstrap". If any of that list is "full" then we use a full
# dependency on <pkg>, otherwise we use a build dependency on <pkg>.
#
define _dpd_adddep
  ifneq (,$$(filter robotpkg,$${PREFER.${1}}))
    ifeq (,$(strip ${DEPEND_DIR.${1}}))
      PKG_FAIL_REASON+= "$${bf}Requirements for ${PKGNAME} were not met:$${rm}"
      PKG_FAIL_REASON+= ""
      ifdef SYSTEM_DESCR.${1}
        PKG_FAIL_REASON+= "		$${bf}"$${SYSTEM_DESCR.${1}}"$${rm}"
      else
        PKG_FAIL_REASON+= "		$${bf}$${DEPEND_ABI.${1}}$${rm}"
      endif
      PKG_FAIL_REASON+= ""
      PKG_FAIL_REASON+= "$${bf}This package is not included in robotpkg$${rm}\
		and you have to"
      PKG_FAIL_REASON+= "configure your preferences by setting the following\
		variable"
      PKG_FAIL_REASON+= "in ${MAKECONF}:"
      PKG_FAIL_REASON+= ""
      PKG_FAIL_REASON+= "	. PREFER.${1}=	system"
    endif
    ifneq (,$$(filter full,${DEPEND_METHOD.${1}}))
      DEPENDS+=${DEPEND_ABI.${1}}:${DEPEND_DIR.${1}}
    else ifneq (,$$(filter build,${DEPEND_METHOD.${1}}))
      BUILD_DEPENDS+=${DEPEND_ABI.${1}}:${DEPEND_DIR.${1}}
    endif
    ifneq (,$$(filter bootstrap,${DEPEND_METHOD.${1}}))
      BOOTSTRAP_DEPENDS+=${DEPEND_ABI.${1}}:${DEPEND_DIR.${1}}
    endif
  endif
endef
$(foreach _pkg_,${DEPEND_PKG},$(eval $(call _dpd_adddep,${_pkg_})))


# --- register dependencies on _COOKIE.{bootstrap-,}depends ----------------

# A dependency on all files from all SYSTEM_FILES dependencies is registered as
# an attempt to detect stale WRKDIR and trigger rebuild.
#
# Except when cleaning.
#
$(foreach _pkg_,${DEPEND_USE},						\
  $(if $(filter bootstrap,${DEPEND_METHOD.${_pkg_}}),			\
    $(eval ${_COOKIE.bootstrap-depends}:${SYSTEM_FILES.${_pkg_}}),	\
    $(eval ${_COOKIE.depends}:${SYSTEM_FILES.${_pkg_}})			\
))

# Disable any recipe for files in SYSTEM_FILES
$(sort $(foreach _pkg_,${DEPEND_USE},${SYSTEM_FILES.${_pkg_}})):;


# Top-level targets that require {bootstrap-,}depends
ifneq (,$(filter ${_barrier.bootstrap-depends},${MAKECMDGOALS}))
  _cbbh_requires+=	${_COOKIE.bootstrap-depends}
endif
ifneq (,$(filter ${_barrier.depends},${MAKECMDGOALS}))
  _cbbh_requires+=	${_COOKIE.bootstrap-depends}
  _cbbh_requires+=	${_COOKIE.depends}
endif
