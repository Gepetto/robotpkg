#
# Copyright (c) 2008-2013 LAAS/CNRS
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
# PKG_ALTERNATIVES+=		pkg
# PKG_ALTERNATIVES.pkg=		pkg1 .. pkgx .. pkgn # unsorted
# PREFER_ALTERNATIVE.pkg?=	pkg2 pkg1 # sorted by preference
#
# for each pkgx:
# PKG_ALTERNATIVE_DESCR.pkgx=	# human readable description
# and optionnaly:
# PKG_ALTERNATIVE_SELECT.pkgx=	# macro returning non-empty if pkgx is ok
# PKGTAG.pkgx=			# copied to PKGTAG.pkg
#
# PKG_ALTERNATIVE_SET.pkgx=	# Evaluated when pkgx is selected
# PKG_ALTERNATIVE_UNSET.pkgx=	# Evaluated when pkgx is not selected
# -------------8<-------------8<-------------8<-------------8<-------------
#
# Users may set PREFER_ALTERNATIVE.pkg in robotpkg.conf. After dependency
# resolution, PKG_ALTERNATIVE.pkg is set to the selected alternative (forcing
# PKG_ALTERNATIVE.pkg in robotpkg.conf/cmdline is also allowed, but
# discouraged. Use PREFER_ALTERNATIVE).
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
PKG_ALTERNATIVES:=$(sort ${PKG_ALTERNATIVES})

# list of unresolved alternatives (not in robotpkg.conf or cmdline)
_alt_list:=$(foreach _,${PKG_ALTERNATIVES},$(if ${PKG_ALTERNATIVE.$_},,$_))

# derive alternatives from a required package name
ifdef PKGREQD
  override define _alt_guess # (alt, string)
    a:=$(strip $(foreach _,${PKG_ALTERNATIVES.$1},$(strip \
	$(if $(findstring ${PKGTAG.$_},$2),$_))))
    ifeq (1,$$(words $$a))
      PREFER_ALTERNATIVE.$1:=$$a
    else ifneq (0,$$(words $$a))
      $$(shell echo >&2	\
	'Warning: ambiguous package name $2 for alternatives $$a.')
    endif
  endef
  $(foreach _,${_alt_list},$(eval $(call _alt_guess,$_,${PKGREQD})))
endif # PKGREQD

# check enforced alternatives
override define _alt_enforced_valid
  ifeq (,${PKG_ALTERNATIVE_SELECT.${PKG_ALTERNATIVE.$1}})
    PKG_FAIL_REASON+=\
      "$${bf}The $1 alternative selection is invalid$${rm}"		\
      "	PKG_ALTERNATIVE.$1 = ${PKG_ALTERNATIVE.$1}"			\
      $$(if $${PKG_ALTERNATIVE.$1},					\
        " Preferred value: $${PKG_ALTERNATIVE.$1}") ""
    _alt_list+=$1
  endif
endef
$(foreach _,$(filter-out ${_alt_list},${PKG_ALTERNATIVES}),$(eval \
  $(call _alt_enforced_valid,$_)))

# compute acceptable alternatives, based on PREFER_ALTERNATIVE.<pkg>
$(foreach _,${_alt_list},$(eval \
  _alt_select.$_:=$(filter ${PKG_ALTERNATIVES.$_},${PREFER_ALTERNATIVE.$_})))

# choose a version: generate a list of test for each pattern in order of
# preference. Then pass this to 'or', so that the first match wins. This
# demands a bit of quoting... but generates the minimum number of calls to
# the selection macros. (the trailing [,] in the macro below is not a typo).
override define _alt_match
$$(if $$(strip $(value PKG_ALTERNATIVE_SELECT.$1)),$1),
endef
$(foreach _,${_alt_list},$(eval \
  _alt_test.$_=$(foreach a,${_alt_select.$_},$(call _alt_match,$a))))
$(foreach _,${_alt_list},$(eval \
  override PKG_ALTERNATIVE.$_:=$$(strip $$(or $(value _alt_test.$_)))))

# check empty PKG_ALTERNATIVE.<pkg>
override define _alt_error
  ifeq (,${PKG_ALTERNATIVE.$1})
    PKG_FAIL_REASON+=\
      "$${bf}No acceptable $1 alternatives could be found$${rm}"	\
      "	PREFER_ALTERNATIVE.$1 = ${PREFER_ALTERNATIVE.$1}" ""
  endif
endef
$(foreach _,${PKG_ALTERNATIVES},$(eval $(call _alt_error,$_)))

# define PGKTAG.,-PKGTAG. and PKGTAG.-
$(foreach _,${PKG_ALTERNATIVES},$(eval \
  PKGTAG.$_=$$(or $${PKGTAG.$${PKG_ALTERNATIVE.$_}},$${PKG_ALTERNATIVE.$_})))
$(foreach _,${PKG_ALTERNATIVES},$(eval \
  -PKGTAG.$_=$$(addprefix -,$${PKGTAG.$_})))
$(foreach _,${PKG_ALTERNATIVES},$(eval \
  PKGTAG.$_-=$$(addsuffix -,$${PKGTAG.$_})))

# execute set/unset scripts. Do this in an indirect dependency context
# only. Alternative wrappers should have added the proper entry in
# DEPEND_PKG/DEPEND_USE at the proper dependency level.
DEPEND_DEPTH:=${DEPEND_DEPTH}+

