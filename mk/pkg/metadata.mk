# $LAAS: metadata.mk 2009/04/02 14:30:40 mallet $
#
# Copyright (c) 2006-2009 LAAS/CNRS
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice,  this list of  conditions and the following disclaimer in
#      the  documentation  and/or  other   materials provided  with  the
#      distribution.
#
# THIS  SOFTWARE IS PROVIDED BY  THE  COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND  ANY  EXPRESS OR IMPLIED  WARRANTIES,  INCLUDING,  BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES  OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR  PURPOSE ARE DISCLAIMED. IN  NO EVENT SHALL THE COPYRIGHT
# HOLDERS OR      CONTRIBUTORS  BE LIABLE FOR   ANY    DIRECT, INDIRECT,
# INCIDENTAL,  SPECIAL,  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF  SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR
# TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE   OF THIS SOFTWARE, EVEN   IF ADVISED OF   THE POSSIBILITY OF SUCH
# DAMAGE.
#
# From $NetBSD: metadata.mk,v 1.10 2006/08/04 14:11:29 reed Exp $
#
#                                      Anthony Mallet on Wed Nov  8 2006
#

# --------------------------------------------------------------------
#
# Temporary package meta-data directory.  The contents of this directory
# are copied directly into the real package meta-data directory.
#
PKG_DB_TMPDIR=	${WRKDIR}/.pkgdb

${PKG_DB_TMPDIR}:
	${RUN}${MKDIR} $@


# --- +BUILD_INFO ----------------------------------------------------------
#
# Package build environment and settings information
#
$(call require, ${ROBOTPKG_DIR}/mk/plist/plist-vars.mk)

_BUILD_DATE_cmd=	${_CDATE_CMD} "+%Y-%m-%d %H:%M:%S %z"
_METADATA_TARGETS+=	${PKG_DB_TMPDIR}/${_BUILD_INFO_FILE}

${PKG_DB_TMPDIR}/${_BUILD_INFO_FILE}: plist
	${RUN}${MKDIR} $(dir $@); >$@.tmp;				\
  $(foreach _def_,${_BUILD_DEFS},					\
	${ECHO} ${_def_}=${${_def_}} >> $@.tmp; 			\
  )									\
	${ECHO} "PKGTOOLS_VERSION=${PKGTOOLS_VERSION}" >> $@.tmp;	\
  $(if ${HOMEPAGE},							\
	${ECHO} "HOMEPAGE=${HOMEPAGE}" >> $@.tmp;			\
  )									\
	${ECHO} "CATEGORIES=${CATEGORIES}" >> $@.tmp;			\
	${ECHO} "MAINTAINER=${MAINTAINER}" >> $@.tmp;			\
	${ECHO} "BUILD_DATE=`${_BUILD_DATE_cmd}`" >> $@.tmp;		\
	${SORT} $@.tmp > $@ && ${RM} -f $@.tmp


# --- +BUILD_VERSION -------------------------------------------------
#
# Package build files versioning information
#
# We extract the ident strings from all of the important pkgsrc files
# involved in building the package, i.e. Makefile and patches.
#
_METADATA_TARGETS+=	${PKG_DB_TMPDIR}/${_BUILD_VERSION_FILE}

