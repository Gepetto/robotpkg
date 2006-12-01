# $NetBSD: patch.mk,v 1.11 2006/07/22 16:31:35 jlam Exp $
#
# The following variables may be set in a package Makefile and control
# how pkgsrc patches are applied.
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

_PATCH_APPLIED_FILE=	${WRKDIR}/.patch
_COOKIE.patch=		${WRKDIR}/.patch_done


# --- patch (PUBLIC) -------------------------------------------------
#
# patch is a public target to apply the distribution and pkgsrc
# patches to the extracted sources for the package.
#
_PATCH_TARGETS+=	extract
_PATCH_TARGETS+=	acquire-patch-lock
_PATCH_TARGETS+=	${_COOKIE.patch}
_PATCH_TARGETS+=	release-patch-lock

.PHONY: patch
ifeq (yes,$(call exists,${_COOKIE.patch}))
patch:
	@${DO_NADA}
else
patch: ${_PATCH_TARGETS}
endif

.PHONY: acquire-patch-lock release-patch-lock
acquire-patch-lock: acquire-lock
release-patch-lock: release-lock

ifeq (yes,$(call exists,${_COOKIE.patch}))
${_COOKIE.patch}:
	@${DO_NADA}
else
${_COOKIE.patch}: real-patch
endif


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
#_REAL_PATCH_TARGETS+=	error-check

.PHONY: real-patch
real-patch: ${_REAL_PATCH_TARGETS}

.PHONY: patch-message
patch-message:
	@${PHASE_MSG} "Patching for ${PKGNAME}"


# --- patch-cookie (PRIVATE) -----------------------------------------
#
# patch-cookie creates the "patch" cookie file.  The contents are
# the paths to the patches that were applied (if any).
#
.PHONY: patch-cookie
patch-cookie:
	${_PKG_SILENT}${_PKG_DEBUG}${TEST} ! -f ${_COOKIE.patch} || ${FALSE}
	${_PKG_SILENT}${_PKG_DEBUG}					\
	if ${TEST} -f ${_PATCH_APPLIED_FILE}; then			\
		${MV} -f ${_PATCH_APPLIED_FILE} ${_COOKIE.patch};	\
	else								\
		${TOUCH} ${TOUCH_FLAGS} ${_COOKIE.patch};		\
	fi


# --- pre-patch, do-patch, post-patch (PUBLIC, override) -------------
#
# {pre,do,post}-patch are the heart of the package-customizable
# patch targets, and may be overridden within a package Makefile.
#
.PHONY: pre-patch do-patch post-patch

ifdef PATCHFILES
_PKGSRC_PATCH_TARGETS+=	distribution-patch-message
_PKGSRC_PATCH_TARGETS+=	do-distribution-patch
endif
ifeq (yes,($call exists,${PATCHDIR}))
_PKGSRC_PATCH_TARGETS+=	pkgsrc-patch-message
endif

.PHONY: do-patch
do%patch: ${_PKGSRC_PATCH_TARGETS}
	${_OVERRIDE_TARGET}
	@${DO_NADA}

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
ifneq (,$(call isyes,${_PATCH_CAN_BACKUP}))
PATCH_ARGS+=		${_PATCH_BACKUP_ARG} .orig
endif
PATCH_FUZZ_FACTOR?=	-F0	# Default to zero fuzz

_PKGSRC_PATCH_FAIL=							\
if ${TEST} -n ${PKG_OPTIONS}"" ; then \
	${ERROR_MSG} "=========================================================================="; \
	${ERROR_MSG};							\
	${ERROR_MSG} "Some of the selected build options and/or local patches may be incompatible."; \
	${ERROR_MSG} "Please try building with fewer options or patches."; \
	${ERROR_MSG};							\
	${ERROR_MSG} "=========================================================================="; \
fi; exit 1


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

define _PATCH_SPECIFIC_SET
PATCH_DIST_STRIP.$(subst =,--,${i})?=	${PATCH_DIST_STRIP}
ifdef PATCH_DIST_ARGS
PATCH_DIST_ARGS.$(subst =,--,${i})?=	${PATCH_DIST_ARGS}
else
  ifneq (,$(call isyes,$(_PATCH_DEBUG)))
PATCH_DIST_ARGS.$(subst =,--,${i})?=	-d ${WRKSRC} -E ${PATCH_DIST_STRIP.$(subst =,--,${i})}
  else
PATCH_DIST_ARGS.$(subst =,--,${i})?=	-d ${WRKSRC} --forward --quiet -E ${PATCH_DIST_STRIP.$(subst =,--,${i})}
  endif
endif
endef
$(foreach i,${PATCHFILES}, $(eval $(_PATCH_SPECIFIC_SET)))

distribution-patch-message:
	@${STEP_MSG} "Applying distribution patches for ${PKGNAME}"

do-distribution-patch:
	${_PKG_SILENT}${_PKG_DEBUG}					\
$(foreach i,${PATCHFILES},						\
	${ECHO_PATCH_MSG} "Applying distribution patch ${i}";		\
	cd ${_DISTDIR};							\
	${CAT} ${i} |							\
	${PATCH} ${PATCH_DIST_ARGS.$(subst =,--,${i})} ||		\
		{ ${ERROR_MSG} "Patch ${i} failed"; ${_PKGSRC_PATCH_FAIL}; }; \
	${ECHO} ${_DISTDIR}/${i} >> ${_PATCH_APPLIED_FILE};		\
)
