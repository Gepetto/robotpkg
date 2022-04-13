#
# Copyright (c) 2010-2011,2013,2021-2022 LAAS/CNRS
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
#                                           Anthony Mallet on Thu Aug 26 2010
#

# --- set-<target>-% -------------------------------------------------------
#
# Recursive targets for a set.
#
set-clean-%: .FORCE
	${RUN}$(call _pkgset_do,clean,-n -p)

set-fetch-%: .FORCE
	${RUN}$(call _pkgset_do,fetch cleaner,-n -e)

set-extract-%: .FORCE
	${RUN}$(call _pkgset_do,extract,-1 -n -e)

set-install-%: .FORCE
	${RUN}$(call _pkgset_do,install,-1 -e)

set-replace-%: .FORCE
	${RUN}$(call _pkgset_do,replace cleaner,-1 -e)

set-update-%: .FORCE
	${RUN}$(call _pkgset_do,update,-1 -e)

set-bulk-%: .FORCE
	${RUN}$(call _pkgset_do,bulk,-e				\
	  -t 'LOCALBASE=${BULKBASE}'				\
	  -t 'EXPECT_TARGETS=fetch install package')

set-deinstall-%: .FORCE
	${RUN}$(call _pkgset_do,deinstall,-e -r)

set-mirror-distfiles-%: .FORCE
	${RUN}$(call _pkgset_do,mirror-distfiles,-e		\
	  -t 'EXPECT_TARGETS=mirror-distfiles')

set-show-var-%: .FORCE
	${RUN}$(call _pkgset_do,show-var)

set-print-var-%: .FORCE
	${RUN}$(call _pkgset_do,print-var,-n)


# --- recursion ------------------------------------------------------------
#
override define _pkgset_do
	$(if $(call isyes,${PKGSET_TOPLEVEL.$*}),			\
	  if ${TEST} "${_ROBOTPKG_DEPTH}" -ne 0; then			\
	    ${_pkgset_restart};						\
	    exit 0;							\
	  fi;)								\
	${_pkgset_recursive}
endef

# Expand and sort set and perform action for each package
override define _pkgset_recursive
	${PHASE_MSG} $(if $(filter -n,$2),'Scanning','Sorting')		\
	  'packages for ${PKGSET_DESCR.$*}';				\
	${TEST} -t 1 && i="-i";						\
	${_pkgset_tsort_deps}						\
		$(if $(call isyes,${PKGSET_STRICT.$*}),-s) $2 $$i	\
		$(call quote,${PKGSET.$*})				\
	| while IFS=: read dir pkg; do					\
	  if ${TEST} -z "$$dir"; then ${ECHO_MSG} "$$pkg"; continue; fi;\
	  if ${TEST} "$$dir" = "***"; then				\
	    ${ERROR_MSG} "${hline}";					\
	    ${ERROR_MSG} "$${bf}Cannot $1 for $*:$${rm}";		\
	    ${ERROR_MSG} "$$pkg";					\
	    while IFS=: read dir pkg; do				\
	      if ${TEST} "$$dir" != "***"; then continue; fi;		\
	      ${ERROR_MSG} "$$pkg";					\
	    done;							\
	    ${ERROR_MSG} ${hline};					\
	    exit 2;							\
	  fi;								\
	  if cd ${ROBOTPKG_DIR}/$$dir 2>/dev/null; then			\
	    confirm="$(filter confirm,${MAKECMDGOALS})";		\
	    ${RECURSIVE_MAKE} $1 $$confirm PKGREQD="$$pkg" || {		\
	      if test $$? -eq 130; then					\
	        ${ERROR_MSG} 'Interrupt'; exit 0;			\
	      fi;							\
	      $(call PKGSET_RECURSIVE_ERR,$$dir)			\
	    };								\
	  else								\
	    $(call PKGSET_NONEXISTENTPKG_ERR,$$dir,$*)			\
	  fi;								\
	done;								\
	${PHASE_MSG} 'Done $(patsubst set-%-$*,%,$@) for'		\
	  '${PKGSET_DESCR.$*}'
endef

# Restart from toplevel directory to avoid inheritance of alternatives
# defined by the package in the current directory.
override define _pkgset_restart
	unset ROBOTPKG_TRUSTED_ENV;					\
	cd ${ROBOTPKG_DIR};						\
	${MAKE} ${MFLAGS} ${MAKEOVERRIDES} ${MAKECMDGOALS}
endef