${PKG_DB_TMPDIR}/${_BUILD_VERSION_FILE}:
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} $(dir $@)
	${_PKG_SILENT}${_PKG_DEBUG}${RM} -f $@.tmp
	${_PKG_SILENT}${_PKG_DEBUG}					\
	exec 1>>$@.tmp;							\
	for f in ${CURDIR}/Makefile ${FILESDIR}/* ${PKGDIR}/*; do	\
		${TEST} ! -f "$$f" || ${ECHO} "$$f";			\
	done
	${_PKG_SILENT}${_PKG_DEBUG}					\
	exec 1>>$@.tmp;							\
	${TEST} -f ${DISTINFO_FILE} || exit 0;				\
	${CAT} ${DISTINFO_FILE} |					\
	${AWK} 'NF == 4 && $$3 == "=" { gsub("[()]", "", $$2); print $$2 }' | \
	while read file; do						\
		${TEST} ! -f "${PATCHDIR}/$$file" ||			\
			${ECHO} "${PATCHDIR}/$$file";			\
	done
	${_PKG_SILENT}${_PKG_DEBUG}					\
	exec 1>>$@.tmp;							\
	${TEST} -d ${PATCHDIR} || exit 0;				\
	cd ${PATCHDIR}; for f in *; do					\
		case "$$f" in						\
		"*"|*.orig|*.rej|*~)	;;				\
		patch-*)		${ECHO} "${PATCHDIR}/$$f" ;;	\
		esac;							\
	done
	${_PKG_SILENT}${_PKG_DEBUG}					\
	${CAT} $@.tmp |							\
	while read file; do						\
		${LS} -l $$file 2>/dev/null;				\
	done |								\
	${AWK} '{ sub("^${ROBOTPKG_DIR}/", "");				\
		  print; }' |						\
	${SORT} -u > $@ && ${RM} -f $@.tmp


# --- +COMMENT -------------------------------------------------------
#
# Package comment file
#
# This file contains the one-line description of the package.
#
_METADATA_TARGETS+=	${PKG_DB_TMPDIR}/${_COMMENT_FILE}

${PKG_DB_TMPDIR}/${_COMMENT_FILE}:
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} $(dir $@)
	${_PKG_SILENT}${_PKG_DEBUG}${ECHO} $(call quote,${COMMENT}) > $@


# --- +DESC ----------------------------------------------------------
#
# Package description file
#
# This file contains the paragraph description of the package.
#
_METADATA_TARGETS+=	${PKG_DB_TMPDIR}/${_DESCR_FILE}

${PKG_DB_TMPDIR}/${_DESCR_FILE}: ${DESCR_SRC}
	${RUN}								\
	${MKDIR} $(dir $@);						\
	${RM} -f $@;							\
	${CAT} $^ > $@;							\
$(if $(strip ${HOMEPAGE}),						\
	${ECHO} >> $@;							\
	${ECHO} "Homepage:" >> $@;					\
	${ECHO} ""${HOMEPAGE} >> $@;					\
)

${DESCR_SRC}:;


# --- +DISPLAY -------------------------------------------------------
#
# Package message file
#
# This file contains important messages which apply to this package,
# and are shown during installation.
#
ifndef MESSAGE_SRC
  ifeq (yes,$(call exists,${PKGDIR}/MESSAGE))
    MESSAGE_SRC=	${PKGDIR}/MESSAGE
  endif
endif

ifdef MESSAGE_SRC
_METADATA_TARGETS+=	${PKG_DB_TMPDIR}/${_MESSAGE_FILE}

# Set MESSAGE_SUBST to substitute "${variable}" to "value" in MESSAGE
MESSAGE_SUBST+=	PKGNAME=${PKGNAME}					\
		PKGBASE=${PKGBASE}					\
		PREFIX=${PREFIX}					\
		LOCALBASE=${LOCALBASE}					\
		PKG_SYSCONFDIR=${PKG_SYSCONFDIR}

_MESSAGE_SUBST_SED= $(foreach _m_,$(MESSAGE_SUBST), -e s!\$${$(subst =,}!,${_m_})!g)

${PKG_DB_TMPDIR}/${_MESSAGE_FILE}: ${MESSAGE_SRC}
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} $(dir $@)
	${_PKG_SILENT}${_PKG_DEBUG}${CAT} $^ | \
		${SED} ${_MESSAGE_SUBST_SED} > $@

# Display MESSAGE file
#
.PHONY: install-display-message
pkg-register: install-display-message
install-display-message: ${PKG_DB_TMPDIR}/${_MESSAGE_FILE}
	@${STEP_MSG} "Please note the following:"
	@${ECHO_MSG} ""
	@${CAT} ${_MESSAGE_FILE}
	@${ECHO_MSG} ""
endif	# MESSAGE_SRC


# --- +PRESERVE ------------------------------------------------------
#
# Package preserve file
#
# The existence of this file prevents pkg_delete from removing this
# package unless one "force-deletes" the package.
#
ifdef PKG_PRESERVE
  _METADATA_TARGETS+=	${PKG_DB_TMPDIR}/${_PRESERVE_FILE}

  ${PKG_DB_TMPDIR}/${_PRESERVE_FILE}:
	${RUN}${MKDIR} $(dir $@); ${_CDATE_CMD} > $@
endif


# --- +SIZE_ALL ------------------------------------------------------
#
# Package size-of-dependencies file
#
# This is the total size of the dependencies that this package was
# built against.
#
_METADATA_TARGETS+=	${PKG_DB_TMPDIR}/${_SIZE_ALL_FILE}

ifndef NO_DEPENDS
  ${PKG_DB_TMPDIR}/${_SIZE_ALL_FILE}: ${_COOKIE.depends}
endif

${PKG_DB_TMPDIR}/${_SIZE_ALL_FILE}:
	${RUN}${MKDIR} $(dir $@);					\
	${_DEPENDS_PATTERNS_CMD} |					\
	  ${XARGS} -n 1 ${_PKG_BEST_EXISTS} | ${SORT} -u |		\
	  ${XARGS} -n 256 ${PKG_INFO} -qs |				\
	  ${AWK} 'BEGIN { s=0 } /^[0-9]+$$/ { s+=$$1 } END { print s }'	\
	> $@


# --- +SIZE_PKG ------------------------------------------------------
#
# Package size file
#
# This is the total size of the files contained in the package.
#
_METADATA_TARGETS+=	${PKG_DB_TMPDIR}/${_SIZE_PKG_FILE}

${PKG_DB_TMPDIR}/${_SIZE_PKG_FILE}: plist
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} $(dir $@)
	${_PKG_SILENT}${_PKG_DEBUG}					\
	${CAT} ${PLIST} |						\
	${AWK} 'BEGIN { base = "${PREFIX}/" }				\
		/^@cwd/ { base = $$2 "/" }				\
		/^@/ { next }						\
		{ print base $$0 }' |					\
	${SORT} -u |							\
	${SED} -e "s/'/'\\\\''/g" -e "s/.*/'&'/" |			\
	${XARGS} -n 256 ${LS} -ld 2>/dev/null |				\
	${AWK} 'BEGIN { s = 0 } { s += $$5 } END { print s }'		\
		> $@


