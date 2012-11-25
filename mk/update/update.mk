#
# Copyright (c) 2006-2012 LAAS/CNRS
# Copyright (c) 1994-2006 The NetBSD Foundation, Inc.
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
#   3. All  advertising  materials  mentioning   features  or use of this
#      software must display the following acknowledgement:
#        This product includes software developed by the NetBSD
#        Foundation, Inc. and its contributors.
#   4. Neither the  name  of The NetBSD Foundation  nor the names  of its
#      contributors  may be  used to endorse or promote  products derived
#      from this software without specific prior written permission.
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
# From $NetBSD: bsd.pkg.update.mk,v 1.7 2006/10/05 12:56:27 rillig Exp $
#
#                                       Anthony Mallet on Thu Dec  7 2006
#

# This Makefile fragment contains the targets and variables for
# "make update".
#

$(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)
$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)
$(call require, ${ROBOTPKG_DIR}/mk/sets/sets-vars.mk)

# --- update (PUBLIC) ------------------------------------------------------

# The 'update' target is a public target to update a package and all
# currently installed packages that depend upon this package.
#
_UPDATE_TARGETS+=	cbbh
_UPDATE_TARGETS+=	update-message
_UPDATE_TARGETS+=	pre-update
_UPDATE_TARGETS+=	update-create-dlist
ifeq (,$(filter replace,${UPDATE_TARGET}))
  _UPDATE_TARGETS+=	$(call if-outdated-pkg,update-deinstall-dlist)
endif
_UPDATE_TARGETS+=	do-update
_UPDATE_TARGETS+=	post-update
_UPDATE_TARGETS+=	update-clean
_UPDATE_TARGETS+=	update-done-message

ifeq (yes,$(call only-for,update,yes))	     # if we are asking for an update
  ifneq (yes,$(call exists,${_UPDATE_LIST})) # not resuming a previous one
    ifeq (,$(filter confirm,${MAKECMDGOALS}))# with no confirmation
      ifneq (yes,$(call if-outdated-pkg,yes))# and the package is up-to-date
        _UPDATE_TARGETS:= cbbh               # let us do nothing
        _UPDATE_TARGETS+= update-up-to-date
      endif
    endif
  endif
endif

.PHONY: update
update: ${_UPDATE_TARGETS}


# --- do-update ------------------------------------------------------------

# Perform the update target; can be overriden.
#
do%update: .FORCE
	${_OVERRIDE_TARGET}
	${RUN}${TEST} -f ${_UPDATE_LIST} || exit 0;			\
	target='$(filter-out confirm,${UPDATE_TARGET})';		\
	${CP} ${_UPDATE_LIST} ${_UPDATE_LIST:=.current};		\
	while IFS=: read dir pkg <&9; do				\
	  if ${TEST} "$$dir" = "${PKGPATH}"; then			\
	    t="${UPDATE_TARGET}";					\
	  else								\
	    ${PHASE_MSG} "Verifying $$target for $$dir";		\
	    t=$$target;							\
	  fi;								\
	  if ${TEST} -f "${ROBOTPKG_DIR}/$${dir}/Makefile"; then	\
	    cd "${ROBOTPKG_DIR}/$${dir}" &&				\
	    ${RECURSIVE_MAKE} $$t PKGREQD="$$pkg"			\
		 DEPENDS_TARGET=${DEPENDS_TARGET} || {			\
		${ERROR_MSG} ${hline};					\
		${ERROR_MSG} "$${bf}'${MAKE} $$target' failed in"	\
			"$${dir}$${rm}";				\
		${ERROR_MSG} "";					\
		${ERROR_MSG} "Fix the problem, then re-run"		\
			"'${MAKE} ${MAKECMDGOALS}' in ${PKGPATH}";	\
		${ERROR_MSG} ${hline};					\
		exit 2;							\
	    };								\
	  else								\
	    ${PHASE_MSG} "Skipping nonexistent directory $${dir}";	\
	  fi;								\
	  ${CP} ${_UPDATE_LIST} ${_UPDATE_LIST:=.old};			\
	  ${SED} 1d <${_UPDATE_LIST:=.old} >${_UPDATE_LIST};		\
	done 9<${_UPDATE_LIST:=.current}

.PHONY: pre-update post-update

pre-update:

post-update:


.PHONY: update-message
update-message:
ifeq (yes,$(call exists,${_UPDATE_LIST}))
	@${PHASE_MSG} "Resuming update for ${PKGNAME}"
else
	@${PHASE_MSG} "Updating for ${PKGNAME}"
endif

.PHONY: update-up-to-date
update-up-to-date: update-message
	@${ECHO_MSG} "${PKGNAME} is already installed and up-to-date."
  ifeq (0,${MAKELEVEL})
	@if ${TEST} -t 1; then						\
	  ${ECHO_MSG}							\
	    "Use '${MAKE} ${MAKECMDGOALS} confirm' to force updating.";	\
	fi
  endif

