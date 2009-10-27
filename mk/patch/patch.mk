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
#   3. All  advertising  materials mentioning  features or  use  of  this
#      software must  display the following acknowledgement: This product
#      includes software developed by the NetBSD Foundation, Inc. and its
#      contributors.
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
# From $NetBSD: patch.mk,v 1.11 2006/07/22 16:31:35 jlam Exp $
#
#                                       Anthony Mallet on Sat Dec  2 2006
#

# The following variables may be set in a package Makefile and control
# how robotpkg patches are applied.
#
#    PATCH_STRIP is a patch(1) argument that sets the pathname strip
#	count to help find the correct files to patch.  See the patch(1)
#	man page for more details.  Defaults to "-p0".
#
#    PATCH_ARGS is the base set of arguments passed to patch(1).
#	The default set of arguments will apply the patches to the
#	files in ${WRKSRC} with any ${PATCH_STRIP} arguments set.
#
# The following variables may be set in a package Makefile and control
# how "distribution" patches are applied.
#
#    PATCH_DIST_STRIP is a patch(1) argument that sets the pathname
#	strip count to help find the correct files to patch.  See the
#	patch(1) man page for more details.  Defaults to "-p0".
#
#    PATCH_DIST_ARGS is the base set of arguments passed to patch(1).
#	The default set of arguments will apply the patches to the
#	files in ${WRKSRC} with any ${PATCH_DIST_STRIP} arguments set.
#
#    PATCH_DIST_CAT is the command that outputs the contents of the
#	"$patchfile" to stdout.  The default value is a command that
#	can output gzipped, bzipped, or plain patches to stdout.
#
#    PATCH_DIST_STRIP.<patchfile>
#    PATCH_DIST_ARGS.<patchfile>
#    PATCH_DIST_CAT.<patchfile>
#	These are versions of the previous three variables which allow
#	for customization of their values for specific patchfiles.
#
# The following variables may be set by the user and affect how patching
# occurs:
#
#    PATCH_DEBUG, if defined, causes the the patch process to be more
#	verbose.
#
#    PATCH_FUZZ_FACTOR is a patch(1) argument that specifies how much
#	fuzz to accept when applying pkgsrc patches.  See the patch(1)
#	man page for more details.  Defaults to "-F0" for zero fuzz.
#

# Require patch and digest tools
DEPEND_METHOD.patch+=	bootstrap
DEPEND_METHOD.digest+=	bootstrap
include ${ROBOTPKG_DIR}/mk/sysdep/patch.mk
include ${ROBOTPKG_DIR}/pkgtools/digest/depend.mk


# --- patch (PUBLIC) -------------------------------------------------
#
# patch is a public target to apply the distribution and pkgsrc
# patches to the extracted sources for the package.
#
$(call require, ${ROBOTPKG_DIR}/mk/extract/extract-vars.mk)
ifdef _EXTRACT_IS_CHECKOUT
  _PATCH_TARGETS+=	checkout
else
  _PATCH_TARGETS+=	extract
endif
_PATCH_TARGETS+=	acquire-patch-lock
_PATCH_TARGETS+=	${_COOKIE.patch}
_PATCH_TARGETS+=	release-patch-lock

.PHONY: patch
ifeq (yes,$(call exists,${_COOKIE.patch}))
  patch:
	@${DO_NADA}
else
  $(call require, ${ROBOTPKG_DIR}/mk/internal/barrier.mk)

  patch: $(call barrier, bootstrap-depends, ${_PATCH_TARGETS})
endif

.PHONY: acquire-patch-lock release-patch-lock
acquire-patch-lock: acquire-lock
release-patch-lock: release-lock

${_COOKIE.patch}: real-patch


# --- real-patch (PRIVATE) -------------------------------------------
#
# real-patch is a helper target onto which one can hook all of the
# targets that do the actual patching work.
#
_REAL_PATCH_TARGETS+=	patch-message
#_REAL_PATCH_TARGETS+=	patch-vars
_REAL_PATCH_TARGETS+=	pre-patch
_REAL_PATCH_TARGETS+=	do-patch
_REAL_PATCH_TARGETS+=	post-patch
_REAL_PATCH_TARGETS+=	patch-cookie

.PHONY: real-patch
real-patch: ${_REAL_PATCH_TARGETS}