# --- +CONTENTS ------------------------------------------------------
#
# Package manifest file
#
# This file contains the list of files and checksums, along with
# any special "@" commands, e.g. @dirrm.
#
_METADATA_TARGETS+=	${PKG_DB_TMPDIR}/${_CONTENTS_FILE}

_PKG_CREATE_ARGS+=	-v -l -U
_PKG_CREATE_ARGS+=	-B ${PKG_DB_TMPDIR}/${_BUILD_INFO_FILE}
_PKG_CREATE_ARGS+=	-b ${PKG_DB_TMPDIR}/${_BUILD_VERSION_FILE}
_PKG_CREATE_ARGS+=	-c ${PKG_DB_TMPDIR}/${_COMMENT_FILE}
ifdef MESSAGE_SRC
_PKG_CREATE_ARGS+=	-D ${PKG_DB_TMPDIR}/${_MESSAGE_FILE}
endif
_PKG_CREATE_ARGS+=	-d ${PKG_DB_TMPDIR}/${_DESCR_FILE}
_PKG_CREATE_ARGS+=	-f ${PLIST}
ifdef PKG_PRESERVE
_PKG_CREATE_ARGS+=	-n ${PKG_DB_TMPDIR}/${_PRESERVE_FILE}
endif
_PKG_CREATE_ARGS+=	-S ${PKG_DB_TMPDIR}/${_SIZE_ALL_FILE}
_PKG_CREATE_ARGS+=	-s ${PKG_DB_TMPDIR}/${_SIZE_PKG_FILE}
ifdef CONFLICTS
_PKG_CREATE_ARGS+=	-C ${CONFLICTS}
endif
ifdef INSTALL_FILE
_PKG_CREATE_ARGS+=	`${_INSTALL_ARG_cmd}`
endif
ifdef DEINSTALL_FILE
_PKG_CREATE_ARGS+=	`${_DEINSTALL_ARG_cmd}`
endif

