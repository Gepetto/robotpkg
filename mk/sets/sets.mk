#
# Copyright (c) 2010 LAAS/CNRS
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

# --- set-<simple>-% -------------------------------------------------------

# Simple recursive targets for a set. Make sure to put clean-depends before
# clean, otherwise strange things happen.
#
set-clean-depends-%: .FORCE
	${RUN}$(call _pkgset_recursive,clean-depends,${PKGSET.$*})

set-clean-%: .FORCE
	${RUN}$(call _pkgset_recursive,clean,${PKGSET.$*})

set-fetch-%: .FORCE
	${RUN}$(call _pkgset_recursive,fetch clean clean-depends,${PKGSET.$*})

set-extract-%: .FORCE
	${RUN}$(call _pkgset_recursive,extract,${PKGSET.$*})

set-install-%: .FORCE
	${RUN}$(call _pkgset_recursive_sorted,install)

set-replace-%: .FORCE
	${RUN}$(call _pkgset_recursive_sorted,replace clean clean-depends)

set-update-%: .FORCE
	${RUN}$(call _pkgset_recursive_sorted,update)


# --- recursion ------------------------------------------------------------

# simple recursion
override define _pkgset_recursive
	$(if $(call isyes,${PKGSET_STRICT}),set="${PKGSET.$*}";)\
	for pkg in "" $2; do					\
	  $(if $(call isyes,${PKGSET_STRICT}),			\
	    case " $$set " in *" $$pkg "*,			\
	    case "$$pkg" in ?*))				\
	      if cd ${ROBOTPKG_DIR}/$$pkg 2>/dev/null; then	\
	        ${ECHO_MSG} $${bf}'[$*] Processing' $$pkg$${rm};\
	        ${RECURSIVE_MAKE} 				\
			$1 $(filter confirm,${MAKECMDGOALS}) ||	\
	          { $(call PKGSET_RECURSIVE_ERR,$$pkg) };	\
	      else						\
	        $(call PKGSET_NONEXISTENTPKG_ERR,$$pkg,$*)	\
	      fi;;						\
	  esac;							\
	done;							\
	${ECHO_MSG} $${bf}'[$*]'				\
	  "Done$(patsubst %-$*, \`%',${MAKECMDGOALS})"		\
	  'for $*'$${rm}
endef

# sorted recursion
override define _pkgset_recursive_sorted
	${ECHO_MSG} $${bf}'[$*] Sorting dependencies'$${rm};	\
	sorted=`${_pkgset_tsort_deps} ${PKGSET.$*}` 2>&1;	\
	$(call _pkgset_recursive,$1,$$sorted)
endef



# --- tsort dependencies ---------------------------------------------------

override define _pkgset_tsort_deps
  ${SETENV} SETENV=${SETENV} MAKE=${MAKE} TEST=${TEST} TSORT=${TSORT}	\
	ROBOTPKG_DIR=${ROBOTPKG_DIR}					\
  ${AWK} -f ${ROBOTPKG_DIR}/mk/sets/tsort-set.awk --
endef