# clean update files
.PHONY: update-clean
update-clean:
	${RUN}${TEST} -f ${_UPDATE_LIST:=.clean} || exit 0;		\
	while IFS=: read dir pkg <&9;do					\
	  if ${TEST} "$$dir" = "${PKGPATH}"; then continue; fi;		\
	  if ${TEST} -f "${ROBOTPKG_DIR}/$${dir}/Makefile"; then	\
	    cd "${ROBOTPKG_DIR}/$${dir}" &&				\
	    ${RECURSIVE_MAKE} cleaner || noclean=$$noclean" "$$dir;	\
	  else								\
	    nodir=$$nodir" "$$dir;					\
	  fi;								\
	done 9<${_UPDATE_LIST:=.clean};					\
	if ${TEST} -n "$$noclean"; then					\
	    ${WARNING_MSG} ${hline};					\
	    ${WARNING_MSG} "Unable to clean for:";			\
	    for pkg in $$noclean; do					\
	      ${WARNING_MSG} "		$$pkg";				\
	    done;							\
	    ${WARNING_MSG} ${hline};					\
	fi;								\
	if ${TEST} -n "$$nodir"; then					\
	    ${ERROR_MSG} ${hline};					\
	    ${ERROR_MSG} "The following packages were either moved or"	\
		"deleted and could not";				\
	    ${ERROR_MSG} "be reinstalled:";				\
	    for pkg in $$nodir; do					\
	      ${ERROR_MSG} "		$$pkg";				\
	    done;							\
	    ${ERROR_MSG} "";						\
	    ${ERROR_MSG} "Please reinstall them manually.";		\
	    ${ERROR_MSG} ${hline};					\
	    exit 2;							\
	fi
	${RUN} ${RM} -f ${_UPDATE_LIST} ${_UPDATE_LIST:=.current};	\
	${RM} -f ${_UPDATE_LIST:=.old} ${_UPDATE_LIST:=.clean};		\
	if ${TEST} "$(call isyes,${UPDATE_CLEAN})"; then		\
	  ${RECURSIVE_MAKE} cleaner;					\
	fi;								\


# compute the list of packages to update
.PHONY: update-create-dlist
update-create-dlist: ${_UPDATE_LIST}

${_UPDATE_LIST}: $(call if-outdated-pkg,.FORCE)
	${RUN} ${MKDIR} $(dir $@);					\
	if ${PKG_INFO} -qe '${PKGWILDCARD}' || ${TEST} -s $@; then	\
	  ${STEP_MSG} "Building package update list";			\
	  ${TEST} -t 1 && i="-i";					\
	  ${TEST} -f $@ && ${CP} $@ ${@:=.old};				\
	  >$@;								\
	  {								\
	    ${ECHO} '${PKGPATH}:${PKGREQD}';				\
	    ${TEST} -f ${@:=.old} && ${CAT} ${@:=.old};			\
	    for p in `${PKG_INFO} -qr '${PKGWILDCARD}' 2>/dev/null`; do	\
	      base=$${p%~*}; base=$${base%-*};				\
	      ${ECHO} `${PKG_INFO} -Q PKGPATH $$p`":$$base";		\
	    done;							\
	  } | ${_pkgset_tsort_deps} -1 -s $$i				\
	  | while IFS=: read dir pkg; do				\
	    if ${TEST} -z "$$dir"; then ${ECHO} "$$pkg"; continue; fi;	\
	    if ${TEST} "$$dir" = "***"; then				\
	      ${ERROR_MSG} "${hline}";					\
	      ${ERROR_MSG} "$${bf}Cannot update for"			\
		"$(or ${PKGREQD},${PKGNAME}):$${rm}";			\
	      ${ERROR_MSG} "$$pkg";					\
	      while IFS=: read dir pkg; do				\
	        if ${TEST} "$$dir" != "***"; then continue; fi;		\
	        ${ERROR_MSG} "$$pkg";					\
	      done;							\
	      ${ERROR_MSG} "";						\
	      ${ERROR_MSG} "To continue, you may wish to";		\
	      ${ERROR_MSG} "		$${bf}${MAKE} deinstall$${rm}"	\
		"in ${PKGPATH}";					\
	      ${ERROR_MSG} ${hline};					\
	      ${RM} $@; exit 2;						\
	    fi;								\
	    ${ECHO} "$$dir:$$pkg" >>$@;					\
	  done;								\
	  ${TEST} -s $@ || { ${RM} $@; exit 2; }			\
	else								\
	  ${ECHO} '${PKGPATH}:${PKGREQD}' >$@;				\
	fi;								\
	${CP} $@ ${@:=.clean}

# deinstall existing packages
.PHONY: update-deinstall-dlist
update-deinstall-dlist:
	${RUN}if ${PKG_INFO} -qe ${PKGBASE}; then			\
	  if ${TEST} -n "`${SED} -e '1d;q' < ${_UPDATE_LIST}`"; then	\
	    ${ECHO_MSG} "The following packages are going to be"	\
		"removed and reinstalled:";				\
	    while IFS=: read dir pkg <&9; do				\
	      ${ECHO_MSG} "	$$pkg in $$dir";			\
	    done 9<${_UPDATE_LIST};					\
	    while IFS=: read dir pkg <&9; do				\
	      ${TEST} "$$dir" != "${PKGPATH}" || continue;		\
	      cd "${ROBOTPKG_DIR}/$${dir}" &&				\
	        ${RECURSIVE_MAKE} cleaner || {				\
			${RM} ${_UPDATE_LIST}; exit 2;			\
		};							\
	    done 9<${_UPDATE_LIST};					\
	    cd ${CURDIR};						\
	  fi;								\
	  ${RECURSIVE_MAKE} deinstall					\
		_UPDATE_INPROGRESS=yes DEINSTALLDEPENDS=yes;		\
	fi