_PKG_ARGS_INSTALL+=	${_PKG_CREATE_ARGS}
_PKG_ARGS_INSTALL+=	-p ${PREFIX}

_DEINSTALL_ARG_cmd=	if ${TEST} -f ${DEINSTALL_FILE}; then		\
				${ECHO} "-k "${DEINSTALL_FILE};		\
			fi
_INSTALL_ARG_cmd=	if ${TEST} -f ${INSTALL_FILE}; then		\
				${ECHO} "-i "${INSTALL_FILE};		\
			fi

ifndef NO_DEPENDS
  _CONTENTS_TARGETS+=	${_COOKIE.depends}
endif
_CONTENTS_TARGETS+=	${PKG_DB_TMPDIR}/${_BUILD_INFO_FILE}
_CONTENTS_TARGETS+=	${PKG_DB_TMPDIR}/${_BUILD_VERSION_FILE}
_CONTENTS_TARGETS+=	${PKG_DB_TMPDIR}/${_COMMENT_FILE}
_CONTENTS_TARGETS+=	${PKG_DB_TMPDIR}/${_DESCR_FILE}
ifdef MESSAGE_SRC
  _CONTENTS_TARGETS+=	${PKG_DB_TMPDIR}/${_MESSAGE_FILE}
endif
_CONTENTS_TARGETS+=	plist
ifdef PKG_PRESERVE
  _CONTENTS_TARGETS+=	${PKG_DB_TMPDIR}/${_PRESERVE_FILE}
endif
_CONTENTS_TARGETS+=	${PKG_DB_TMPDIR}/${_SIZE_ALL_FILE}
_CONTENTS_TARGETS+=	${PKG_DB_TMPDIR}/${_SIZE_PKG_FILE}

${PKG_DB_TMPDIR}/${_CONTENTS_FILE}: ${_CONTENTS_TARGETS}
	${RUN}${MKDIR} $(dir $@);					\
	depends=`${_DEPENDS_PATTERNS_CMD}`;				\
	${PKG_CREATE} ${_PKG_ARGS_INSTALL}				\
		$${depends:+-P "$${depends}"} 				\
		-O $(notdir ${PKGFILE}) > $@


# --- generate-metadata (PRIVATE) ------------------------------------
#
# generate-metadata is a convenience target for generating all of
# the pkgsrc binary package meta-data files.  It populates
# ${PKG_DB_TMPDIR} with the following files:
#
#	+BUILD_INFO
#	+BUILD_VERSION
#	+COMMENT
#	+CONTENTS
#	+DESC
#	+DISPLAY
#	+PRESERVE
#	+SIZE_ALL
#	+SIZE_PKG
#
# See the targets above for descriptions of each of those files.
#
.PHONY: generate-metadata
generate-metadata: ${_METADATA_TARGETS}


# --- clean-metadata (PRIVATE) ---------------------------------------
#
# clean-metadata is a convenience target for removing the meta-data
# directory.
#
.PHONY: clean-metadata
clean-metadata:
	${_PKG_SILENT}${_PKG_DEBUG}${RM} -fr ${PKG_DB_TMPDIR}
