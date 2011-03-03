#
# Copyright (c) 2010-2011 LAAS/CNRS
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
	${RUN}$(call _pkgset_recursive,clean,-n)

set-fetch-%: .FORCE
	${RUN}$(call _pkgset_recursive,fetch cleaner,-n)

set-extract-%: .FORCE
	${RUN}$(call _pkgset_recursive,extract,-n)

set-install-%: .FORCE
	${RUN}$(call _pkgset_recursive,install)

set-replace-%: .FORCE
	${RUN}$(call _pkgset_recursive,replace cleaner)

set-update-%: .FORCE
	${RUN}$(call _pkgset_recursive,update)

set-deinstall-%: .FORCE
	${RUN}$(call _pkgset_recursive,deinstall,-r)


# --- recursion ------------------------------------------------------------

override define _pkgset_recursive
	${PHASE_MSG} $(if $(filter -n,$2),'Scanning','Sorting')		\
	  'packages for ${PKGSET_DESCR.$*}';				\
	${_pkgset_tsort_deps} $2					\
	  $(if $(call isyes,${PKGSET_STRICT.$*}),-s) ${PKGSET.$*} |	\
	while read pkg; do						\
	  case "$$pkg" in -*) continue;; ?*)				\
	    if cd ${ROBOTPKG_DIR}/$$pkg 2>/dev/null; then		\
	      ${RECURSIVE_MAKE} $1 $(filter confirm,${MAKECMDGOALS}) ||{\
	          $(call PKGSET_RECURSIVE_ERR,$$pkg)			\
	      };							\
	    else							\
	      $(call PKGSET_NONEXISTENTPKG_ERR,$$pkg,$*)		\
	    fi;;							\
	  esac;								\
	done;								\
	${PHASE_MSG} 'Done $(patsubst set-%-$*,%,$@) for'		\
	  '${PKGSET_DESCR.$*}'
endef
