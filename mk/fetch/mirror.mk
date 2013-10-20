#
# Copyright (c) 2013 LAAS/CNRS
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
#                                            Anthony Mallet on Thu Feb  7 2013
#
$(call require, ${ROBOTPKG_DIR}/mk/fetch/fetch-vars.mk)

_MIRROR_LOG=	${WRKDIR}/mirror.log


# --- mirror-distfiles (PUBLIC) --------------------------------------------

# mirror-distfiles is a public target that is mostly of use only to sites that
# wish to provide distfiles that others may fetch.  It only fetches distfiles
# that are freely re-distributable.
#
$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)
$(call require, ${ROBOTPKG_DIR}/mk/fetch/fetch.mk)

ifneq (,$(strip ${ALLFILES}))
  ifeq (,$(filter-out ${ACCEPTABLE_LICENSES},${LICENSE}))
    ifndef NO_PUBLIC_SRC
      _MIRROR_TARGETS+=check-distfiles
    endif
    ifeq (,$(filter fetch,${INTERACTIVE_STAGE}))
      ifneq (,$(filter archive,${FETCH_METHOD}))
        _MIRROR_TARGETS+=check-master-sites

        DEPEND_METHOD.curl+=	bootstrap
        include ${ROBOTPKG_DIR}/mk/sysdep/curl.mk
      endif
    endif
  endif

  _MD_TARGETS+=	makedirs
  _MD_TARGETS+=	mirror-message
  _MD_TARGETS+=	mirror-tag
  ifdef _MIRROR_TARGETS
    _MD_TARGETS+=	$(call add-barrier, bootstrap-depends, mirror-distfiles)
    _MD_TARGETS+=	${_MIRROR_TARGETS}
  else
    _MD_TARGETS+=	mirror-na
  endif
  _MD_TARGETS+=	mirror-log
endif

.PHONY: mirror-distfiles
mirror-distfiles: ${_MD_TARGETS}
	${RUN} status=0;						\
	if ${TEST} -f ${_mirrorlog_broken}; then			\
	  status=2;							\
	fi;								\
	${MAKE} cleaner;						\
	if ${TEST} "$$status" -ne 0; then				\
	  status=2;							\
	  ${PHASE_MSG} "Failed to mirror distfiles for ${PKGNAME}";	\
	  ${ERROR_MSG} "For details, check the log files in:";		\
	  ${ERROR_MSG} "${MIRROR_LOGDIR}/${PKGNAME}" >&2;		\
	else								\
	  ${PHASE_MSG} "Done mirror-distfiles for ${PKGNAME}";		\
	fi

.PHONY: mirror-tag
mirror-tag:
  ifeq (0,${MAKELEVEL})
	@${STEP_MSG} 'Using $(if ${tag},,default )tag "${MIRROR_TAG}"'
    ifndef tag
	@if ${TEST} -t 1; then ${ECHO_MSG}				\
	  "Use '${MAKE} ${MAKECMDGOALS} tag=<tag>' to override.";	\
	fi
    endif
  endif

.PHONY: mirror-message
mirror-message:
	@${PHASE_MSG} "Mirroring distfiles for ${PKGNAME}"


.PHONY: mirror-na
mirror-na:
	${RUN}${MAKE} cbbh >${_mirrorlog_cbbh} 2>&1 ||:


# --- check-distfiles (PRIVATE) --------------------------------------------
#
.PHONY: check-distfiles
check-distfiles: fetch-all
	${RUN}								\
	if ! ${MAKE} SILENT=yes checksum; then				\
	  ${RM} $(addprefix ${DISTDIR}/,${_ALLFILES});			\
	  ${MAKE} fetch-all checksum;					\
	fi


# --- check-master-sites (PRIVATE) -----------------------------------------
#
# check-master-sites performs a HEAD request against all sites in MASTER_SITES
# to verify that the files are present with the correct size.
#
# Some sites don't handle HEAD requests. Most notably googlecode:
# http://code.google.com/p/support/issues/detail?id=660
# and github has too many sporadic failures to reliably check anything...
# _MASTER_SITES_NOCHECK is a list of shell pattern identifying such sites.
#
_MASTER_SITES_NOCHECK=\
	http*://*.googlecode.com/*	\
	http*://github.com/*

_MIRROR_CURL_OPT=	-ILfksS
_MIRROR_CURL_OPT+=	--trace-ascii "${WRKDIR}/$$trace.log"