.PHONY: patch-message
patch-message:
	@${PHASE_MSG} "Patching for ${PKGNAME}"


# --- pre-patch, do-patch, post-patch (PUBLIC, override) -------------
#
# {pre,do,post}-patch are the heart of the package-customizable
# patch targets, and may be overridden within a package Makefile.
#
ifdef PATCHFILES
_PKGSRC_PATCH_TARGETS+=	distribution-patch-message
_PKGSRC_PATCH_TARGETS+=	do-distribution-patch
endif
ifeq (yes,$(call exists,${PATCHDIR}))
_PKGSRC_PATCH_TARGETS+=	pkgsrc-patch-message
_PKGSRC_PATCH_TARGETS+= do-pkgsrc-patch
endif

do%patch: ${_PKGSRC_PATCH_TARGETS} .FORCE
	${_OVERRIDE_TARGET}
	@${DO_NADA}

.PHONY: pre-patch post-patch

pre-patch:

post-patch:


# --------------------------------------------------------------------

ifdef PKG_VERBOSE
PATCH_DEBUG=		yes
endif

ifdef PATCH_DEBUG
_PATCH_DEBUG=		yes
ECHO_PATCH_MSG?=	${STEP_MSG}
else
_PATCH_DEBUG=		no
ECHO_PATCH_MSG?=	${SHCOMMENT}
endif

PATCH_STRIP?=		-p0
ifneq (,$(call isyes,$(_PATCH_DEBUG)))
PATCH_ARGS?=		-d ${WRKSRC} -E ${PATCH_STRIP}
else
PATCH_ARGS?=		-d ${WRKSRC} --forward --quiet -E ${PATCH_STRIP}
endif
ifdef BATCH
PATCH_ARGS+=		--batch
endif
ifneq (,$(call isyes,${_PATCH_CAN_BACKUP}))
PATCH_ARGS+=		${_PATCH_BACKUP_ARG} .orig
endif
PATCH_FUZZ_FACTOR?=	-F0	# Default to zero fuzz


# --- do-distribution-patch (PRIVATE) --------------------------------
#
# do-distribution-patch applies the distribution patches (specified
# in PATCHFILES) to the extracted sources.
#
.PHONY: distribution-patch-message do-distribution-patch

# PATCH_DIST_STRIP is a patch option that sets the pathname strip count.
# PATCH_DIST_ARGS is the list of arguments to pass to the patch command.
# PATCH_DIST_CAT is the command that outputs the patch to stdout.
#
# For each of these variables, there is a patch-specific variant that
# may be set, i.e. PATCH_DIST_STRIP.<patch>, PATCH_DIST_ARGS.<patch>,
# PATCH_DIST_CAT.<patch>.
#
PATCH_DIST_STRIP?=		-p0

PATCH_DIST_CAT?=	{ case $$$$patchfile in				\
			  *.Z|*.gz) ${GZCAT} $$$$patchfile ;;		\
			  *.bz2)    ${BZCAT} $$$$patchfile ;;		\
			  *)	    ${CAT} $$$$patchfile ;;		\
			  esac; }

define _PATCH_SPECIFIC_SET
PATCH_DIST_STRIP.$(subst =,--,${i})?=	${PATCH_DIST_STRIP}
ifdef PATCH_DIST_ARGS
PATCH_DIST_ARGS.$(subst =,--,${i})?=	${PATCH_DIST_ARGS}
else
  ifneq (,$(call isyes,$(_PATCH_DEBUG)))
PATCH_DIST_ARGS.$(subst =,--,${i})?=	-d ${WRKSRC} -E $${PATCH_DIST_STRIP.$(subst =,--,${i})}
  else
PATCH_DIST_ARGS.$(subst =,--,${i})?=	-d ${WRKSRC} --forward --quiet -E $${PATCH_DIST_STRIP.$(subst =,--,${i})}
  endif
endif
ifdef BATCH
PATCH_DIST_ARGS.$(subst =,--,${i})+=	--batch
endif
PATCH_DIST_CAT.$(subst =,--,${i})?=	{ patchfile=${i}; ${PATCH_DIST_CAT}; }
endef
$(foreach i,${PATCHFILES}, $(eval $(_PATCH_SPECIFIC_SET)))

distribution-patch-message:
	@${STEP_MSG} "Applying distribution patches for ${PKGNAME}"

