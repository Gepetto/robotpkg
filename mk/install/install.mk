#
# Copyright (c) 2006,2009-2013 LAAS/CNRS
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
# From $NetBSD: install.mk,v 1.24 2006/10/26 20:05:03 rillig Exp $
#
#                                       Anthony Mallet on Thu Dec  7 2006


# --- install (PUBLIC) -----------------------------------------------

# install is a public target to install the package.
#
$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)
$(call require, ${ROBOTPKG_DIR}/mk/build/build-vars.mk)

_INSTALL_TARGETS+=	$(call add-barrier, depends, install)
_INSTALL_TARGETS+=	build
_INSTALL_TARGETS+=	acquire-install-lock
_INSTALL_TARGETS+=	${_COOKIE.install}
_INSTALL_TARGETS+=	release-install-lock

.PHONY: install
install: ${_INSTALL_TARGETS};


.PHONY: acquire-install-lock release-install-lock
acquire-install-lock: acquire-lock
release-install-lock: release-lock

.PHONY: acquire-install-localbase-lock release-install-localbase-lock
acquire-install-localbase-lock: acquire-localbase-lock
release-install-localbase-lock: release-localbase-lock


# --- ${_COOKIE.install} ---------------------------------------------------
#
# ${_COOKIE.install} creates the "install" cookie file.
#
ifeq (yes,$(call exists,${_COOKIE.install}))
  ifneq (,$(filter install,${MAKECMDGOALS}))
    ${_COOKIE.install}: .FORCE
  endif

  _MAKEFILE_WITH_RECIPES+=${_COOKIE.install}
  ${_COOKIE.install}: ${_COOKIE.build}
	${RUN}${TEST} ! -f $@ || ${MV} -f $@ $@.prev

  _cbbh_requires+=	${_COOKIE.install}
else
  $(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)
  $(call require, ${ROBOTPKG_DIR}/mk/plist/plist-vars.mk)

  ${_COOKIE.install}: real-install;
endif


# --- real-install (PRIVATE) -----------------------------------------
#
# real-install is a helper target onto which one can hook all of the
# targets that do the actual installing of the built objects.
#
$(call require, ${ROBOTPKG_DIR}/mk/extract/extract-vars.mk)

_REAL_INSTALL_TARGETS+=		install-check-interactive
ifndef NO_PKG_REGISTER
  ifndef FORCE_PKG_REGISTER
    _REAL_INSTALL_TARGETS+=	pkg-install-check-conflicts
    _REAL_INSTALL_TARGETS+=	pkg-install-check-required
  endif
endif
_REAL_INSTALL_TARGETS+=		install-deinstall
ifndef NO_PKG_REGISTER
  ifndef FORCE_PKG_REGISTER
    ifeq (,$(filter confirm,${MAKECMDGOALS}))
      _REAL_INSTALL_TARGETS+=	pkg-install-check-files
    endif
  endif
endif
_REAL_INSTALL_TARGETS+=		install-message
_REAL_INSTALL_TARGETS+=		install-all
_REAL_INSTALL_TARGETS+=		install-cookie
ifneq (,$(filter install,${MAKECMDGOALS}))
  _REAL_INSTALL_TARGETS+=	install-done-message
endif

.PHONY: real-install
real-install: ${_REAL_INSTALL_TARGETS}

.PHONY: install-message
install-message:
	@if ${TEST} -f "${_COOKIE.install}.prev"; then			\
	  ${PHASE_MSG} "Reinstalling for ${PKGNAME}";			\
	else								\
	  ${PHASE_MSG} "Installing for ${PKGNAME}";			\
	fi;								\
	>${INSTALL_LOGFILE}


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
	@${ERROR_MSG} "	\"cd ${CURDIR} && ${MAKE} install\""
	${RUN} ${FALSE}
 else
	@${DO_NADA}
 endif
else
	@${DO_NADA}
endif


# --- install-deinstall (PRIVATE) ------------------------------------------
#
# install-deinstall invokes deinstall in a sub make an print an error if the
# package cannot be deinstalled.
#
.PHONY: install-deinstall
install-deinstall:
	${RUN}found=`${PKG_INFO} -e '${PKGWILDCARD}' || ${TRUE}`;	\
	${TEST} -n "$$found" || exit 0;					\
	${RECURSIVE_MAKE} deinstall


# --- install-all (PRIVATE) ------------------------------------------
#
# install-all is a helper target to run the install target of
# the built software, register the software installation, and run
# some sanity checks.
#
_INSTALL_ALL_TARGETS+=		acquire-install-localbase-lock
ifndef NO_INSTALL
  _INSTALL_ALL_TARGETS+=	generate-install-script
  _INSTALL_ALL_TARGETS+=	do-install-failsafe
