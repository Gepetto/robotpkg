# $NetBSD: install.mk,v 1.24 2006/10/26 20:05:03 rillig Exp $

# --- install (PUBLIC) -----------------------------------------------

# install is a public target to install the package.  It will
# acquire elevated privileges just-in-time.
#
_INSTALL_TARGETS+=	${_PKGSRC_BUILD_TARGETS}
_INSTALL_TARGETS+=	acquire-install-lock
_INSTALL_TARGETS+=	${_COOKIE.install}
_INSTALL_TARGETS+=	release-install-lock

.PHONY: install
ifeq (yes,$(call exists,${_COOKIE.install}))
install:
	@${DO_NADA}
else
install: ${_INSTALL_TARGETS}
endif

.PHONY: acquire-install-lock release-install-lock
acquire-install-lock: acquire-lock
release-install-lock: release-lock

ifeq (yes,$(call exists,${_COOKIE.install}))
${_COOKIE.install}:
	@${DO_NADA}
else
${_COOKIE.install}: real-install
endif

######################################################################
### real-install (PRIVATE)
######################################################################
### real-install is a helper target onto which one can hook all of the
### targets that do the actual installing of the built objects.
###
_REAL_INSTALL_TARGETS+=	install-check-interactive
_REAL_INSTALL_TARGETS+=	install-check-version
_REAL_INSTALL_TARGETS+=	install-message
_REAL_INSTALL_TARGETS+=	install-vars
_REAL_INSTALL_TARGETS+=	unprivileged-install-hook
_REAL_INSTALL_TARGETS+=	install-all
_REAL_INSTALL_TARGETS+=	install-cookie

.PHONY: real-install
real-install: ${_REAL_INSTALL_TARGETS}

.PHONY: install-message
install-message:
	@${PHASE_MSG} "Installing for ${PKGNAME}"


######################################################################
### install-check-version (PRIVATE)
######################################################################
### install-check-version will verify that the built package located in
### ${WRKDIR} matches the version specified in the package Makefile.
### This is a check against stale work directories.
###
.PHONY: install-check-version
install-check-version: ${_COOKIE.extract}
	${_PKG_SILENT}${_PKG_DEBUG}					\
	extractname=`${CAT} ${_COOKIE.extract}`;			\
	pkgname=${PKGNAME};						\
	case "$$extractname" in						\
	"")	${WARNING_MSG} "${WRKDIR} may contain an older version of ${PKGBASE}" ;; \
	"$$pkgname")	;;						\
	*)	${WARNING_MSG} "Package version $$extractname in ${WRKDIR}"; \
		${WARNING_MSG} "Current version $$pkgname in ${PKGPATH}"; \
		${WARNING_MSG} "Cleaning and rebuilding $$pkgname...";	\
		${RECURSIVE_MAKE} clean build ;;			\
	esac

######################################################################
### The targets below are run with elevated privileges.
######################################################################

.PHONY: acquire-install-localbase-lock release-install-localbase-lock
acquire-install-localbase-lock: acquire-localbase-lock
release-install-localbase-lock: release-localbase-lock

######################################################################
### install-all, su-install-all (PRIVATE)
######################################################################
### install-all is a helper target to run the install target of
### the built software, register the software installation, and run
### some sanity checks.
###
_INSTALL_ALL_TARGETS+=		acquire-install-localbase-lock
ifndef NO_PKG_REGISTER
ifndef FORCE_PKG_REGISTER
_INSTALL_ALL_TARGETS+=		install-check-conflicts
_INSTALL_ALL_TARGETS+=		install-check-installed
endif
endif
_INSTALL_ALL_TARGETS+=		install-check-umask
_INSTALL_ALL_TARGETS+=		check-files-pre
_INSTALL_ALL_TARGETS+=		install-makedirs
_INSTALL_ALL_TARGETS+=		pre-install-script
_INSTALL_ALL_TARGETS+=		pre-install
_INSTALL_ALL_TARGETS+=		do-install
_INSTALL_ALL_TARGETS+=		post-install
_INSTALL_ALL_TARGETS+=		plist
_INSTALL_ALL_TARGETS+=		install-doc-handling
_INSTALL_ALL_TARGETS+=		install-script-data
_INSTALL_ALL_TARGETS+=		check-files-post
_INSTALL_ALL_TARGETS+=		post-install-script
ifndef NO_PKG_REGISTER
_INSTALL_ALL_TARGETS+=		register-pkg
endif
_INSTALL_ALL_TARGETS+=		privileged-install-hook
_INSTALL_ALL_TARGETS+=		release-install-localbase-lock
_INSTALL_ALL_TARGETS+=		error-check

.PHONY: install-all
install-all: ${_INSTALL_ALL_TARGETS}


######################################################################
### install-check-umask (PRIVATE)
######################################################################
### install-check-umask tests whether the umask is properly set and
### emits a non-fatal warning otherwise.
###
.PHONY: install-check-umask
install-check-umask:
	${_PKG_SILENT}${_PKG_DEBUG}					\
	umask=`${SH} -c umask`;						\
	if ${TEST} "$$umask" -ne ${DEF_UMASK}; then			\
		${WARNING_MSG} "Your umask is \`\`$$umask''.";	\
		${WARNING_MSG} "If this is not desired, set it to an appropriate value (${DEF_UMASK}) and install"; \
		${WARNING_MSG} "this package again by \`\`${MAKE} deinstall reinstall''."; \
        fi

