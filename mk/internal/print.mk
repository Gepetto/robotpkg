#
# Copyright (c) 2011 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#                                            Anthony Mallet on Mon Aug  1 2011
#

$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)


# --- print-depends (PRIVATE) ----------------------------------------------

# List the direct dependencies and check if they are installed

.PHONY: print-depends
print-depends: $(call add-barrier, bootstrap-depends, print-depends)
print-depends: print-depends-full

_chkdep_type=			full build bootstrap

_chkdep_filter.full=		full build bootstrap
_chkdep_filter.build=		build bootstrap
_chkdep_filter.bootstrap=	bootstrap

print-depends-build: $(call add-barrier, bootstrap-depends, print-depends-build)
print-depends-full: $(call add-barrier, bootstrap-depends, print-depends-full)

$(addprefix print-depends-,${_chkdep_type}): print-depends-%: .FORCE
	${RUN}								\
  $(foreach _pkg_,${DEPEND_USE},					\
    $(if $(filter ${_chkdep_filter.$*},${DEPEND_METHOD.${_pkg_}}),	\
      $(if $(filter robotpkg,${PREFER.${_pkg_}}),			\
	  ${_PKG_BEST_EXISTS} '${DEPEND_ABI.${_pkg_}}' | ${AWK}		\
	    'BEGIN { pkg="-" } NR==1 { pkg=$$0 } END {			\
		printf("print-depends|robotpkg|%s|%s|%s\n",		\
		  "${DEPEND_ABI.${_pkg_}}", pkg,			\
		  "${DEPEND_DIR.${_pkg_}}")}';				\
	,								\
	{ exec 9>&1; ${_PREFIXSEARCH_CMD}				\
	     -p $(call quote,$(or ${PREFIX.${_pkg_}},${SYSTEM_PREFIX}))	\
		$(call quote,${_pkg_})					\
		$(call quote,${DEPEND_ABI.${_pkg_}})			\
		${SYSTEM_SEARCH.${_pkg_}} 2>&1 1>&9 | ${WARNING_CAT};	\
	} | ${AWK}							\
	    -v pkg="-" -v prefix=$(call quote,$(strip			\
		$(or ${SYSTEM_PKG.${OPSYS}-${OPSUBSYS}.${_pkg_}},	\
		     ${SYSTEM_PKG.${OPSYS}.${_pkg_}},			\
		     ${DEPEND_ABI.${_pkg_}}))) '			\
	     NR==1 { pkg=$$0 } NR==2 { split($$0, p, ":="); prefix=p[2]}\
	     END {							\
	       printf("print-depends|system|%s|%s|%s\n",		\
		 "${DEPEND_ABI.${_pkg_}}", pkg,	prefix)			\
	     }';							\
  )))


# --- print-pkgnames -------------------------------------------------------
#
# print value of all possible PKGNAME (taking into account current
# PKG_DEFAULT_OPTIONS + PKG_OPTIONS_VAR and PREFER_ALTERNATIVE settings)
#
# This is done via recursive macros that output the leaves of the tree of all
# names via $(info) to avoid overflooding memory/shell environment etc.)
#

# helper macro filtering options set or not set by user
override define combiset+opts
$(filter-out -%,$(filter ${PKG_SUPPORTED_OPTIONS},
  ${PKG_DEFAULT_OPTIONS} ${${PKG_OPTIONS_VAR}}))
endef
override define combiset-opts
$(patsubst -%,%,$(filter -%,
  ${PKG_DEFAULT_OPTIONS} ${${PKG_OPTIONS_VAR}}))
endef

# generate all alternatives and return the PKGNAME for each so that it can be
# sorted for unicity afterwards. This relies on PKGNAME[_NOTAG] being correctly
# recursively defined so that merely setting PKG_ALTERNATIVE and PKG_OPTIONS
# will produce the right PKGNAME[_NOTAG] value.
override define combiname-alt # (alternative list, options)
$(strip $(if $1,							\
    $(foreach _,${PREFER_ALTERNATIVE.$(word 1,$1)},			\
      $(call combiname-alt,$(call cdr,$1),$2,$3 $(word 1,$1):=$_)),	\
  $(foreach _,$3,$(eval PKG_ALTERNATIVE.$_))$(eval PKG_OPTIONS:=$2)	\
  ${PKGNAME}))
endef

# generate general options combinations and invoke alternatives expansion for
# each. Sort the result and output via $(info) if non in conflict with user
# options.
override define combiname-genopt # (list)
$(strip $(if $1,							\
    $(call combiname-genopt,$(call cdr,$1),$2)				\
    $(call combiname-genopt,$(call cdr,$1),$2+$(word 1,$1)),		\
  $(if $(strip								\
      $(foreach _,${combiset-opts},$(findstring +$_+,$2+))		\
      $(foreach _,${combiset+opts},$(if $(findstring +$_+,$2+),,$_))),,	\
    $(foreach _,$(sort							\
        $(call combiname-alt,${PKG_ALTERNATIVES},$(subst +, ,$2))),	\
      $(info $@|$_)))))
endef

# generate non-emtpy set combinations for one set
override define combiname-nonemptyopt # (list)
$(strip $(if $1,							\
    $(call combiname-nonemptyopt,$(call cdr,$1),$2)			\
    $(call combiname-nonemptyopt,$(call cdr,$1),$2+$(word 1,$1)),	\
  $(patsubst +%,%,$2)))
endef

# generate all non-emtpy set combinations
override define combiname-nonemptyset # (list)
$(strip $(if $1,							\
    $(foreach _,$(call combiname-nonemptyopt,${PKG_OPTIONS_SET.$1}),	\
      $(call combiname-nonemptyset,$(call cdr,$1),$2+$_)),		\
  $(call combiname-genopt,${PKG_GENERAL_OPTIONS},$2)))
endef

# generate all optional groups options
override define combiname-optopt # (list)
$(strip $(if $1,							\
  $(foreach _,${PKG_OPTIONS_GROUP.$(word 1,$1)},			\
    $(call combiname-optopt,$(call cdr,$1),$2)				\
    $(call combiname-optopt,$(call cdr,$1),$2+$_)),			\
   $(call combiname-nonemptyset,${PKG_OPTIONS_NONEMPTY_SETS},$2)))
endef

# generate all required groups options
override define combiname-reqopt # (list)
$(strip $(if $1,							\
    $(foreach _,${PKG_OPTIONS_GROUP.$(word 1,$1)},			\
      $(call combiname-reqopt,$(call cdr,$1),$2+$_)),			\
  $(call combiname-optopt,${PKG_OPTIONS_OPTIONAL_GROUPS},$2)))
endef

# general all names
override define combiname
$(call combiname-reqopt,${PKG_OPTIONS_REQUIRED_GROUPS})
endef

.PHONY: print-pkgnames
print-pkgnames:
	@: $(call combiname)
