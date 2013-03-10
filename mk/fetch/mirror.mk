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
endif

.PHONY: mirror-distfiles
ifdef _MIRROR_TARGETS
  $(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)
  $(call require, ${ROBOTPKG_DIR}/mk/fetch/fetch.mk)

  mirror-distfiles: $(call add-barrier, bootstrap-depends, mirror-distfiles)
  mirror-distfiles: mirror-message ${_MIRROR_TARGETS}
endif
mirror-distfiles:
	@:

.PHONY: mirror-message
mirror-message:
	@${PHASE_MSG} "Mirroring distfiles for ${PKGNAME}"


# --- check-distfiles (PRIVATE) --------------------------------------------
#
.PHONY: check-distfiles
check-distfiles: fetch-all
	${RUN}								\
	if ! ${RECURSIVE_MAKE} SILENT=yes checksum; then		\
	  ${RM} $(addprefix ${DISTDIR}/,${_ALLFILES});			\
	  ${RECURSIVE_MAKE} fetch-all checksum;				\
	fi


# --- check-master-sites (PRIVATE) -----------------------------------------
#
# check-master-sites performs a HEAD request against all sites in MASTER_SITES
# to verify that the files are present with the correct size.
#
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
	      ${ERROR_MSG} "Cannot determine expected $$distfile size";	\
	      ${ERROR_MSG} 2>>${_MIRROR_LOG} 1>&2			\
		"Cannot determine expected $$distfile size";		\
	      fatal=1; continue;					\
	    fi;								\
									\
	    ok=0;							\
	    for site in $$sites; do					\
	      x=0 hdr=`${CURL} -ILksS -m 60 "$$site$$distfile"		\
	             2>>${_MIRROR_LOG}` || x=$$?;			\
	      case $$x in						\
	        0) ;;							\
	        23|27|28|52|55|56)					\
	          ${ECHO} "SKIP:  $$site";				\
	          ${ECHO} 1>>${_MIRROR_LOG} "SKIP:  $$site";		\
	          continue ;;						\
	        *)							\
	          ${ERROR_MSG} "$$site: fatal error";			\
	          ${ERROR_MSG} 2>>${_MIRROR_LOG} 1>&2			\
	            "$$site: fatal error";				\
	          fatal=1; continue ;;					\
	      esac;							\
	      size=`${ECHO} "$$hdr" | ${AWK} -F'[ :\r]+'		\
	        '/[Cc]ontent-[Ll]ength: +[0-9]+/ {print $$2}'`;		\
	      if ${TEST} -z "$$size"; then				\
	        ${ECHO} "SKIP:  $$site: cannot determine file size";	\
	        ${ECHO} 2>>${_MIRROR_LOG} 1>&2				\
		  "SKIP:  $$site: cannot determine file size";		\
	      elif ${TEST} "$$distsize" -ne "$$size"; then		\
	        ${ERROR_MSG} "$$site: bad file size $$size";		\
	        ${ERROR_MSG} "$$site: file size should be $$distsize";	\
	        ${ERROR_MSG} 2>>${_MIRROR_LOG} 1>&2			\
	          "$$site: bad file size $$size";			\
	        ${ERROR_MSG} 2>>${_MIRROR_LOG} 1>&2			\
	          "$$site: file size should be $$distsize";		\
	        fatal=1;						\
	      else							\
	        ${ECHO} "OK:    $$site";				\
	        ${ECHO} 1>>${_MIRROR_LOG} "OK:    $$site";		\
	        ok=1;							\
	      fi;							\
	    done;							\
	    ${TEST} $$ok -eq 1 || warn=1;				\
	  done;								\
	  ${TEST} $$fatal -eq 0 || exit 2;				\
	  ${TEST} $$warn -eq 0 || exit 0;				\
	  ${RM} ${_MIRROR_LOG};						\
	}
