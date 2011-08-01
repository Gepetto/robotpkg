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
#                                            Anthony Mallet on Tue Jul 12 2011
#

# This Makefile is included by robotpkg.mk and defines the show-% targets that
# display miscellaneous information about a package.

# basically require everything so that all possible variables are correctly
# defined
$(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)
$(call require, ${ROBOTPKG_DIR}/mk/compiler/compiler-vars.mk)
$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)


# --- show-var -------------------------------------------------------------
#
# convenience target, to display make variables from command line
# i.e. "make show-var VARNAME=var", will print var's value
#
$(call require-for, show-var show-vars,				\
	$(if $(findstring PKG_, ${VARNAME} ${VARNAMES}),	\
		${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk))

.PHONY: show-var
show-var: export _value=${${VARNAME}}
show-var:
	@${ECHO} "$$_value"

# enhanced version of target above, to display multiple variables
.PHONY: show-vars
show-vars:
	@:; $(foreach _v_,${VARNAMES},\
		${RECURSIVE_MAKE} show-var VARNAME=${_v_};)


# --- show-comment ---------------------------------------------------------
#
# print value of the COMMENT variable
#
.PHONY: show-comment
show-comment:
	@if [ $(call quote,${COMMENT})"" ]; then			\
		${ECHO} $(call quote,${COMMENT});			\
	elif [ -f COMMENT ] ; then					\
		${CAT} COMMENT;						\
	else								\
		${ECHO} '(no description)';				\
	fi


# --- show-license ---------------------------------------------------------
#
# browse the file pointed to by the LICENSE variable
#
LICENSE_FILE?=	$(addprefix ${ROBOTPKG_DIR}/licenses/,${LICENSE})

.PHONY: show-license
show-license:
	@license_file="${LICENSE_FILE}";				\
	pager=${PAGER};							\
	case "$$pager" in "") pager=${CAT};; esac;			\
	case "$$license_file" in "") exit 0;; esac;			\
	for l in $$license_file; do					\
	  if ${TEST} -f "$$l"; then					\
		$$pager "$$l";						\
	  else								\
		${ECHO} "Generic $${l##*/} information not available";	\
	  fi;								\
	done


# --- show-depends ---------------------------------------------------------
#
# Output a human readable list of dependencies and how they resolve
#
.PHONY: show-depends
show-depends:
	${RUN}${PHASE_MSG} "Scanning packages for ${PKGNAME}";		\
	${_pkgset_tsort_deps} -n ${PKGPATH} | while read dir; do	\
	  cd ${ROBOTPKG_DIR}/$$dir &&					\
	  ${RECURSIVE_MAKE} print-depends WRKDIR=${WRKDIR}/$$dir || {	\
	    ${ERROR_MSG} "Could not process $$dir";			\
	  };								\
	done | ${AWK} -F'|' -v bf=$$bf -v rm=$$rm '			\
	  /^print-depends\|robotpkg/ {					\
	    if ($$4 == "-") {						\
	        r[$$3] = bf "missing - install " $$5 rm;		\
	    } else {							\
		r[$$3] = "found " $$4;					\
            }								\
	    rdeps=1; next;						\
	  }								\
	  /^print-depends\|system/ {					\
	    if ($$4 == "-") {						\
		s[$$3] = bf "missing - install $(strip			\
		  $(or ${OPSUBSYS},${OPSYS})) package";			\
	        for(i=5; i<=NF; i++) s[$$3] = s[$$3] " " $$i;		\
		s[$$3] = s[$$3] rm;					\
	    } else {							\
		s[$$3] = "found " $$4 " in " $$5;			\
	    }								\
	    sdeps=1; next;						\
	  }								\
	  { print }							\
	  END {								\
	    if (rdeps || sdeps) { print ""; }				\
	    sort = "${SORT} 2>/dev/null";				\
	    if (rdeps) {						\
	      print bf "Robotpkg dependencies" rm;			\
	      for(a in r) printf("%-20s: %s\n", a, r[a]) | sort;	\
	      close(sort);						\
	    }								\
	    if (sdeps) {						\
	      print bf "\nSystem dependencies" rm;			\
	      for(a in s) printf("%-20s: %s\n", a, s[a]) | sort;	\
	      close(sort);						\
	    }								\
	  }'


