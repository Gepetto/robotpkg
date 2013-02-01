#
# Copyright (c) 2011-2013 LAAS/CNRS
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
#                                           Anthony Mallet on Sat Feb 19 2011
#

$(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)


# --- bulk (PUBLIC) --------------------------------------------------------

# The 'bulk' target is a public target to build a binary package, and remove
# it (together with any depending packages) immediately after that, leaving
# only the binary package back.
#
_BULK_TARGETS+=	bulk-tag
_BULK_TARGETS+= cleaner
_BULK_TARGETS+=	bulk-message
_BULK_TARGETS+=	makedirs
_BULK_TARGETS+=	bulk-makedirs
_BULK_TARGETS+=	pre-bulk
_BULK_TARGETS+=	real-bulk
_BULK_TARGETS+=	bulk-log
_BULK_TARGETS+=	post-bulk
_BULK_TARGETS+=	bulk-clean
_BULK_TARGETS+=	bulk-done

# Do nothing if a package exists and no confirmation has been given.
_NOBULK_TARGETS= bulk-message
_NOBULK_TARGETS+= bulk-uptodate

# Do nothing if a STOP file exists
_STOPBULK_TARGETS= bulk-message
_STOPBULK_TARGETS+= bulk-stop-message

.PHONY: bulk
ifeq (,$(wildcard ${BULK_STOPFILE}))
  ifeq (,$(filter confirm,${MAKECMDGOALS}))
    bulk: $(call if-outdated-bulkpkg,${_BULK_TARGETS},${_NOBULK_TARGETS});
  else
    bulk: ${_BULK_TARGETS};
  endif
else
  bulk: ${_STOPBULK_TARGETS};
endif


.PHONY: bulk-message
bulk-message:
	@${PHASE_MSG} "Bulk building for ${PKGNAME}"

# The trick is to have make(1) report another status than 0,1 or 2
.PHONY: bulk-stop-message
bulk-stop-message:
	@${STEP_MSG} "Bulk cancelled by ${BULK_STOPFILE}"
	@ps -p $$$$ -o ppid= | { read ppid; kill -INT "$$ppid"; }


.PHONY: bulk-tag
bulk-tag:
  ifeq (0,${MAKELEVEL})
	@${STEP_MSG} 'Using $(if ${tag},,default )tag "${BULK_TAG}"'
    ifndef tag
	@if ${TEST} -t 1; then ${ECHO_MSG}				\
	  "Use '${MAKE} ${MAKECMDGOALS} tag=<tag>' to override.";	\
	fi
    endif
  endif

.PHONY: pre-bulk post-bulk
pre-bulk post-bulk:

.PHONY: bulk-done
bulk-done:
	@if ${TEST} -f ${_bulklog_broken}; then				\
	  ${PHASE_MSG} "Failed to do bulk for ${PKGNAME}";		\
	  ${ERROR_CAT} ${_bulklog_broken};				\
	  exit 2;							\
	else								\
	  ${PHASE_MSG} "Done bulk for ${PKGNAME}";			\
	fi


# --- ${_COOKIE.bulkoutdated} ----------------------------------------------
#
# Check if a binary package for PKGNAME is up-to-date. If not, create the
# ${_COOKIE.bulkoutdated} file, otherwise do nothing.
#
_MAKEFILE_WITH_RECIPES+=${_COOKIE.bulkoutdated}
${_COOKIE.bulkoutdated}: $(realpath ${PKGFILE})
	${RUN} ${TEST} -f "$@" && ${RM} -f "$@"; (			\
	  deps='$(filter-out $(realpath ${WRKDIR})/%,${MAKEFILE_LIST})';\
	  ${TEST} -f ${PKGFILE} || {					\
	    ${TEST} -f ${BULK_PKGFILENA} || exit 1;			\
	    for f in $$deps; do						\
	      ${TEST} ${BULK_PKGFILENA} -nt "$$f" || exit 1;		\
	    done;							\
	    while read d; do						\
	      if ${TEST} "$$d" = "--"; then break; fi;			\
	      d="$(dir ${BULK_PKGFILENA})/$$d";				\
	      ${TEST} ${BULK_PKGFILENA} -nt "$$d" || exit 1;		\
	    done <${BULK_PKGFILENA};					\
	    exit 0;							\
	  };								\
	  for f in $$deps ${DISTINFO_FILE} ${PLIST_SRC}; do		\
	    ${TEST} -f $$f || continue;					\
	    ${TEST} ${PKGFILE} -nt $$f || exit 1;			\
	  done;								\
	  base=`${BULK_PKG_INFO} -Q LOCALBASE ${PKGFILE} 2>/dev/null`;	\
	  ${TEST} "$${base}" = "${BULKBASE}" || exit 1;			\
	  ${BULK_PKG_INFO} -qn ${PKGFILE} 2>/dev/null | while read d; do\
	    if ${TEST} -z "$$d"; then continue; fi;			\
	    pkgfile=`${BULK_BESTAVAIL} "$$d"`;				\
	    ${TEST} -f "$$pkgfile" || exit 1;				\
	    ${TEST} ${PKGFILE} -nt "$$pkgfile" || exit 1;		\
	  done;								\
	) || {								\
	  ${MKDIR} $(dir $@) &&						\
	    ${ECHO} _BULKOUTDATED.${PKGPATH}:=yes >$@;			\
	}

