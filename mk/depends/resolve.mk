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

# This file process included "depend.mk" files, resolve alternatives and
# perform consistency checks. It is included at the very end of robotpkg.mk
# because no new dependency can be added after this point.
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

# PREFER.foo?=		robotpkg
# DEPEND_ABI.foo?=	foo>=1.0
# DEPEND_DIR.foo?=	../../category/foo
#
# SYSTEM_DESCR.foo=	foo
# SYSTEM_SEARCH.foo=	'bin/foo:p:% -v'
# SYSTEM_PKG.Linux=	foo-dev
#
# include ../../category/baz/depend.mk
# endif # FOO_DEPEND_MK
#
# DEPEND_DEPTH:=	${DEPEND_DEPTH:+=}
# -------------8<-------------8<-------------8<-------------8<-------------
#
# Most of the depend.mk file is protected against multiple inclusion,
# except for the parts related to manipulating DEPEND_DEPTH.
#
# If a depend.mk file is included, then the package Makefile can use the value
# of PREFIX.<pkg> and PKGVERSION.<pkg>.
# If the depend.mk tries to handle dependencies satisfied directly by
# the base system, then it should set PREFER.<pkg> ?= system
#
# A depend.mk may define "alternatives", which are virtual packages replaced by
# an actual one based on ABI requirements and/or user preferences.
# An alternative is defined by the following variables:
#
# -------------8<-------------8<-------------8<-------------8<-------------
# DEPEND_ALTERNATIVE+=		pkg
# ALTERNATIVES.pkg=		pkg1 .. pkgx .. pkgn # unsorted
# PKG_SELECT.pkg?=		pkg2 pkg1 # sorted by preference
# DEPEND_ABI.pkg=		pkg>=1<=n
#
# for each pkgx:
# ALTERNATIVE_ABI.pkgx=		pkg>=x.0<y.0 (note: not 'pkgx>=...')
# ALTERNATIVE_MK.pkgx=		../../mk/sysdep/pkgx.mk
# -------------8<-------------8<-------------8<-------------8<-------------
#
# Users may set PKG_SELECT.pkg in robotpkg.conf. After dependency resolution,
# ALTERNATIVE.pkg is set to the selected alternative (forcing ALTERNATIVE.pkg
# in robotpkg.conf/cmdline is also allowed, but discouraged. Use PKG_SELECT).
#

# DEPEND_PKG contains the list of packages for which we add a direct
# dependency.
#
DEPEND_PKG?=	# empty

# DEPEND_USE contains the full list of packages on which we have a
# dependency (direct or indirect).
#
DEPEND_USE?=	# empty


# --- resolve alternatives -------------------------------------------------

# NO ALTERNATIVE CAN BE ADDED AFTER THIS POINT
DEPEND_ALTERNATIVE:=$(sort ${DEPEND_ALTERNATIVE})

# list of unresolved alternatives (not in robotpkg.conf or cmdline)
_alt_list:=$(foreach _,${DEPEND_ALTERNATIVE},$(if ${ALTERNATIVE.$_},,$_))
ifneq (,$(strip ${_alt_list}))
  # compute acceptable alternatives
  $(foreach _,${_alt_list},$(eval \
    _alt_select.$_=$(filter ${ALTERNATIVES.$_},${PKG_SELECT.$_})))

  # choose a version: generate a list of calls to 'preduce' for each
  # pattern in order of preference. Then pass this to 'or', so that the
  # first match wins. This demands a bit of quoting... but generates the
  # minimum number of calls to preduce. (the trailing [,] in the macro below is
  # not a typo).
  override define _alt_match
    $$$$(if $$$$(call preduce,${DEPEND_ABI.$1} ${ALTERNATIVE_ABI.$2}),$2),
  endef
  $(foreach _,${_alt_list},$(eval \
    _alt_test.$_=$(foreach a,${_alt_select.$_},$(call _alt_match,$_,$a))))

  $(foreach _,${_alt_list},$(eval \
    ALTERNATIVE.$_:=$$(strip $$(or ${_alt_test.$_}))))
endif # _alt_list

# check empty or malformed ALTERNATIVE.<pkg>, and set a sane fallback for the
# rest of the processing
override define _alt_error
  ifneq (1,$(words ${ALTERNATIVE.$1}))
    PKG_FAIL_REASON+=\
      "$${bf}The $1 alternative selection must be a single choice$${rm}"\
      "	ALTERNATIVE.$1 = ${ALTERNATIVE.$1}"				\
      "	(use PKG_SELECT.$1 to define an ordered list)"
    override ALTERNATIVE.$1=$(word 1,${ALTERNATIVES.$1})
  endif
  ifeq (,$(filter ${ALTERNATIVE.$1},${ALTERNATIVES.$1}))
    PKG_FAIL_REASON+=\
      "$${bf}The $1 alternatives cannot be resolved$${rm}"		\
      "	ALTERNATIVE.$1 = ${ALTERNATIVE.$1}"				\
      "	PKG_SELECT.$1 = ${PKG_SELECT.$1}"				\
      "	DEPEND_ABI.$1 = ${DEPEND_ABI.$1}"
    override ALTERNATIVE.$1=$(word 1,${ALTERNATIVES.$1})
  endif