# --- show-depends-pkgpaths ------------------------------------------------
#
# DEPENDS_TYPE is used by the "show-depends-pkgpaths" target and specifies
# which class of dependencies to output.  The special value "all" means
# to output every dependency.
#
DEPENDS_TYPE?=  all
_depends_type=
ifneq (,$(strip $(filter build all,${DEPENDS_TYPE})))
  _depends_type+=	bootstrap build
endif
ifneq (,$(strip $(filter run all,${DEPENDS_TYPE})))
  _depends_type+=	full
endif

.PHONY: show-depends-pkgpaths
show-depends-pkgpaths:
	${RUN}								\
  $(foreach _pkg_,${DEPEND_USE},					\
    $(if $(filter ${_depends_type},${DEPEND_METHOD.${_pkg_}}),		\
      $(if ${DEPEND_DIR.${_pkg_}},					\
        $(if $(filter robotpkg,${PREFER.${_pkg_}}),			\
	  ${ECHO} $(subst ${ROBOTPKG_DIR}/,,$(realpath			\
		${DEPEND_DIR.${_pkg_}}));				\
        )								\
      )									\
    )									\
  )


# --- show-options ---------------------------------------------------------
#
# print the list of available options for this package.
#
.PHONY: show-options
show-options:
ifndef PKG_SUPPORTED_OPTIONS
	@${ECHO} "This package does not use the options framework."
else
  ifneq (,$(strip ${PKG_GENERAL_OPTIONS}))
	@${ECHO} "$${bf}Any of the following general options may"	\
		"be selected$${rm}:"
	${RUN}$(foreach _o_, $(sort ${PKG_GENERAL_OPTIONS}),		\
	  $(call _pkgopt_listopt,${_o_}))
  endif
	${RUN}$(foreach _g_, ${PKG_OPTIONS_REQUIRED_GROUPS},		\
	  ${ECHO}; ${ECHO} "${bf}Exactly one of the following ${_g_}"	\
		"options is required${rm}:";				\
	  $(call _pkgopt_listopt,${PKG_OPTIONS_GROUP.${_g_}}))
	${RUN}$(foreach _g_, ${PKG_OPTIONS_OPTIONAL_GROUPS},		\
	  ${ECHO}; ${ECHO} "${bf}At most one of the following ${_g_}"	\
		"options may be selected${rm}:";			\
	  $(call _pkgopt_listopt,${PKG_OPTIONS_GROUP.${_g_}}))
	${RUN}$(foreach _s_, ${PKG_OPTIONS_NONEMPTY_SETS},		\
	  ${ECHO}; ${ECHO} "$${bf}At least one of the following ${_s_}"	\
		"options must be selected$${rm}:";			\
	  $(call _pkgopt_listopt,${PKG_OPTIONS_SET.${_s_}}))
	@${ECHO}
	@${ECHO} "$${bf}These options are enabled by default$${rm}:"
  ifneq (,$(strip ${PKG_SUGGESTED_OPTIONS}))
	@${ECHO} $(call quote,$(sort ${PKG_SUGGESTED_OPTIONS})) | ${wordwrapfilter}
  else
	@${ECHO} "	(none)"
  endif
	@${ECHO} ""
	@${ECHO} "$${bf}These options are currently enabled$${rm}:"
  ifneq (,$(strip ${PKG_OPTIONS}))
	@${ECHO} $(call quote,$(sort ${PKG_OPTIONS})) | ${wordwrapfilter}
  else
	@${ECHO} "	(none)"
  endif
	@${ECHO} ""
	@${ECHO} "You can select which build options to use by"		\
		"setting PKG_DEFAULT_OPTIONS or "			\
		$(call quote,${PKG_OPTIONS_VAR})" to the list of"	\
		"desired options. Options prefixed with a dash (-)"	\
		"will be disabled. The variables are to be set in"	\
		${MAKECONF}"." | fmt
endif # !PKG_SUPPORTED_OPTIONS
