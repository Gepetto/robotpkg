# $LAAS: checkout.mk 2009/01/09 20:27:57 tho $
#
# Copyright (c) 2009 LAAS/CNRS
# All rights reserved.
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
#                                      Anthony Mallet on Fri Jan  9 2009
#

# The following variables may be set by the package Makefile and specify
# how checkout happens:
#
#    CHECKOUT_DIR
#	The directory into which the files are checkout.
#	Default value: ${WRKSRC}
#
#    CHECKOUT_CMD is a shell command list that checkout the contents of a
#	package named by the variable ${CHECKOUT_REPOSITORY} to the current
#	working directory.  The default is ${CHECKOUT_CMD_DEFAULT}.
#
#    CHECKOUT_OPTS is a list of options to pass to the "checkout" script when
#	using CHECKOUT_CMD_DEFAULT. See the comments at the head of the
#	"checkout" script for a definitive list of the available options. The
#	default list is empty.
#
#    CHECKOUT_ELEMENTS is a list of files within the repository to extract when
#	using EXTRACT_CMD_DEFAULT. By default, this is empty, which causes all
#	files within the repository to be extracted.
#
# The following are read-only variables that may be used within a package
# Makefile:
#
#    CHECKOUT_FORMAT is the of the repository that is currently
#	being extracted (e.g. git).
#
#    CHECKOUT_REPOSITORY represents the URL of the repository that is currently
#	being extracted, and may be used in custom CHECKOUT_CMD	overrides.
#
#    CHECKOUT_CMD_DEFAULT uses the "checkout" script to checkout
#	repositories. The precise manner in which extraction occurs may be
#	tweaked by setting CHECKOUT_OPTS and CHECKOUT_ELEMENTS.
#

CHECKOUT_DIR?=		${WRKDIR}
CHECKOUT_CMD?=		${CHECKOUT_CMD_DEFAULT}
CHECKOUT_OPTS?=#	empty

CHECKOUT_FORMAT=	$(word 1,${MASTER_REPOSITORY})
CHECKOUT_REPOSITORY=	$(word 2,${MASTER_REPOSITORY})
CHECKOUT_ELEMENTS?=	$(wordlist 3,$(words ${MASTER_REPOSITORY}),${MASTER_REPOSITORY})

ifdef CHECKOUT
  CHECKOUT_OPTS+=	-r ${CHECKOUT}
endif

# --- checkout (PUBLIC) ----------------------------------------------------
#
# checkout is a public target to perform checkout of a repository.
#
_CHECKOUT_TARGETS+=	tools
_CHECKOUT_TARGETS+=	acquire-checkout-lock
_CHECKOUT_TARGETS+=	${_COOKIE.checkout}
_CHECKOUT_TARGETS+=	release-checkout-lock

.PHONY: checkout
ifeq (yes,$(call exists,${_COOKIE.checkout}))
checkout ${_COOKIE.checkout}:
	@${DO_NADA}
else
  ifdef _PKGSRC_BARRIER
checkout: ${_CHECKOUT_TARGETS}
  else
checkout: barrier
  endif

${_COOKIE.checkout}: real-checkout
endif

.PHONY: acquire-checkout-lock release-checkout-lock
acquire-checkout-lock: acquire-lock
release-checkout-lock: release-lock


# --- real-checkout (PRIVATE) ----------------------------------------------
#
# real-checkout is a helper target onto which one can hook all of the
# targets that do the actual checkout work.
#
_REAL_CHECKOUT_TARGETS+=	checkout-check-extract
_REAL_CHECKOUT_TARGETS+=	checkout-message
_REAL_CHECKOUT_TARGETS+=	checkout-dir
_REAL_CHECKOUT_TARGETS+=	pre-checkout
_REAL_CHECKOUT_TARGETS+=	do-checkout
_REAL_CHECKOUT_TARGETS+=	post-checkout
_REAL_CHECKOUT_TARGETS+=	checkout-cookie

.PHONY: real-checkout
real-checkout: ${_REAL_CHECKOUT_TARGETS}

.PHONY: checkout-message
checkout-message:
	@${PHASE_MSG} "Checking out ${PKGNAME}"

.PHONY: checkout-dir
checkout-dir:
	${RUN}${MKDIR} ${CHECKOUT_DIR}


# --- checkout-check-extract (PRIVATE) -------------------------------------
#
# checkout-check-extract checks whether an extract is present.
#
checkout-check-extract:
ifeq (yes,$(call exists,${_COOKIE.extract}))
	${RUN}								\
	${ERROR_MSG} ${hline};						\
	${ERROR_MSG} "Regular package sources are present in the build directory of";\
	${ERROR_MSG} "${PKGNAME}. Perhaps a stale work directory?";	\
	${ERROR_MSG} "Try to ${MAKE} clean in ${PKGPATH}"; 		\
	${ERROR_MSG} ${hline};						\
	exit 2;
endif


# --- pre-checkout, do-checkout, post-checkout (PUBLIC, override) ----------
#
# {pre,do,post}-checkout are the heart of the package-customizable
# checkout targets, and may be overridden within a package Makefile.
#
.PHONY: pre-checkout post-checkout

_CHECKOUT_ENV+=	${CHECKOUT_ENV}

CHECKOUT_CMD_DEFAULT=							\
	${SETENV} ${_CHECKOUT_ENV}					\
	${SH} ${ROBOTPKG_DIR}/mk/extract/checkout			\
		${CHECKOUT_OPTS}					\
		-f ${CHECKOUT_FORMAT}					\
		-d ${WRKSRC}						\
		${CHECKOUT_REPOSITORY} ${CHECKOUT_ELEMENTS}

do%checkout: ${WRKDIR} .FORCE
	${_OVERRIDE_TARGET}
	${RUN}cd ${WRKDIR} && cd ${CHECKOUT_DIR} && ${CHECKOUT_CMD}

pre-checkout:

post-checkout:
