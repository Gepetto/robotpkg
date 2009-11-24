# $LAAS: checksum.mk 2009/11/24 16:34:31 mallet $
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

# These variables are set by robotpkg/mk/fetch/fetch.mk.
#_CKSUMFILES?=	# empty
#_IGNOREFILES?=	# empty

# Require digest tool
DEPEND_METHOD.digest+=	bootstrap
include ${ROBOTPKG_DIR}/pkgtools/digest/depend.mk

# The command for computing a file's checksum
_CHECKSUM_CMD=								\
	${SETENV} DIGEST=${DIGEST} CAT=${TOOLS_CAT} TEST=${TOOLS_TEST}	\
		ECHO=${TOOLS_ECHO} 					\
	${SH} ${ROBOTPKG_DIR}/mk/checksum/checksum


# --- checksum (PUBLIC) ----------------------------------------------
#
# checksum is a public target to checksum the fetched distfiles
# for the package.
#
$(call require, ${ROBOTPKG_DIR}/mk/extract/extract-vars.mk)
$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)

_CHECKSUM_TARGETS+=	check-configuration-file
ifndef _EXTRACT_IS_CHECKOUT
  _CHECKSUM_TARGETS+=	fetch
  _CHECKSUM_TARGETS+=	checksum-files
endif

.PHONY: checksum
checksum: $(call barrier, bootstrap-depends, ${_CHECKSUM_TARGETS})


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
	    ${ERROR_MSG} "$${bf}Inconsistent configuration file for"	\
			"${PKGNAME}.$${rm}";				\
	    ${ERROR_MSG} "The robotpkg.conf file was modified since"	\
			"last make.";					\
	    ${ERROR_MSG} "";						\
	    ${ERROR_MSG} "$${bf}Please do a \`${MAKE} clean' in"	\
			"${PKGPATH}.$${rm}";				\
	    ${ERROR_MSG} "";						\
	    ${ERROR_MSG} "If you want to override this check, type:";	\
	    ${ERROR_MSG} "		${MAKE} NO_CHECKSUM=yes [other"	\
			"args]";					\
	    ${ERROR_MSG} ${hline};					\
	    exit 1;							\
	  fi;								\
)									\
	elif ${TEST} -r ${MAKECONF}; then				\
	  for a in "" ${_CONF_DIGEST_ALGORITHMS}; do			\
	    ${TEST} -n "$$a" || continue;				\
	    ${DIGEST} $$a ${MAKECONF} >> ${_MAKECONF_CKSUM};		\
	  done;								\
	else								\
	    >${_MAKECONF_CKSUM};					\
	fi
endif


# --- checksum-files (PRIVATE) ---------------------------------------------
#
# checksum-files checks the checksum of distribution files.
#
.PHONY: checksum-files
checksum-files:
	${RUN}								\
  $(foreach _alg_,${_DIGEST_ALGORITHMS},				\
	if cd ${DISTDIR} && ${_CHECKSUM_CMD} -a ${_alg_}		\
		${DISTINFO_FILE} ${_CKSUMFILES}; then			\
		${ECHO_MSG} "=> ${_alg_} checksums OK";			\
	else								\
		${ERROR_MSG} ${hline};					\
		${ERROR_MSG} "$${bf}Make sure the Makefile and checksum"\
			"file are up to date:$${rm}";			\
		${ERROR_MSG} " ${DISTINFO_FILE}";			\
		${ERROR_MSG} "If you want to override this check, type";\
		${ERROR_MSG} "	${MAKE} NO_CHECKSUM=yes [other args]"; 	\
		${ERROR_MSG} ${hline};					\
		exit 1;							\
	fi;								\
  )