.PHONY: check-master-sites
check-master-sites:
	${RUN} {							\
  $(foreach distfile,${ALLFILES},					\
	  ${ECHO} '${distfile}'						\
	    $(foreach _,${SITES.$(notdir ${distfile})},'$_');)		\
	} | {								\
	  fatal=0; warn=0;						\
	  ${RM} ${_MIRROR_LOG};						\
	  while read distfile sites; do					\
	    ${STEP_MSG} "Checking $$distfile sites";			\
	    distsize=;							\
	    while read d_type d_file d_equals d_size d_units <&9; do	\
	      case "$$d_type" in Size) ;; *) continue ;; esac;		\
	      case "$$d_file" in					\
	        "($(addsuffix /,${DIST_SUBDIR})$$distfile)") ;;		\
	        *) continue ;;						\
	      esac;							\
	      distsize="$$d_size"; break;				\
	    done 9<${DISTINFO_FILE};					\
	    if ${TEST} -z "$$distsize"; then				\
	      ${MIRROR_BRK} "unknown size for $$distfile";		\
	      fatal=1; continue;					\
	    fi;								\
									\
	    one=0;							\
	    for site in $$sites; do					\
	      case "$$site" in						\
	        $(subst ${ } ${ },|,${_MASTER_SITES_NOCHECK}))		\
	          ${MIRROR_LOG} "CANNOT CHECK:  $$site";		\
	          one=1;						\
	          continue ;;						\
	      esac;							\
	      trace="fetch($${site#*//}";				\
	      trace="$${trace%%/*})::$$distfile";			\
	      x=0 hdr=`${CURL} ${_MIRROR_CURL_OPT} "$$site$$distfile"	\
	             2>>${_MIRROR_LOG}` || x=$$?;			\
	      case $$x in						\
	        0) ;;							\
	        23|27|28|52|55|56)					\
	          ${MIRROR_LOG} "SKIP:  $$site";			\
	          warn=1; continue ;;					\
	        *)							\
	          ${MIRROR_LOG} "$$site: fatal error";			\
	          warn=1; continue ;;					\
	      esac;							\
	      size=`${ECHO} "$$hdr" | ${AWK} -F'[ :\r]+'		\
	        '/^HTTP\/1[.][0-9]/ {l=""}				\
	         /[Cc]ontent-[Ll]ength: +[0-9]+/ {l=$$2}		\
		 END {print l}'`;					\
	      if ${TEST} -z "$$size"; then				\
	        ${MIRROR_LOG}						\
	          "SKIP:  $$site: cannot determine file size";		\
		one=1;							\
	      elif ${TEST} "$$distsize" -ne "$$size"; then		\
	        ${MIRROR_LOG} "$$site: bad file size $$size";		\
	        ${MIRROR_LOG} "$$site: file size should be $$distsize";	\
	        ${MIRROR_BRK} "bad size for $$distfile";		\
	        fatal=1;						\
	      else							\
	        ${ECHO} "OK:    $$site";				\
	        ${ECHO} 1>>${_MIRROR_LOG} "OK:    $$site";		\
	        ${RM} -f "${WRKDIR}/$$trace.log";			\
	        one=1;							\
	      fi;							\
	    done;							\
	    ${TEST} $$one -eq 0 || continue;				\
	    ${MIRROR_BRK} "cannot fetch $$distfile";			\
	  done;								\
	  ${TEST} -s ${_mirrorlog_broken} && exit 0;			\
	  ${TEST} $$fatal -eq 0 || exit 0;				\
	  ${TEST} $$warn -eq 0 || exit 0;				\
	  ${RM} ${_MIRROR_LOG};						\
	}


# --- mirror-log -----------------------------------------------------------
#
# Save log files. This tries to be compatible with bulk-log, so that
# rbulk-report(1) works, but this duplicates a few lines of code. Oh, well...
#
_mirrorlog_meta=	${MIRROR_LOGDIR}/${PKGNAME}/meta.txt
_mirrorlog_broken=	${WRKDIR}/broken.log
_mirrorlog_cbbh=	${WRKDIR}/cbbh.log

MIRROR_META?=		${ECHO} >>${_mirrorlog_meta}
MIRROR_BRK?=\
  ${SH} -c '${ERROR_MSG} "$$@"; ${ECHO} "$$@" >>$$0' ${_mirrorlog_broken}
MIRROR_LOG?=\
  ${SH} -c '${ECHO} "$$@"; ${ECHO} "$$@" >>$$0' ${_MIRROR_LOG}

_mirror_date_start:=	$(shell ${DATE} '+%s')
_mirror_date_stop=	$(shell ${DATE} '+%s')

.PHONY: mirror-log
mirror-log:
	${RUN} ${STEP_MSG} "Creating mirror log files";			\
	${RM} -rf ${MIRROR_LOGDIR}/${PKGNAME};				\
	${MKDIR} ${MIRROR_LOGDIR}/${PKGNAME};				\
	for f in ${WRKDIR}/*.log; do					\
	  ${TEST} ! -s $$f || ${CP} -p $$f ${MIRROR_LOGDIR}/${PKGNAME}/;\
	done;								\
	$(foreach _,PKGNAME PKGBASE PKGPATH CATEGORIES,			\
	  ${MIRROR_META} '$_	${$_}';					\
	)								\
	${MIRROR_META} 'BULK_TAG	${MIRROR_TAG}';			\
	${MIRROR_META} 'DATE_START	${_mirror_date_start}';		\
	${MIRROR_META} 'DATE_STOP	${_mirror_date_stop}';		\
	${MAKE} print-pkgnames						\
		'_override_vars.${PKGPATH}='				\
		'PKG_DEFAULT_OPTIONS=' 'PKGREQD='			\
		$(if ${PKG_OPTIONS_VAR},'${PKG_OPTIONS_VAR}=')		\
	| while IFS='|' read t p; do					\
	  ${MIRROR_META} "AVAIL	$$p";					\
	done