endif
_INSTALL_ALL_TARGETS+=		plist
_INSTALL_ALL_TARGETS+=		install-failed
ifndef NO_PKG_REGISTER
  _INSTALL_ALL_TARGETS+=	pkg-register
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
ifdef INSTALLATION_DIRS
  include ${ROBOTPKG_DIR}/pkgtools/install-sh/depend.mk
endif

.PHONY: install-makedirs
install-makedirs:
	${RUN}${TEST} -d ${PREFIX} || ${MKDIR} ${PREFIX}
ifdef INSTALLATION_DIRS
	@${STEP_MSG} "Creating installation directories"
	${RUN} for dir in ${INSTALLATION_DIRS}; do			\
	  case "$$dir" in						\
	    ${PREFIX}/*)						\
		dir=`${ECHO} $$dir | ${SED} "s|^${PREFIX}/||"` ;;	\
	    /*)	continue ;;						\
	  esac;								\
	  if ${TEST} -f "${PREFIX}/$$dir"; then				\
	    ${ERROR_MSG} "$$dir should be a directory, but is a file."; \
	    exit 1;							\
	  fi;								\
	  case "$$dir" in						\
	    *bin|*bin/*|*libexec|*libexec/*)				\
	      ${INSTALL_PROGRAM_DIR} ${DESTDIR}${PREFIX}/$$dir ;;	\
	    ${PKGMANDIR}/*)						\
	      ${INSTALL_MAN_DIR} ${DESTDIR}${PREFIX}/$$dir ;;		\
	    *)								\
	      ${INSTALL_DATA_DIR} ${DESTDIR}${PREFIX}/$$dir ;;		\
	  esac;								\
	done
endif	# INSTALLATION_DIRS


# --- install-failsafe (PRIVATE) -------------------------------------------
#
# Invoke install target in the package and (try to) undo installation on error
#
_install_failed=	${WRKDIR}/.install-failed

_INSTALL_FAILSAFE_TARGETS+=	install-makedirs
_INSTALL_FAILSAFE_TARGETS+=	pre-install-script
_INSTALL_FAILSAFE_TARGETS+=	pre-install
_INSTALL_FAILSAFE_TARGETS+=	do-install
_INSTALL_FAILSAFE_TARGETS+=	post-install
_INSTALL_FAILSAFE_TARGETS+=	post-install-script

.PHONY: install-failsafe
install-failsafe: ${_INSTALL_FAILSAFE_TARGETS}

.PHONY: do-install-failsafe
do-install-failsafe:
	${RUN}${RECURSIVE_MAKE} install-failsafe || >${_install_failed}

.PHONY: install-failed
ifdef PKG_PRESERVE
  install-failed:
	${RUN}${TEST} -f ${_install_failed} || exit 0;			\
	${RM} -f ${_install_failed};					\
	exit 2
else
  install-failed:
	${RUN}${TEST} -f ${_install_failed} || exit 0;			\
	${STEP_MSG} "Undoing failed installation";			\
	${RM} -f ${_install_failed};					\
	prefix="${PREFIX}";						\
	while read f; do						\
	  case $$f in							\
	    @cwd*)	set -- $$f; shift; prefix="$$@";;		\
	    @ignore*)	read f;;					\
	    @*)		;;						\
	    *)		${RM} -f "$$prefix/$$f";;			\
	  esac;								\
	done <${PLIST};							\
	${ERROR_MSG} "${hline}";					\
	${ERROR_MSG} "$${bf}Installation of ${PKGNAME} failed.$${rm}";	\
	${ERROR_MSG} "";						\
	${ERROR_MSG} "Check ${INSTALL_LOGFILE} for details";		\
	${ERROR_MSG} "${hline}";					\
	exit 2
endif


# --- pre-install, do-install, post-install (PUBLIC, override) -------
#
# {pre,do,post}-install are the heart of the package-customizable
# install targets, and may be overridden within a package Makefile.
#

INSTALL_DIRS?=		${BUILD_DIRS}
INSTALL_MAKE_FLAGS?=	# none
INSTALL_TARGET?=	install

INSTALL_MAKE_CMD?=\
	${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM}				\
		${MAKE_FLAGS} ${INSTALL_MAKE_FLAGS} -f ${MAKE_FILE}	\
		${INSTALL_TARGET}

do%install: .FORCE
	${_OVERRIDE_TARGET}
	${_PKG_SILENT}${_PKG_DEBUG}					\
$(foreach _dir_,${INSTALL_DIRS},					\
	cd ${WRKSRC} && cd ${_dir_} &&					\
	${INSTALL_LOGFILTER} $(call INSTALL_MAKE_CMD,${_dir_});	\
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

bootstrap-register: generate-install-script pkg-register clean
	@${DO_NADA}
