# $NetBSD: install.mk,v 1.24 2006/10/26 20:05:03 rillig Exp $


# --- install (PUBLIC) -----------------------------------------------

# install is a public target to install the package.
#
_INSTALL_TARGETS+=	build
_INSTALL_TARGETS+=	acquire-install-lock
_INSTALL_TARGETS+=	${_COOKIE.install}
_INSTALL_TARGETS+=	release-install-lock

.PHONY: install
ifeq (yes,$(call exists,${_COOKIE.install}))
install:
	@${DO_NADA}
else
  ifdef _PKGSRC_BARRIER
install: ${_INSTALL_TARGETS}
  else
install: barrier
  endif
endif

ifeq (yes,$(call exists,${_COOKIE.install}))
${_COOKIE.install}:
	@${DO_NADA}
else
${_COOKIE.install}: real-install
endif

.PHONY: acquire-install-lock release-install-lock
acquire-install-lock: acquire-lock
release-install-lock: release-lock

.PHONY: acquire-install-localbase-lock release-install-localbase-lock
acquire-install-localbase-lock: acquire-localbase-lock
release-install-localbase-lock: release-localbase-lock


# --- real-install (PRIVATE) -----------------------------------------
#
# real-install is a helper target onto which one can hook all of the
# targets that do the actual installing of the built objects.
#
_REAL_INSTALL_TARGETS+=	install-check-version
_REAL_INSTALL_TARGETS+=	install-message
#_REAL_INSTALL_TARGETS+=	install-vars
_REAL_INSTALL_TARGETS+=	install-all
_REAL_INSTALL_TARGETS+=	install-cookie

.PHONY: real-install
real-install: ${_REAL_INSTALL_TARGETS}

.PHONY: install-message
install-message:
	@${PHASE_MSG} "Installing for ${PKGNAME}"


# --- install-check-version (PRIVATE) --------------------------------
#
# install-check-version will verify that the built package located in
# ${WRKDIR} matches the version specified in the package Makefile.
# This is a check against stale work directories.
#
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


# --- install-all (PRIVATE) ------------------------------------------
#
# install-all is a helper target to run the install target of
# the built software, register the software installation, and run
# some sanity checks.
#
_INSTALL_ALL_TARGETS+=		acquire-install-localbase-lock
ifndef NO_PKG_REGISTER
ifndef FORCE_PKG_REGISTER
_INSTALL_ALL_TARGETS+=		pkg-install-check-conflicts
_INSTALL_ALL_TARGETS+=		pkg-install-check-installed
endif
endif
_INSTALL_ALL_TARGETS+=		install-check-umask
#_INSTALL_ALL_TARGETS+=		check-files-pre
_INSTALL_ALL_TARGETS+=		install-makedirs
#_INSTALL_ALL_TARGETS+=		pre-install-script
_INSTALL_ALL_TARGETS+=		pre-install
_INSTALL_ALL_TARGETS+=		do-install
_INSTALL_ALL_TARGETS+=		post-install
_INSTALL_ALL_TARGETS+=		plist
#_INSTALL_ALL_TARGETS+=		install-script-data
#_INSTALL_ALL_TARGETS+=		check-files-post
#_INSTALL_ALL_TARGETS+=		post-install-script
ifndef NO_PKG_REGISTER
_INSTALL_ALL_TARGETS+=		pkg-register
endif
_INSTALL_ALL_TARGETS+=		release-install-localbase-lock
#_INSTALL_ALL_TARGETS+=		error-check

.PHONY: install-all
install-all: ${_INSTALL_ALL_TARGETS}


# --- install-check-umask (PRIVATE) ----------------------------------
#
# install-check-umask tests whether the umask is properly set and
# emits a non-fatal warning otherwise.
#
.PHONY: install-check-umask
install-check-umask:
	${_PKG_SILENT}${_PKG_DEBUG}					\
	umask=`${SH} -c umask`;						\
	if ${TEST} "$$umask" -ne ${DEF_UMASK}; then			\
		${WARNING_MSG} "Your umask is \`\`$$umask''.";	\
		${WARNING_MSG} "If this is not desired, set it to an appropriate value (${DEF_UMASK}) and"; \
		${WARNING_MSG} "install this package again by \`\`${MAKE} deinstall reinstall''."; \
        fi


# --- install-makedirs (PRIVATE) -------------------------------------
#
# install-makedirs is a target to create directories expected to
# exist prior to installation.
#

.PHONY: install-makedirs
install-makedirs:
	${_PKG_SILENT}${_PKG_DEBUG}${TEST} -d ${PREFIX} || ${MKDIR} ${PREFIX}
ifdef INSTALLATION_DIRS
	@${STEP_MSG} "Creating installation directories"
	${_PKG_SILENT}${_PKG_DEBUG}					\
	for dir in ${INSTALLATION_DIRS}; do				\
		case "$$dir" in						\
		${PREFIX}/*)						\
			dir=`${ECHO} $$dir | ${SED} "s|^${PREFIX}/||"` ;; \
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


# --- pre-install, do-install, post-install (PUBLIC, override) -------
#
# {pre,do,post}-install are the heart of the package-customizable
# install targets, and may be overridden within a package Makefile.
#

INSTALL_DIRS?=		${BUILD_DIRS}
INSTALL_MAKE_FLAGS?=	# none
INSTALL_TARGET?=	install

do%install:
	${_OVERRIDE_TARGET}
	${_PKG_SILENT}${_PKG_DEBUG}					\
$(foreach _dir_,${INSTALL_DIRS},					\
	cd ${WRKSRC} && cd ${_dir_} &&					\
	${SETENV} ${INSTALL_ENV} ${MAKE_ENV} 				\
		${MAKE_PROGRAM} ${MAKE_FLAGS} ${INSTALL_MAKE_FLAGS}	\
			-f ${MAKE_FILE} ${INSTALL_TARGET};		\
)

.PHONY: pre-install post-install

pre-install:

post-install:


# --- install-clean (PRIVATE) ----------------------------------------
#
# install-clean removes the state files for the "install" and
# later phases so that the "install" target may be re-invoked.
#
install-clean: package-clean #check-clean
	${_PKG_SILENT}${_PKG_DEBUG}${RM} -f ${PLIST} ${_COOKIE.install}


# --- bootstrap-register (PUBLIC) ------------------------------------
#
# bootstrap-register registers "bootstrap" packages that are installed
# by the pkgsrc/bootstrap/bootstrap script.
#
bootstrap-register: pkg-register clean
	@${DO_NADA}


# --- install-cookie (PRIVATE) ---------------------------------------
#
# install-cookie creates the "install" cookie file.
#
.PHONY: install-cookie
install-cookie:
	${_PKG_SILENT}${_PKG_DEBUG}${TEST} ! -f ${_COOKIE.install} || ${FALSE}
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} $(dir ${_COOKIE.install})
	${_PKG_SILENT}${_PKG_DEBUG}${ECHO} ${PKGNAME} > ${_COOKIE.install}