$(foreach _,${PKG_ALTERNATIVES},					\
  $(eval $(value PKG_ALTERNATIVE_SET.${PKG_ALTERNATIVE.$_}))		\
  $(foreach 1,$(filter-out ${PKG_ALTERNATIVE.$_},${PKG_ALTERNATIVES.$_}),\
    $(eval $(value PKG_ALTERNATIVE_UNSET.$1))))

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

# Reduce DEPEND_ABI.pkg if needed
override define _dpd_reduceabi # (pkg)
  ifneq (1,$(words ${DEPEND_ABI.$1}))
    DEPEND_ABI.$1:=$$(call preduce,${DEPEND_ABI.$1})
    ifneq (1,$$(words $${DEPEND_ABI.$1}))
      PKG_FAIL_REASON+=\
	"$$$${bf}Requirements on $1 cannot be satisfied:$$$${rm}"	\
	$$(foreach _,${DEPEND_ABI.$1},"	$$_")
    endif
  endif
endef
$(foreach _,${DEPEND_USE},$(eval $(call _dpd_reduceabi,$_)))

# Compute SYSTEM_PKG.pkg if needed
override define _dpd_syspkg # (pkg)
  SYSTEM_PKG.$1 ?=$(or							\
    ${SYSTEM_PKG.${MACHINE_KERNEL}.$1},					\
    ${SYSTEM_PKG.${OS_KERNEL}-${OS_KERNEL_VERSION}.$1},			\
    ${SYSTEM_PKG.${OS_KERNEL}.$1},					\
    ${SYSTEM_PKG.${MACHINE_PLATFORM}.$1},				\
    ${SYSTEM_PKG.${OPSYS}-${OS_VERSION}.$1},				\
    ${SYSTEM_PKG.${OPSYS}.$1})
endef
$(foreach _,${DEPEND_USE},$(eval $(call _dpd_syspkg,$_)))

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


# --- export any overrides settings for dependencies -----------------------

# export a PKGREQD for dependencies. This matters for those that have
# options/alternatives requirements imposed by parents.
#
override define _dpd_overrides
  $(if ${DEPEND_DIR.$1},\
    $(call _export_override,${DEPEND_DIR.$1},PKGREQD,${DEPEND_ABI.$1}))
endef
$(foreach _,${DEPEND_USE},$(eval $(call _dpd_overrides,$_)))


# --- register dependencies on _COOKIE.{bootstrap-,}depends ----------------

# A dependency on all files from all SYSTEM_FILES dependencies is registered as
# an attempt to detect stale WRKDIR and trigger rebuild.
#
# Except when cleaning.
#
$(foreach _pkg_,${DEPEND_USE},						\
  $(if $(filter bootstrap,${DEPEND_METHOD.${_pkg_}}),			\
    $(eval ${_COOKIE.bootstrap-depends}:				\
	$(filter-out /notfound,${SYSTEM_FILES.${_pkg_}})),		\
    $(eval ${_COOKIE.depends}:						\
	$(filter-out /notfound,${SYSTEM_FILES.${_pkg_}}))		\
))

# Disable any recipe for files in SYSTEM_FILES
$(sort $(foreach _pkg_,${DEPEND_USE},${SYSTEM_FILES.${_pkg_}})):;


# Top-level targets that require {bootstrap-,}depends
ifneq (,$(filter ${_barrier.bootstrap-depends},${MAKECMDGOALS}))
  _cbeh_requires+=	${_COOKIE.bootstrap-depends}
endif
ifneq (,$(filter ${_barrier.depends},${MAKECMDGOALS}))
  _cbeh_requires+=	${_COOKIE.bootstrap-depends}
  _cbbh_requires+=	${_COOKIE.depends}
endif


# --- resolve-alternatives -------------------------------------------------

# resolve-alternatives generates the alternative resolution results in a
# temporary file. This file is included if present and caches the results of
# the resolution.
#
.PHONY: resolve-alternatives
resolve-alternatives:
	${RUN} >${_ALTERNATIVES_FILE}; exec 3>>${_ALTERNATIVES_FILE};	\
  $(foreach _,${PKG_ALTERNATIVES},					\
	${ECHO} 1>&3 'PKG_ALTERNATIVE.$_=${PKG_ALTERNATIVE.$_}';	\
  )


# --- supported-alternatives-message ---------------------------------------
#
# print an informative message that lists the available alternatives for this
# package.
#

ifdef PKG_ALTERNATIVES
  pre-depends-hook: supported-alternatives-message

  .PHONY: supported-alternatives-message
  supported-alternatives-message:
	@${PHASE_MSG} "Checking alternatives for ${PKGNAME}";		\
  $(foreach _, $(sort ${PKG_ALTERNATIVES}),				\
	  ${STEP_MSG} '${PKG_ALTERNATIVE_DESCR.${PKG_ALTERNATIVE.$_}}:'	\
	    '${DEPEND_ABI.$_} provided by'				\
	    '${DEPEND_ABI.${PKG_ALTERNATIVE.$_}}';			\
  )									\
	if ${TEST} -t 1; then						\
	  ${ECHO_MSG} "You may want to abort the process now with"	\
		"CTRL-C and review the";				\
	  ${ECHO_MSG} "available alternatives with \`${MAKE}"		\
		"show-options' before";					\
	  ${ECHO_MSG} "continuing. Be sure to run \`${MAKE} clean'"	\
		"after any change.";					\
	fi
endif