.PHONY: bulk-uptodate
bulk-uptodate:
	@${ECHO_MSG} "Binary package for ${PKGNAME} is up-to-date."
  ifeq (0,${MAKELEVEL})
	@if ${TEST} -t 1; then ${ECHO_MSG}				\
	  "Use '${MAKE} ${MAKECMDGOALS} confirm' to force rebuilding.";	\
	fi
  endif


# --- real-bulk (PRIVATE) --------------------------------------------------
#
# Do the actual bulk
#
_REAL_BULK_TARGETS+=	bulk-log-clean
_REAL_BULK_TARGETS+=	bulk-cbbh
_REAL_BULK_TARGETS+=	bulk-check-noinstalled
_REAL_BULK_TARGETS+=	bulk-bootstrap-depends
_REAL_BULK_TARGETS+=	bulk-full-depends
_REAL_BULK_TARGETS+=	do-bulk
_REAL_BULK_TARGETS+=	bulk-remove-installed

.PHONY: real-bulk
real-bulk: override SHELL:=${_bulklog_filter}
real-bulk: ${_REAL_BULK_TARGETS};


# --- bulk-makedirs --------------------------------------------------------
#
# Check or create BULKBASE related directories.
#
_BULK_DIRS+=	${BULKBASE}
_BULK_DIRS+=	$(filter-out ${PKG_DBDIR},${BULK_DBDIR})
_BULK_DIRS+=	${BULK_LOGDIR}
_BULK_DIRS+=	${WRKDIR}

.PHONY: bulk-makedirs
ifneq (,$(call isyes,${MAKE_SUDO_INSTALL}))
  _SU_TARGETS+= bulk-makedirs
  bulk-makedirs: su-target-bulk-makedirs
  su-bulk-makedirs: ${_BULK_DIRS}
else
  bulk-makedirs: ${_BULK_DIRS}
endif

${_BULK_DIRS}:
	${RUN} status=`${MKDIR} $@ 2>&1` && exit 0 ||			\
	${ERROR_MSG} "${hline}";					\
	${ERROR_MSG} "$${bf}Unable to create bulk hierarchy:$${rm}";	\
	${ERROR_MSG} "	$$status";					\
	${ERROR_MSG} "";						\
	${ERROR_MSG} "$${bf}Please review your settings or create the"	\
		"following directories$${rm}";				\
	${ERROR_MSG} "$${bf}manually:$${rm}";				\
	${ERROR_MSG} "	BULKBASE = $(or ${BULKBASE},(empty))";		\
	${ERROR_MSG} "	BULK_LOGDIR ="					\
		'$(or $(value BULK_LOGDIR),(empty))';			\
	${ERROR_MSG} "	BULK_DBDIR ="					\
		'$(or $(value BULK_DBDIR),(empty))';			\
	${ERROR_MSG} "${hline}";					\
	exit 2


# --- bulk-cbbh ------------------------------------------------------------
#
# Check that the package can be bulked here
#
.PHONY: bulk-cbbh
bulk-cbbh:
	${RUN}								\
	${RM} -f ${BULK_PKGWILDNA};					\
	${RECURSIVE_MAKE} ${BULK_MAKE_ARGS} cbbh >${_bulklog_cbbh} 2>&1	\
	&& ${RM} -f ${_bulklog_cbbh};					\
	${TEST} ! -s ${_bulklog_cbbh} || ${CAT} >&2 <${_bulklog_cbbh}


