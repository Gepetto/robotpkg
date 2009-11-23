#
# Copyright (c) 2006,2009 LAAS/CNRS                        --  Thu Dec  7 2006
# All rights reserved.
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
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# From $NetBSD: install.mk,v 1.24 2006/10/26 20:05:03 rillig Exp $
# Copyright (c) 1994-2006 The NetBSD Foundation, Inc.
#
#   3. All advertising materials mentioning   features or use of this
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

# --- install (PUBLIC) -----------------------------------------------

# install is a public target to install the package.
#
_INSTALL_TARGETS+=	build
_INSTALL_TARGETS+=	acquire-install-lock
_INSTALL_TARGETS+=	${_COOKIE.install}
_INSTALL_TARGETS+=	release-install-lock

.PHONY: install
ifeq (yes,$(call exists,${_COOKIE.install}))
  install:;
else
  install: $(call barrier, depends, ${_INSTALL_TARGETS})
endif

ifeq (yes,$(call exists,${_COOKIE.install}))
  ${_COOKIE.install}:;
else
  $(call require, ${ROBOTPKG_DIR}/mk/compiler/compiler-vars.mk)
  $(call require, ${ROBOTPKG_DIR}/mk/plist/plist-vars.mk)

  ${_COOKIE.install}: real-install;
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
_REAL_INSTALL_TARGETS+=	install-check-interactive
ifndef _EXTRACT_IS_CHECKOUT
  _REAL_INSTALL_TARGETS+=install-check-version
endif
_REAL_INSTALL_TARGETS+=	install-message
_REAL_INSTALL_TARGETS+=	install-all
_REAL_INSTALL_TARGETS+=	install-cookie

.PHONY: real-install
real-install: ${_REAL_INSTALL_TARGETS}

.PHONY: install-message
install-message:
	@${PHASE_MSG} "Installing for ${PKGNAME}"
	@>${INSTALL_LOGFILE}


# --- install-check-interactive (PRIVATE) ----------------------------
#
# install-check-interactive checks whether we must do an interactive
# install or not.
#
.PHONY: install-check-interactive
install-check-interactive:
ifdef BATCH
 ifneq (,$(filter install,${INTERACTIVE_STAGE}))
	@${ERROR_MSG} "The installation stage of this package requires user interaction"
	@${ERROR_MSG} "Please install manually with:"
	@${ERROR_MSG} "	\"cd ${.CURDIR} && ${MAKE} install\""
	${RUN} ${TOUCH} ${_INTERACTIVE_COOKIE}
	${RUN} ${FALSE}
 else
	@${DO_NADA}
 endif
else
	@${DO_NADA}
endif


# --- install-check-version (PRIVATE) --------------------------------
#
# install-check-version will verify that the built package located in
# ${WRKDIR} matches the version specified in the package Makefile.
# This is a check against stale work directories.
#
.PHONY: install-check-version
install-check-version: ${_COOKIE.extract}
	${RUN}								\
	extractname=`${CAT} $^`;					\
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

.PHONY: install-all
ifneq (,$(call isyes,${MAKE_SUDO_INSTALL}))
  _SU_TARGETS+=	install-all
  install-all: su-target-install-all
  su-install-all: ${_INSTALL_ALL_TARGETS}
else
  install-all: ${_INSTALL_ALL_TARGETS}
endif


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

do%install: .FORCE
	${_OVERRIDE_TARGET}
	${_PKG_SILENT}${_PKG_DEBUG}					\
$(foreach _dir_,${INSTALL_DIRS},					\
	cd ${WRKSRC} && cd ${_dir_} &&					\
	${INSTALL_LOGFILTER} ${SETENV} ${INSTALL_ENV} ${MAKE_ENV} 	\
		${MAKE_PROGRAM} ${MAKE_FLAGS} ${INSTALL_MAKE_FLAGS}	\
			-f ${MAKE_FILE} ${INSTALL_TARGET};		\
)

.PHONY: pre-install post-install

pre-install:

post-install:


# --- bootstrap-register (PUBLIC) ------------------------------------
#
# bootstrap-register registers "bootstrap" packages that are installed
# by the pkgsrc/bootstrap/bootstrap script.
#
$(call require, ${ROBOTPKG_DIR}/mk/clean.mk)

bootstrap-register: pkg-register clean
	@${DO_NADA}
