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
#                                            Anthony Mallet on Fri Sep  2 2011
#


# --- bulk-log (PRIVATE) ---------------------------------------------------

_BULK_LOG_TARGETS+=	bulk-log-message
_BULK_LOG_TARGETS+=	bulk-leftover
_BULK_LOG_TARGETS+=	bulk-archive-log
_BULK_LOG_TARGETS+=	bulk-metadata


.PHONY: bulk-log
bulk-log: ${_BULK_LOG_TARGETS};

.PHONY: bulk-log-message
bulk-log-message:
	@${PHASE_MSG} "Logging bulk summary for ${PKGNAME}"


# --- bulk-log-clean -------------------------------------------------------
#
# Clean bulk log files
#
.PHONY: bulk-log-clean
bulk-log-clean:
	${RUN}${RM} -f							\
	  ${_bulklog_cbbh} ${_bulklog_broken} ${_bulklog_brokenby}	\
	  ${_bulklog_leftover} ${_bulklog_bulk};			\
	${RM} -rf ${BULK_LOGDIR}/${PKGNAME}


# --- bulk-leftover --------------------------------------------------------
#
# Check for any leftover files and packages.
#
.PHONY: bulk-leftover
bulk-leftover:
	${RUN} ${STEP_MSG} "Checking leftover files";			\
	for p in ${BULK_DBDIR}/*; do					\
	  ${TEST} -d $$p || continue;					\
	  ${TEST} ! -f $$p/${_PRESERVE_FILE} || continue;		\
	  ${BULK_LEFT} "package $${p##*/}";				\
	  ${BULK_PKG_DELETE} -ff "$${p##*/}" 2>>${_bulklog_leftover}||:;\
	done;								\
	${FIND} ${BULKBASE} -depth					\
		! \( ${BULK_FIND_FILES_IGNORE} \) -print		\
	| while read f; do						\
	  if ${TEST} -d "$$f"; then					\
	    ${RMDIR} "$$f" 2>>/dev/null ||:;				\
	    continue;							\
	  fi;								\
	  if ${BULK_PKG_INFO} -qFe "$$f" 2>/dev/null; then continue; fi;\
	  ${BULK_LEFT} $${f##${BULKBASE:/=}/};				\
	  ${RM} -f "$$f" 2>>${_bulklog_leftover} ||:;			\
	done;								\
	if ${TEST} -f ${_bulklog_leftover}; then			\
	    ${WARNING_MSG} `${SED} -n '$$=' <${_bulklog_leftover}`	\
		"files leftover.";					\
	fi


# --- bulk-log -------------------------------------------------------------
#
# Save log files
#
.PHONY: bulk-archive-log
bulk-archive-log:
	${RUN} ${STEP_MSG} "Creating bulk log files";			\
	${MKDIR} ${BULK_LOGDIR}/${PKGNAME};				\
	for f in ${WRKDIR}/*.log; do					\
	  ${TEST} ! -s $$f || ${CP} -p $$f ${BULK_LOGDIR}/${PKGNAME}/;	\
	done
  ifdef GNU_CONFIGURE
	${RUN} ${TEST} -s ${_bulklog_broken} || exit 0;			\
	for dir in ${CONFIGURE_DIRS}; do				\
	  if cd ${WRKSRC} && cd "$$dir" 1>/dev/null 2>&1; then		\
	    ${TEST} ! -s config.log ||					\
	      ${CP} -p config.log ${BULK_LOGDIR}/${PKGNAME}/;		\
	  fi;								\
	done
  endif


# --- bulk-metadata --------------------------------------------------------
#
# Save log files
#
.PHONY: bulk-metadata
bulk-metadata:
	${RUN} ${STEP_MSG} "Logging bulk metadata";			\
	$(foreach _,PKGNAME PKGBASE PKGPATH CATEGORIES BULK_TAG,	\
	  ${BULK_META} '$_	${$_}';					\
	)								\
	${BULK_META} 'DATE_START	${_bulk_date_start}';		\
	${BULK_META} 'DATE_STOP		${_bulk_date_stop}';		\
	${RECURSIVE_MAKE} ${BULK_MAKE_ARGS} print-pkgnames		\
		'_override_vars.${PKGPATH}='				\
		'PKG_DEFAULT_OPTIONS=' 'PKGREQD='			\
		$(if ${PKG_OPTIONS_VAR},'${PKG_OPTIONS_VAR}=')		\
	| while IFS='|' read t p; do					\
	  ${BULK_META} "AVAIL	$$p";					\
	done