# --- bulk-check-noinstalled -----------------------------------------------
#
# Check that there are no installed packages other than those marked as not for
# deletion.
#
.PHONY: bulk-check-noinstalled
bulk-check-noinstalled:
	${RUN} ${TEST} ! -s ${_bulklog_cbbh} || exit 0;			\
	${STEP_MSG} "Checking for clear installation";			\
	${FIND} ${BULKBASE}						\
		! \( ${BULK_FIND_FILES_IGNORE} \) ! -type d -print	\
	| while read f; do						\
	  pkg=`${BULK_PKG_INFO} -Fe $$f 2>/dev/null ||:`;		\
	  if ${TEST} -n "$$pkg"; then					\
	    ${TEST} ! -f ${BULK_DBDIR}/$$pkg/${_PRESERVE_FILE} ||	\
	      continue;							\
	    pkg=" ($$pkg)";						\
	  fi;								\
	  ${ERROR_MSG} "${hline}";					\
	  ${ERROR_MSG} "$${bf}Cluttered installation directory:$${rm}";	\
	  ${ERROR_MSG} "  ${BULKBASE}";					\
	  ${ERROR_MSG};							\
	  ${ERROR_MSG} "$${bf}The following files are in the way$${rm}"	\
		"$${bf}and must be removed:$${rm}";			\
	  ${ERROR_MSG} "  $${f#${BULKBASE}/}$$pkg";			\
	  while read f; do						\
	    pkg=`${BULK_PKG_INFO} -Fe $$f 2>/dev/null ||:`;		\
	    if ${TEST} -n "$$pkg"; then					\
	      ${TEST} ! -f ${BULK_DBDIR}/$$pkg/${_PRESERVE_FILE} ||	\
	        continue;						\
	      pkg=" ($$pkg)";						\
	    fi;								\
	    ${ERROR_MSG} "  $${f#${BULKBASE}/}$$pkg";			\
	    n=.$$n;							\
	    if ${TEST} "$${n##....................}" != "$$n"; then	\
	      ${ERROR_MSG} "  [more files skipped]";			\
	      break;							\
	    fi;								\
	  done;								\
	  if ${TEST} -t 1; then						\
	    ${ERROR_MSG};						\
	    ${ERROR_MSG} "Note: you can use another prefix by setting"	\
		"BULKBASE in";						\
	    ${ERROR_MSG} "      ${MAKECONF}";				\
	  fi;								\
	  ${ERROR_MSG} "${hline}";					\
	  exit 2;							\
	done


