# $LAAS: checksum.mk 2009/03/10 22:16:11 tho $
#
# Copyright (c) 2006-2009 LAAS/CNRS
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
#   3. All  advertising  materials  mentioning  features or  use of  this
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
# From $NetBSD: checksum.mk,v 1.2 2006/07/13 18:40:33 jlam Exp $
#
#                                       Anthony Mallet on Thu Dec  7 2006
#

$(call require, ${ROBOTPKG_DIR}/mk/fetch/fetch-vars.mk)
$(call require, ${ROBOTPKG_DIR}/mk/tools/tools-vars.mk)


_DIGEST_ALGORITHMS?=		SHA1 RMD160
_PATCH_DIGEST_ALGORITHMS?=	SHA1
_CONF_DIGEST_ALGORITHMS?=	SHA1

# These variables are set by robotpkg/mk/fetch/fetch.mk.
#_CKSUMFILES?=	# empty
#_IGNOREFILES?=	# empty

# --- checksum (PUBLIC) ----------------------------------------------
#
# checksum is a public target to checksum the fetched distfiles
# for the package.
#
_CHECKSUM_CMD=								\
	${SETENV} DIGEST=${TOOLS_DIGEST} CAT=${TOOLS_CAT}		\
		ECHO=${TOOLS_ECHO} TEST=${TOOLS_TEST}			\
	${SH} ${ROBOTPKG_DIR}/mk/checksum/checksum

.PHONY: checksum
checksum: fetch check-configuration-file
	${_PKG_SILENT}${_PKG_DEBUG}					\
$(foreach _alg_,${_DIGEST_ALGORITHMS},					\
	if cd ${DISTDIR} && ${_CHECKSUM_CMD} -a ${_alg_}		\
		${DISTINFO_FILE} ${_CKSUMFILES}; then			\
		${TRUE};						\
	else								\
		${ERROR_MSG} "Make sure the Makefile and checksum file (${DISTINFO_FILE})"; \
		${ERROR_MSG} "are up to date.  If you want to override this check, type"; \
		${ERROR_MSG} "\"${MAKE} NO_CHECKSUM=yes [other args]\"."; \
		exit 1;							\
	fi;								\
)


# --- makesum (PUBLIC) -----------------------------------------------
#
# makesum is a public target to add checksums of the distfiles for
# the package to ${DISTINFO_FILE}.
#
.PHONY: makesum
makesum: fetch
	${RUN}								\
	newfile=${DISTINFO_FILE}.$$$$;					\
	cd ${DISTDIR};							\
	for sumfile in "" ${_CKSUMFILES}; do				\
		${TEST} -n "$$sumfile" || continue;			\
		for a in "" ${_DIGEST_ALGORITHMS}; do			\
			${TEST} -n "$$a" || continue;			\
			${TOOLS_DIGEST} $$a $$sumfile >> $$newfile;	\
		done;							\
		${WC} -c $$sumfile |					\
		${AWK} '{ print "Size (" $$2 ") = " $$1 " bytes" }'	\
			>> $$newfile;					\
	done;								\
	for ignore in "" ${_IGNOREFILES}; do				\
		${TEST} -n "$$ignore" || continue;			\
		for a in "" ${_DIGEST_ALGORITHMS}; do			\
			${TEST} -n "$$a" || continue;			\
			${ECHO} "$$a ($$ignore) = IGNORE" >> $$newfile;	\
		done;							\
	done;								\
	if ${TEST} -f ${DISTINFO_FILE}; then				\
		${AWK} '$$2 ~ /\(patch-[a-z0-9]+\)/ { print $$0 }'	\
			< ${DISTINFO_FILE} >> $$newfile;		\
	fi;								\
	if ${CMP} -s $$newfile ${DISTINFO_FILE}; then			\
		${RM} -f $$newfile;					\
		${ECHO_MSG} "=> distinfo: distfiles part unchanged.";	\
	else								\
		${MV} -f $$newfile ${DISTINFO_FILE};			\
	fi


# --- makepatchsum (PUBLIC) ------------------------------------------
#
# makepatchsum is a public target to add checksums of the patches
# for the package to ${DISTINFO_FILE}.
#
.PHONY: makepatchsum
makepatchsum:
	${RUN}								\
	newfile=${DISTINFO_FILE}.$$$$;					\
	if ${TEST} -f ${DISTINFO_FILE}; then				\
		${AWK} '$$2 !~ /\(patch-[a-z0-9]+\)/ { print $$0 }'	\
			< ${DISTINFO_FILE} >> $$newfile;		\
	fi;								\
	if ${TEST} -d ${PATCHDIR}; then					\
		( cd ${PATCHDIR};					\
		  for sumfile in "" patch-*; do				\
			case "$$sumfile" in				\
			""|"patch-*") continue ;;			\
			patch-local-*|*.orig|*.rej|*~) continue ;;	\
			esac;						\
			for a in "" ${_PATCH_DIGEST_ALGORITHMS}; do	\
				${TEST} -n "$$a" || continue;		\
				${TOOLS_DIGEST} $$a $$sumfile >> $$newfile; \
			done;						\
		  done );						\
	fi;								\
	if ${CMP} -s $$newfile ${DISTINFO_FILE}; then			\
		${RM} -f $$newfile;					\
		${ECHO_MSG} "=> distinfo: patches part unchanged.";	\
	else								\
		${MV} $$newfile ${DISTINFO_FILE};			\
	fi


# --- check-configuration-file (PRIVATE) -----------------------------
#
# check-configuration-file create a checksum of the current
# robotpkg.conf, or checks it against a previously saved checksum. This
# guarantees that the configuration file did not change between two make
# invocations. 
#

_MAKECONF_CKSUM=	${WRKDIR}/.conf_cksum

.PHONY: check-configuration-file
check-configuration-file: ${WRKDIR}
ifdef MAKECONF
	${RUN}if test -f ${_MAKECONF_CKSUM}; then			\
$(foreach _alg_,${_CONF_DIGEST_ALGORITHMS},				\
	  if ${_CHECKSUM_CMD} -a ${_alg_}				\
	    ${_MAKECONF_CKSUM} ${MAKECONF}; then			\
	    ${TRUE};							\
	  else								\
	    ${ERROR_MSG} ${hline};					\
	    ${ERROR_MSG} "${bf}Inconsistent configuration file for"	\
			"${PKGNAME}.${rm}";				\
	    ${ERROR_MSG} "The robotpkg.conf file was modified since"	\
			"last make.";					\
	    ${ERROR_MSG} "";						\
	    ${ERROR_MSG} "${bf}Please do a \`${MAKE} clean' in"		\
			"${PKGPATH}.${rm}";				\
	    ${ERROR_MSG} "";						\
	    ${ERROR_MSG} "If you want to override this check, type:";	\
	    ${ERROR_MSG} "		${MAKE} NO_CHECKSUM=yes [other"	\
			"args]";					\
	    ${ERROR_MSG} ${hline};					\
	    exit 1;							\
	  fi;								\
)									\
	else								\
	  for a in "" ${_CONF_DIGEST_ALGORITHMS}; do			\
	    ${TEST} -n "$$a" || continue;				\
	    ${TOOLS_DIGEST} $$a ${MAKECONF} >> ${_MAKECONF_CKSUM};	\
	  done;								\
	fi
endif