endef
$(foreach _,${DEPEND_ALTERNATIVE},$(eval $(call _alt_error,$_)))

# list of unresolved alternatives ABI (normally none or all)
_altabi_list:=$(foreach _,${DEPEND_ALTERNATIVE},$(if ${ALTERNATIVE_ABI.$_},,$_))
ifneq (,$(strip ${_altabi_list}))
  $(foreach _,${_altabi_list},$(eval \
    _alt_abi.$_=	${ALTERNATIVE_ABI.${ALTERNATIVE.$_}}))

  # refine the required version of the selected package
  $(foreach _,${_altabi_list},$(eval \
    _alt_reqd.$_:=$(call preduce,${DEPEND_ABI.$_} ${_alt_abi.$_})))

  $(foreach _,${_altabi_list},$(eval \
    ALTERNATIVE_ABI.$_=$(subst $_,${ALTERNATIVE.$_},${_alt_reqd.$_})))
endif # _altabi_list

# check failures, and set a sane fallback for the rest of the processing
override define _altabi_error
  ifeq (,$(strip ${ALTERNATIVE_ABI.$1}))
    PKG_FAIL_REASON+=\
      "The requirements on $1 alternatives cannot be satisfied:"	\
      ""								\
      "	ALTERNATIVE.$1 = ${ALTERNATIVE.$1}"				\
      "	DEPEND_ABI.$1 = ${DEPEND_ABI.$1}"
    override ALTERNATIVE_ABI.$1 =${DEPEND_ABI.$1}
  endif
endef
$(foreach _,${DEPEND_ALTERNATIVE},$(eval $(call _altabi_error,$_)))

# enforce computed ABI requirement on the selected packages
$(foreach _,${DEPEND_ALTERNATIVE},$(eval \
  override DEPEND_ABI.${ALTERNATIVE.$_} =${ALTERNATIVE_ABI.$_}))

# add depend method, default to full
$(foreach _,${DEPEND_ALTERNATIVE},$(eval DEPEND_METHOD.$_?=full))
$(foreach _,${DEPEND_ALTERNATIVE},$(eval \
  DEPEND_METHOD.${ALTERNATIVE.$_} +=${DEPEND_METHOD.$_}))

# require the mk file corresponding to the selected alternatives, but as
# an indirect dependency only. Alternative wrappers should have added the
# proper entry in DEPEND_PKG/DEPEND_USE at the proper dependency level.
DEPEND_DEPTH:=${DEPEND_DEPTH}+
include $(foreach _,${DEPEND_ALTERNATIVE},${ALTERNATIVE_MK.${ALTERNATIVE.$_}})
DEPEND_DEPTH:=${DEPEND_DEPTH:+=}


# --- consistency checks on dependencies -----------------------------------

# NO DEPENDENCY CAN BE ADDED AFTER THIS POINT
DEPEND_USE:=$(sort ${DEPEND_USE})
DEPEND_PKG:=$(sort ${DEPEND_PKG})

# By default, prefer the robotpkg version of all packages. Individual
# packages might override this, and users can set their preferences in
# robotpkg.conf.
#
$(foreach _,${DEPEND_USE},$(eval PREFER.$_?=robotpkg))

# By default, every package receives a full dependency.
$(foreach _,${DEPEND_USE},$(eval DEPEND_METHOD.$_?=full))

_empty_abi:=$(foreach _,${DEPEND_USE},$(if ${DEPEND_ABI.$_},,$_))
ifneq (,$(strip ${_empty_abi}))
  PKG_FAIL_REASON+=$(foreach _,${_empty_abi},"DEPEND_ABI.$_ is undefined")
endif

# DEPEND_ABI.pkg cannot be empty
_empty_abi:=$(foreach _,${DEPEND_USE},$(if ${DEPEND_ABI.$_},,$_))
ifneq (,$(strip ${_empty_abi}))
  PKG_FAIL_REASON+=$(foreach _,${_empty_abi},"DEPEND_ABI.$_ is undefined")
endif

# SYSTEM_SEARCH.pkg cannot be empty
_empty_srch=$(foreach _,${DEPEND_USE},$(if ${SYSTEM_SEARCH.$_},,$_))
ifneq (,$(strip ${_empty_srch}))
  PKG_FAIL_REASON+=$(foreach _,${_empty_srch},"SYSTEM_SEARCH.$_ is undefined")
endif

# DEPEND_DEPTH must be properly nested
ifneq (,$(strip ${DEPEND_DEPTH}))
  PKG_FAIL_REASON+=	"DEPEND_DEPTH = ${DEPEND_DEPTH} (should be empty)"
endif


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