# --- bulk-{bootstrap,full}-depends ----------------------------------------
#
# Install the required dependencies from existing binary packages. Missing
# dependencies abort the process.
#
bulk-bootstrap-depends bulk-full-depends: bulk-%-depends: .FORCE
	${RUN}								\
	${TEST} ! -s ${_bulklog_cbbh} || exit 0;			\
	${TEST} ! -s ${_bulklog_broken} || exit 0;			\
	${PHASE_MSG} "Installing $* dependencies for ${PKGNAME}";	\
	{								\
	  ${RECURSIVE_MAKE} ${BULK_MAKE_ARGS} print-depends-$* ||	\
	  ${BULK_BRK} "${MAKE}: *** [print-depends-$*] Error $$?";	\
	} | while IFS='|' read tag kind abi pkg dir; do			\
	  if ${TEST} "$$tag" != "print-depends"; then			\
	    ${ECHO} "$$tag"; continue;					\
	  fi;								\
									\
	  if ${TEST} "$$kind" != "robotpkg"; then			\
	    if ${TEST} "$$pkg" = "-"; then				\
	      ${BULK_BRK} "Required $$kind package $$abi: MISSING";	\
	    fi;								\
	    continue;							\
	  fi;								\
									\
	  pkgfile=`${BULK_BESTAVAIL} "$$abi"`;				\
	  if ${TEST} -z "$$pkgfile"; then				\
	    brk=`${BULK_PKG_ADMIN} -d ${BULK_LOGDIR} -S lsbest "$$abi"`;\
	    if ${TEST} -s "$$brk/$(notdir ${_bulklog_broken})"; then	\
	      ${BULK_BRK} "Required $$kind package $$abi: BROKEN";	\
	      if ${TEST} -s "$$brk/$(notdir ${_bulklog_brokenby})"; then\
	        ${CAT} <"$$brk/$(notdir ${_bulklog_brokenby})"		\
			>>${_bulklog_brokenby};				\
	      else							\
	        ${BULK_BRKBY} "$${brk##*/}";				\
	      fi;							\
	      continue;							\
	    elif ${TEST} -s "$$brk/$(notdir ${_bulklog_cbbh})"; then	\
	      ${STEP_MSG} "Required $$kind package $$abi: N/A";		\
	      ${BULK_CBBH} "Required $$kind package $$abi: N/A";	\
	      if ${TEST} -s "$$brk/$(notdir ${_bulklog_cbbhby})"; then	\
	        ${CAT} <"$$brk/$(notdir ${_bulklog_cbbhby})"		\
			>>${_bulklog_cbbhby};				\
	      else							\
	        ${BULK_CBBHBY} "$${brk##*/}";				\
	      fi;							\
	      continue;							\
	    else							\
	      na=`${BULK_PKG_ADMIN} -d $(dir ${BULK_PKGFILENA})	-S	\
		lsbest "$$abi"`;					\
	      if ${TEST} -n "$$na"; then				\
	        ${STEP_MSG} "Required $$kind package $$abi: N/A";	\
	        ${BULK_CBBH} "Required $$kind package $$abi: N/A";	\
	        l=; while read p; do					\
	          if ${TEST} "$$p" = "--"; then break; fi;		\
	          l=yes; ${BULK_CBBHBY} "$$p";				\
	        done <"$$na";						\
	        if ${TEST} -z "$$l"; then				\
	          ${BULK_CBBHBY} "$${na##*/}";				\
	        fi;							\
	        continue;						\
	      fi;							\
	    fi;								\
									\
	    ${STEP_MSG} "Required $$kind package $$abi: NOT found";	\
	    ${BULK_BRK} "Required $$kind package $$abi: NOT found";	\
	    continue;							\
	  fi;								\
									\
	  best=`${BULK_BESTINSTALLED} "$$abi" ||:`;			\
	  if ${TEST} -n "$$best"; then					\
	    ${STEP_MSG} "Dependency $$best already installed";		\
	    continue;							\
	  fi;								\
	  ${STEP_MSG} "Installing $${pkgfile##*/}";			\
	  ${BULK_PKG_ADD} -u -A $$pkgfile ||				\
	    ${BULK_BRK} "Installing $${pkgfile##*/}: Error $$?";	\
	done;								\
	${TEST} ! -s ${_bulklog_cbbh} || {				\
	  ${RM} -f ${_bulklog_broken} ${_bulklog_brokenby};		\
	  exit 0;							\
	};								\
	t='$(if $(filter bootstrap,$*),bootstrap-depends,depends)';	\
	${TEST} ! -s ${_bulklog_broken} || {				\
	  ${RECURSIVE_MAKE} ${BULK_MAKE_ARGS} sys-$$t >/dev/null ||:;	\
	  exit 0;							\
	};								\
	${RECURSIVE_MAKE} ${BULK_MAKE_ARGS} $$t ||			\
	  ${BULK_BRK} "${MAKE}: *** [$$t] Error $$?"


# --- do-bulk --------------------------------------------------------------

# Perform the bulk target
#
do-bulk:
	${RUN}								\
	${TEST} ! -s ${_bulklog_cbbh} || {				\
	  ${MKDIR} $(dir ${BULK_PKGFILENA});				\
	  if ${TEST} -s ${_bulklog_cbbhby}; then			\
	    ${CP} ${_bulklog_cbbhby} ${BULK_PKGFILENA};			\
	  fi;								\
	  ${ECHO} '-- ' >>${BULK_PKGFILENA};				\
	  ${CAT} ${_bulklog_cbbh} >>${BULK_PKGFILENA};			\
	  exit 0;							\
	};								\
	${TEST} ! -s ${_bulklog_broken} || exit 0;			\
	${RECURSIVE_MAKE} ${BULK_MAKE_ARGS} package			\
	|| {								\
	  s=$$?;							\
	  ${STEP_MSG} "Marking ${PKGNAME} as broken";			\
	  ${BULK_BRK} "${MAKE}: *** [package] Error $$s";		\
	}


# --- bulk-remove-installed ------------------------------------------------
#
# Remove freshly built package
#
.PHONY: bulk-remove-installed
bulk-remove-installed:
	${RUN} ${RM} -rf ${WRKDIR}/distfiles;				\
	${RECURSIVE_MAKE} ${BULK_MAKE_ARGS}				\
		deinstall DEINSTALLDEPENDS=all ||			\
	  ${BULK_BRK} "${MAKE}: *** [deinstall] Error $$?";		\


# --- bulk-clean -----------------------------------------------------------
#
# Clean bulk files
#
.PHONY: bulk-clean
bulk-clean:
	${RUN} ${RECURSIVE_MAKE} ${BULK_MAKE_ARGS} cleaner