do-distribution-patch:
	${_PKG_SILENT}${_PKG_DEBUG}					\
$(foreach i,${PATCHFILES},						\
	${ECHO_PATCH_MSG} "Applying distribution patch ${i}";		\
	cd ${_DISTDIR};							\
	${PATCH_DIST_CAT.$(subst =,--,${i})} |				\
	${PATCH} ${PATCH_DIST_ARGS.$(subst =,--,${i})} ||		\
		{ ${ERROR_MSG} "Patch ${i} failed"; exit 2; };		\
	${ECHO} ${_DISTDIR}/${i} >> ${_PATCH_APPLIED_FILE};		\
)


# --- do-pkgsrc-patch (PRIVATE) --------------------------------------
#
# do-pkgsrc-patch applies the pkgsrc patches to the extracted
# sources.
#
$(call require, ${ROBOTPKG_DIR}/mk/checksum/checksum-vars.mk)

.PHONY: pkgsrc-patch-message do-pkgsrc-patch

ifeq (yes,$(call exists,${PATCHDIR}))
_PKGSRC_PATCHES+=	$(wildcard ${PATCHDIR}/patch-*)
endif
ifdef PKG_PATCHES
_PKGSRC_PATCHES+=	${PKG_PATCHES}
endif

pkgsrc-patch-message:
	@${STEP_MSG} "Applying robotpkg patches for ${PKGNAME}"

do-pkgsrc-patch:
	${RUN}								\
	fail=;								\
	patches=$(call quote,${_PKGSRC_PATCHES});			\
	patch_warning() {						\
		${ERROR_MSG} "$$@";					\
	};								\
	for i in $$patches; do						\
		${TEST} -f "$$i" || continue;				\
		case "$$i" in						\
		*.orig|*.rej|*~)					\
			${STEP_MSG} "Ignoring patchfile $$i";		\
			continue;					\
			;;						\
		${PATCHDIR}/patch-local-*) 				\
			;;						\
		${PATCHDIR}/patch-*) 					\
			filename=$${i##*/};				\
			if ${TEST} ! -f ${DISTINFO_FILE}; then		\
				patch_warning "Ignoring patch file"	\
				  "$$filename: distinfo not found";	\
				continue;				\
			fi;						\
			algsum=`${AWK} '(NF == 4) &&			\
					($$2 == "('$$filename')") &&	\
					($$3 == "=") {			\
						print $$1 " " $$4	\
					}' ${DISTINFO_FILE} || ${TRUE}`;\
			if ${TEST} -z "$$algsum"; then			\
				patch_warning "Ignoring patch file"	\
					"$$filename: no checksum found";\
				continue;				\
			fi;						\
			set -- $$algsum;				\
			alg="$$1";					\
			recorded="$$2";					\
			calcsum=`${DIGEST} $$alg < $$i`; 		\
			${ECHO_PATCH_MSG} "Verifying $$filename"	\
				" (using digest algorithm $$alg)";	\
			if ${TEST} "$$calcsum" != "$$recorded"; then	\
				patch_warning "Ignoring patch file"	\
					"$$filename: invalid checksum"; \
				fail="$$fail $$i";			\
				continue;				\
			fi;						\
			;;						\
		esac;							\
		${ECHO_PATCH_MSG} "Applying pkgsrc patch $$i";		\
		fuzz_flags=;						\
		if ${PATCH} -v >/dev/null 2>&1; then			\
			fuzz_flags=${PATCH_FUZZ_FACTOR};		\
		fi;							\
		if ${PATCH} $$fuzz_flags ${PATCH_ARGS} < $$i; then	\
			${ECHO} "$$i" >> ${_PATCH_APPLIED_FILE};	\
		else							\
			${ECHO_MSG} "Patch $$i failed";			\
			fail="$$fail $$i";				\
		fi;							\
	done;								\
	if ${TEST} -n "$$fail"; then					\
		${ERROR_MSG} "${hline}";				\
		${ERROR_MSG} "${bf}Patching failed due to modified or"	\
			"broken patch file(s):${rm}";			\
		for i in $$fail; do					\
			${ERROR_MSG} "	$${i##*/}";			\
		done;							\
		${ERROR_MSG} "${hline}";				\
		exit 2;							\
	fi
