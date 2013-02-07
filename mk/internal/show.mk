#
# Copyright (c) 2011,2013 LAAS/CNRS
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
$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)


# --- show-var -------------------------------------------------------------
#
# convenience target, to display make variables from command line
# i.e. "make show-var VARNAME=var", will print var's value
#
.PHONY: show-var
show-var:
	@${ECHO} $(call quote,${${VARNAME}})

# enhanced version of target above, to display multiple variables
.PHONY: show-vars
show-vars:
	@:; $(foreach _,${VARNAMES},${ECHO} $(call quote,${$_});)


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
	${_pkgset_tsort_deps} -e -n ${PKGPATH} |			\
	while IFS=: read dir pkg; do					\
	  if ${TEST} -z "$$dir"; then					\
	     ${PHASE_MSG} >&2 "$$pkg"; continue;			\
	  fi;								\
	  if ${TEST} "$$dir" = "***"; then				\
	    ${ERROR_MSG} "$$pkg"; continue;				\
	  fi;								\
	  cd ${ROBOTPKG_DIR}/$$dir &&					\
	  ${RECURSIVE_MAKE} print-depends				\
		PKGREQD="$$pkg" WRKDIR=${WRKDIR}/$$dir || {		\
	    ${ERROR_MSG} "Could not process $$dir";			\
	  };								\
	  ${RM} -rf 2>/dev/null ${WRKDIR}/$$dir ||:;			\
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
		s[$$3] = bf "missing - install ${OPSYS} package";	\
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


# --- show-options ---------------------------------------------------------
#
# print the list of available options for this package.
#
.PHONY: show-options
show-options:
ifdef PKG_ALTERNATIVES
	@								\
  $(foreach _,${PKG_ALTERNATIVES},$(if ${PKG_ALTERNATIVES.$_},		\
	${ECHO} "$${bf}Available $_ alternatives"			\
		"(PREFER_ALTERNATIVE.$_):$${rm}";			\
    $(foreach 1,${PKG_ALTERNATIVES.$_},					\
      $(if $(strip ${PKG_ALTERNATIVE_SELECT.$1}),			\
        $(eval 0=$(if $(filter ${PKG_ALTERNATIVE.$_},$1),*))		\
        $(eval n=$(or $(call wordn,$1,${PREFER_ALTERNATIVE.$_})))	\
	${PRINTF} "%s%2s %-21s$$rm ${PKG_ALTERNATIVE_DESCR.$1}\n"	\
	  "$(if $0,$${bf})" "$0$n" "$1";))				\
	${ECHO} "";))							\
	${ECHO} "Alternatives are selected by setting the"		\
		"PREFER_ALTERNATIVE.<alt> variable ";			\
	${ECHO} "to a space separated list sorted by order of"		\
		"preference in";					\
	${ECHO} "${MAKECONF}.";						\
	${ECHO} ""
endif
ifdef PKG_SUPPORTED_OPTIONS
  ifneq (,$(strip ${PKG_GENERAL_OPTIONS}))
	@${ECHO} "$${bf}Any of the following general options may"	\
		"be selected$${rm}:";					\
  $(foreach _, $(sort ${PKG_GENERAL_OPTIONS}),				\
    $(eval 0=$(if $(filter ${PKG_OPTIONS},$_),*))			\
    $(eval d=$(if $(filter ${PKG_SUGGESTED_OPTIONS},$_),d))		\
	${PRINTF} "%s%-2s %-20s$$rm ${PKG_OPTION_DESCR.$_}\n"		\
		"$(if $0,$${bf})" "$0$d" "$_";)
  endif
	@								\
  $(foreach -, ${PKG_OPTIONS_REQUIRED_GROUPS},				\
	  ${ECHO}; ${ECHO} "${bf}Exactly one of the following $-"	\
		"options is required${rm}:";				\
    $(foreach _, ${PKG_OPTIONS_GROUP.$-},				\
      $(eval 0=$(if $(filter ${PKG_OPTIONS},$_),*))			\
      $(eval d=$(if $(filter ${PKG_SUGGESTED_OPTIONS},$_),d))		\
	${PRINTF} "%s%-2s %-20s$$rm ${PKG_OPTION_DESCR.$_}\n"		\
		"$(if $0,$${bf})" "$0$d" "$_";))			\
  $(foreach -, ${PKG_OPTIONS_OPTIONAL_GROUPS},		\
	${ECHO}; ${ECHO} "${bf}At most one of the following $-"		\
		"options may be selected${rm}:";			\
    $(foreach _, ${PKG_OPTIONS_GROUP.$-},				\
      $(eval 0=$(if $(filter ${PKG_OPTIONS},$_),*))			\
      $(eval d=$(if $(filter ${PKG_SUGGESTED_OPTIONS},$_),d))		\
	${PRINTF} "%s%-2s %-20s$$rm ${PKG_OPTION_DESCR.$_}\n"		\
		"$(if $0,$${bf})" "$0$d" "$_";))			\
  $(foreach -, ${PKG_OPTIONS_NONEMPTY_SETS},				\
	${ECHO}; ${ECHO} "$${bf}At least one of the following $-"	\
		"options must be selected$${rm}:";			\
    $(foreach _, ${PKG_OPTIONS_SET.$-},					\
      $(eval 0=$(if $(filter ${PKG_OPTIONS},$_),*))			\
      $(eval d=$(if $(filter ${PKG_SUGGESTED_OPTIONS},$_),d))		\
	${PRINTF} "%s%-2s %-20s$$rm ${PKG_OPTION_DESCR.$_}\n"		\
		"$(if $0,$${bf})" "$0$d" "$_";))			\
	${ECHO} "";							\
	${ECHO} "Options are selected by setting ${PKG_OPTIONS_VAR}";	\
	${ECHO} "or PKG_DEFAULT_OPTIONS to the list of desired options"	\
		"in";							\
	${ECHO} "${MAKECONF}.";						\
	${ECHO} "Options prefixed with a dash (-) will be disabled."
endif # !PKG_SUPPORTED_OPTIONS
ifndef PKG_SUPPORTED_OPTIONS
  ifndef PKG_ALTERNATIVES
	@${ECHO} "This package has no configurable options."
  endif
endif
