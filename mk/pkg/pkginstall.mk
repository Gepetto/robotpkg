#
# Copyright (c) 2012 LAAS/CNRS
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
# From $NetBSD: bsd.pkginstall.mk,v 1.57 2012/07/09 21:56:38 wiz Exp $
#
#                                            Anthony Mallet on Sun Nov  4 2012
#

# This Makefile fragment is implements the common INSTALL/DEINSTALL scripts
# framework.  To use the pkginstall framework, simply set the relevant
# variables to customize the install scripts to the package.

INSTALL_FILE?=		${PKGDIR}/INSTALL
DEINSTALL_FILE?=	${PKGDIR}/DEINSTALL

#
PKG_REFCOUNT_DBDIR?=	${PKG_DBDIR}.refcount

INSTALL_SCRIPTS_ENV=	PKG_PREFIX=${PREFIX}
INSTALL_SCRIPTS_ENV+=	PKG_METADATA_DIR=${_PKG_DBDIR}/${PKGNAME}
INSTALL_SCRIPTS_ENV+=	PKG_REFCOUNT_DBDIR=${PKG_REFCOUNT_DBDIR}
INSTALL_SCRIPTS_ENV+=	PKG_VERBOSE=1


# Substitute for various programs used in the DEINSTALL/INSTALL scripts and
# in the rc.d scripts.
#
INSTALL_VARS+=		SH

INSTALL_SED_SUBST+=\
  $(foreach _,${INSTALL_VARS},-e 's%@$_@%${$_}%g')


# These are the template scripts for the INSTALL/DEINSTALL scripts.
# Packages may do additional work in the INSTALL/DEINSTALL scripts by
# appending the variables DEINSTALL_SRC and INSTALL_SRC to
# point to additional script fragments.  These bits are included after
# the main install/deinstall script fragments.
#
ifeq (yes,$(call exists,${INSTALL_FILE}))
  INSTALL_SRC+=		${INSTALL_FILE}
endif
ifeq (yes,$(call exists,${DEINSTALL_FILE}))
  DEINSTALL_SRC+=	${DEINSTALL_FILE}
endif

.PHONY: generate-install-script
generate-install-script: ${INSTALL_SRC} ${DEINSTALL_SRC}
	${RUN}if ${TEST} "${INSTALL_SRC}" = ""; then			\
	  ${RM} ${PKG_DB_TMPDIR}/${_INSTALL_FILE};			\
	else								\
	  ${MKDIR} ${PKG_DB_TMPDIR};					\
	  ${ECHO} '#!${SH}' >${PKG_DB_TMPDIR}/${_INSTALL_FILE};		\
	  ${ECHO} 'set -e' >>${PKG_DB_TMPDIR}/${_INSTALL_FILE};		\
	  ${CAT} ${INSTALL_SRC} | ${SED} ${INSTALL_SED_SUBST}		\
	    >>${PKG_DB_TMPDIR}/${_INSTALL_FILE};			\
	  ${ECHO} 'exit 0' >>${PKG_DB_TMPDIR}/${_INSTALL_FILE};		\
	  ${CHMOD} +x ${PKG_DB_TMPDIR}/${_INSTALL_FILE};		\
	fi;
	${RUN}if ${TEST} "${DEINSTALL_SRC}" = ""; then			\
	  ${RM} ${PKG_DB_TMPDIR}/${_DEINSTALL_FILE};			\
	else								\
	  ${MKDIR} ${PKG_DB_TMPDIR};					\
	  ${ECHO} '#!${SH}' >${PKG_DB_TMPDIR}/${_DEINSTALL_FILE};	\
	  ${ECHO} 'set -e' >>${PKG_DB_TMPDIR}/${_DEINSTALL_FILE};	\
	  ${CAT} ${DEINSTALL_SRC} | ${SED} ${INSTALL_SED_SUBST}		\
	    >>${PKG_DB_TMPDIR}/${_DEINSTALL_FILE};			\
	  ${ECHO} 'exit 0' >>${PKG_DB_TMPDIR}/${_DEINSTALL_FILE};	\
	  ${CHMOD} +x ${PKG_DB_TMPDIR}/${_DEINSTALL_FILE};		\
	fi


.PHONY: pre-install-script
pre-install-script:
	${RUN}								\
	if ${TEST} -x ${PKG_DB_TMPDIR}/${_INSTALL_FILE}; then		\
	  ${STEP_MSG} "Running PRE-INSTALL script actions";		\
	  cd ${PKG_DB_TMPDIR} && ${INSTALL_LOGFILTER}			\
	    ${SETENV} ${INSTALL_SCRIPTS_ENV}				\
	    ${PKG_DB_TMPDIR}/${_INSTALL_FILE} ${PKGNAME} PRE-INSTALL;	\
	fi

.PHONY: post-install-script
post-install-script:
	${RUN}								\
	if ${TEST} -x ${PKG_DB_TMPDIR}/${_INSTALL_FILE}; then		\
	  ${STEP_MSG} "Running POST-INSTALL script actions";		\
	  cd ${PKG_DB_TMPDIR} && ${INSTALL_LOGFILTER}			\
	    ${SETENV} ${INSTALL_SCRIPTS_ENV}				\
	    ${PKG_DB_TMPDIR}/${_INSTALL_FILE} ${PKGNAME} POST-INSTALL;	\
	fi