######################################################################
### install-makedirs (PRIVATE)
######################################################################
### install-makedirs is a target to create directories expected to
### exist prior to installation.  If a package sets INSTALLATION_DIRS,
### then it's known to pre-create all of the directories that it needs
### at install-time, so we don't need mtree to do it for us.
###
MTREE_FILE?=	${PKGSRCDIR}/mk/platform/${OPSYS}.pkg.dist
MTREE_ARGS?=	-U -f ${MTREE_FILE} -d -e -p

.PHONY: install-makedirs
install-makedirs:
	${_PKG_SILENT}${_PKG_DEBUG}${TEST} -d ${DESTDIR}${PREFIX} || ${MKDIR} ${DESTDIR}${PREFIX}
ifndef NO_MTREE
	${_PKG_SILENT}${_PKG_DEBUG}${TEST} ! -f ${MTREE_FILE} ||	\
		${MTREE} ${MTREE_ARGS} ${DESTDIR}${PREFIX}/
endif
ifdef INSTALLATION_DIRS
	@${STEP_MSG} "Creating installation directories"
	${_PKG_SILENT}${_PKG_DEBUG}					\
	for dir in ${INSTALLATION_DIRS}; do				\
		case "$$dir" in						\
		${DESTDIR}${PREFIX}/*)					\
			dir=`${ECHO} $$dir | ${SED} "s|^${DESTDIR}${PREFIX}/||"` ;; \
		/*)	continue ;;					\
		esac;							\
		if [ -f "${PREFIX}/$$dir" ]; then			\
			${ERROR_MSG} "[install.mk] $$dir should be a directory, but is a file."; \
			exit 1;						\
		fi;							\
		case "$$dir" in						\
		*bin|*bin/*|*libexec|*libexec/*)			\
			${INSTALL_PROGRAM_DIR} ${DESTDIR}${PREFIX}/$$dir ;;	\
		${PKGMANDIR}/*)						\
			${INSTALL_MAN_DIR} ${DESTDIR}${PREFIX}/$$dir ;;		\
		*)							\
			${INSTALL_DATA_DIR} ${DESTDIR}${PREFIX}/$$dir ;;	\
		esac;							\
	done
endif	# INSTALLATION_DIRS

######################################################################
### pre-install, do-install, post-install (PUBLIC, override)
######################################################################
### {pre,do,post}-install are the heart of the package-customizable
### install targets, and may be overridden within a package Makefile.
###
.PHONY: pre-install do-install post-install

INSTALL_DIRS?=		${BUILD_DIRS}
INSTALL_MAKE_FLAGS?=	# none
INSTALL_TARGET?=	install ${USE_IMAKE:D${NO_INSTALL_MANPAGES:D:Uinstall.man}}

do-install:
#.  for _dir_ in ${INSTALL_DIRS}
	${_PKG_SILENT}${_PKG_DEBUG}${_ULIMIT_CMD}			\
	cd ${WRKSRC} && cd ${_dir_} &&					\
	${SETENV} ${INSTALL_ENV} ${MAKE_ENV} 				\
		${MAKE_PROGRAM} ${MAKE_FLAGS} ${INSTALL_MAKE_FLAGS}	\
			-f ${MAKE_FILE} ${INSTALL_TARGET}
#.  endfor

pre-install:
	@${DO_NADA}

post-install:
	@${DO_NADA}


######################################################################
### install-doc-handling (PRIVATE)
######################################################################
### install-doc-handling does automatic document (de)compression based
### on the contents of the PLIST.
###
_PLIST_REGEXP.info=	\
	^([^\/]*\/)*${PKGINFODIR}/[^/]*(\.info)?(-[0-9]+)?(\.gz)?$$
_PLIST_REGEXP.man=	\
	^([^/]*/)+(man[1-9ln]/[^/]*\.[1-9ln]|cat[1-9ln]/[^/]*\.[0-9])(\.gz)?$$

_DOC_COMPRESS=								\
	${SETENV} PATH=${PATH:Q}					\
		MANZ=${_MANZ}						\
		PKG_VERBOSE=${PKG_VERBOSE}				\
		TEST=${TOOLS_TEST:Q}					\
	${SH} ${PKGSRCDIR}/mk/plist/doc-compress ${DESTDIR}${PREFIX}

.PHONY: install-doc-handling
install-doc-handling: plist
	@${STEP_MSG} "Automatic manual page handling"
	${_PKG_SILENT}${_PKG_DEBUG}${CAT} ${PLIST} | ${GREP} -v "^@" |	\
	${EGREP} ${_PLIST_REGEXP.man:Q} | ${_DOC_COMPRESS}

######################################################################
### register-pkg (PRIVATE, override)
######################################################################
### register-pkg registers the package as being installed on the system.
###
.PHONY: register-pkg
#.if !target(register-pkg)
register-pkg:
	@${DO_NADA}
#.endif

######################################################################
### privileged-install-hook (PRIVATE, override, hook)
######################################################################
### privileged-install-hook is a generic hook target that is run just
### before pkgsrc drops elevated privileges.
###
.PHONY: privileged-install-hook
#.if !target(privileged-install-hook)
privileged-install-hook:
	@${DO_NADA}
#.endif

######################################################################
### install-clean (PRIVATE)
######################################################################
### install-clean removes the state files for the "install" and
### later phases so that the "install" target may be re-invoked.
###
install-clean: package-clean check-clean
	${_PKG_SILENT}${_PKG_DEBUG}${RM} -f ${PLIST} ${_COOKIE.install}


# --- bootstrap-register (PUBLIC) ------------------------------------

# bootstrap-register registers "bootstrap" packages that are installed
# by the pkgsrc/bootstrap/bootstrap script.
#
bootstrap-register: pkg-register clean
	@${DO_NADA}
