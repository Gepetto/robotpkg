#
# Copyright (c) 2009-2010 LAAS/CNRS
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
#                                       Anthony Mallet on Sun Oct 25 2009
#

$(call require, ${ROBOTPKG_DIR}/mk/fetch/fetch-vars.mk)

# These variables are set by robotpkg/mk/fetch/fetch.mk.
#_CKSUMFILES?=	# empty
#_IGNOREFILES?=	# empty

# Require digest tool
DEPEND_METHOD.digest+=	bootstrap
include ${ROBOTPKG_DIR}/pkgtools/digest/depend.mk


# --- distinfo (PUBLIC) ----------------------------------------------------
#
# distinfo is a public target to create ${DISTINFO_FILE}.
#
_DISTINFO_TARGETS+=	fetch
_DISTINFO_TARGETS+=	distinfo-message
_DISTINFO_TARGETS+=	makesum
_DISTINFO_TARGETS+=	makepatchsum

distinfo: $(call barrier, bootstrap-depends, ${_DISTINFO_TARGETS})
	@${DO_NADA}

.PHONY: distinfo-message
distinfo-message:
	@${PHASE_MSG} "Creating checksums for ${PKGNAME}"


# --- makesum (PRIVATE) ----------------------------------------------------
#
# makesum is a target to add checksums of the distfiles for the package to
# ${DISTINFO_FILE}.
#
.PHONY: makesum
makesum:
	${RUN}								\
	newfile=${DISTINFO_FILE}.$$$$;					\
	cd ${DISTDIR};							\
	for sumfile in "" ${_CKSUMFILES}; do				\
		${TEST} -n "$$sumfile" || continue;			\
		for a in "" ${_DIGEST_ALGORITHMS}; do			\
			${TEST} -n "$$a" || continue;			\
			${DIGEST} ${_DIGEST_ARGS} 			\
				$$a $$sumfile >> $$newfile;		\
		done;							\
		if ${TEST} -z "$(strip ${_DIGEST_ARGS})"; then		\
		  ${WC} -c $$sumfile |					\
		  ${AWK} '{ print "Size (" $$2 ") = " $$1 " bytes" }'	\
			>> $$newfile;					\
		fi;							\
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


# --- makepatchsum (PRIVATE) -----------------------------------------------
#
# makepatchsum is a target to add checksums of the patches for the package to
# ${DISTINFO_FILE}.
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
				${DIGEST} $$a $$sumfile >> $$newfile;	\
			done;						\
		  done );						\
	fi;								\
	if ${CMP} -s $$newfile ${DISTINFO_FILE}; then			\
		${RM} -f $$newfile;					\
		${ECHO_MSG} "=> distinfo: patches part unchanged.";	\
	else								\
		${MV} $$newfile ${DISTINFO_FILE};			\
	fi
