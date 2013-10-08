#
# Copyright (c) 2009-2013 LAAS/CNRS
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
#                                             Anthony Mallet on Sat Oct 24 2009
#

# --- bootstrap-depends (PUBLIC) -------------------------------------------
#
# bootstrap-depends is a public target to install any missing dependencies
# needed during stages before the normal "depends" stage.  These dependencies
# are packages with DEPEND_METHOD.pkg set to bootstrap.
#
_BSDEPENDS_TARGETS+=	cbeh
_BSDEPENDS_TARGETS+=	do-bootstrap-depends

bootstrap-depends: ${_BSDEPENDS_TARGETS};

# force cookie rebuilding when bootstrap-depends is explicitely requested
ifneq (,$(filter bootstrap-depends,${MAKECMDGOALS}))
  _cbeh_requires+=	${_COOKIE.bootstrap-depends}
  ifeq (,${MAKE_RESTARTS})
    ${_COOKIE.bootstrap-depends}: .FORCE
  endif
endif

# Fails if the 'bootstrap' depends cookie does not exist: this provides better
# error messages than those printed by gmake when it fails in the middle of the
# cookie rebuilding target.
.PHONY: do-bootstrap-depends
do-bootstrap-depends:
	@${TEST} -f ${_COOKIE.bootstrap-depends}


# --- ${_COOKIE.bootstrap-depends} -----------------------------------------
#
# ${_COOKIE.bootstrap-depends} creates the "depends" cookie file.
# When the cookie exists, data gathered by prefixsearch.sh gets included.
# The cookie itself is included to trigger gmake's restart when the cookie is
# outdated.
#
ifeq (yes,$(call exists,${_COOKIE.bootstrap-depends}))
  # depend on files not in WRKDIR
  _bsdepend_cookiedep=$(filter-out $(realpath ${WRKDIR})/%,${MAKEFILE_LIST})

  _MAKEFILE_WITH_RECIPES+=${_COOKIE.bootstrap-depends}
  ${_COOKIE.bootstrap-depends}: ${_bsdepend_cookiedep}
	${RUN}${TEST} ! -f $@ || ${MV} -f $@ $@.prev;			\
	${RM} -f ${_ALTERNATIVES_FILE} ${_SYSBSDEPENDS_FILE} ${_BSDEPENDS_FILE}

  _cbeh_requires+=	${_COOKIE.bootstrap-depends}
else
  $(call require, ${ROBOTPKG_DIR}/mk/depends/sysdep.mk)
  $(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)

  ${_COOKIE.bootstrap-depends}: real-bootstrap-depends;
endif

# --- depends-cookie (PRIVATE) ---------------------------------------------
#
# depends-cookie creates the "depends" cookie file.
#
# The cookie calls a callback to check that no new dependencies have been added
# since last resolution. This can happen if no package file have changed but a
# different package target is required (with more dependencies) in an existing
# WRKDIR.
#
override define _dpd_chkbsnew
  ifneq (,$(filter-out ${_COOKIE.bootstrap-depends.use},		\
         $(foreach _,${DEPEND_USE},					\
           $(if $(filter bootstrap,${DEPEND_METHOD.$_}),$_))))
    ${_COOKIE.bootstrap-depends}: .FORCE
  endif
endef

.PHONY: bootstrap-depends-cookie
bootstrap-depends-cookie: makedirs
	${RUN}								\
	if ${TEST} -f ${_COOKIE.bootstrap-depends}; then		\
	  >>${_COOKIE.bootstrap-depends};				\
	  exit 0;							\
	fi;								\
	exec >>${_COOKIE.bootstrap-depends};				\
	${ECHO} "_COOKIE.bootstrap-depends.date:=`${_CDATE_CMD}`";	\
	${ECHO} "_COOKIE.bootstrap-depends.use:="			\
	  $(foreach _,${DEPEND_USE},					\
	    $(if $(filter bootstrap,${DEPEND_METHOD.$_}),'$_'));	\
	${ECHO} '$$(eval $$(call _dpd_chkbsnew))'


# --- real-bootstrap-depends (PRIVATE) -------------------------------------
#
# real-bootstrap-depends is a helper target onto which one can hook all of the
# targets that do the actual bootstrap dependency installation.
#
_REAL_BSDEPENDS_TARGETS+=	makedirs
_REAL_BSDEPENDS_TARGETS+=	acquire-depends-lock
_REAL_BSDEPENDS_TARGETS+=	bootstrap-depends-message
ifdef PKG_ALTERNATIVES
  _REAL_BSDEPENDS_TARGETS+=	resolve-alternatives
endif
_REAL_BSDEPENDS_TARGETS+=	pkg-bootstrap-depends
_REAL_BSDEPENDS_TARGETS+=	sys-bootstrap-depends
_REAL_BSDEPENDS_TARGETS+=	bootstrap-depends-cookie
ifneq (,$(filter bootstrap-depends,${MAKECMDGOALS}))
  _REAL_BSDEPENDS_TARGETS+=	bootstrap-depends-done-message
endif
_REAL_BSDEPENDS_TARGETS+=	release-depends-lock

.PHONY: real-bootstrap-depends
real-bootstrap-depends: ${_REAL_BSDEPENDS_TARGETS}

.PHONY: bootstrap-depends-message
bootstrap-depends-message:
	@if ${TEST} -f "${_COOKIE.bootstrap-depends}.prev"; then	\
	  ${PHASE_MSG} "Rechecking bootstrap dependencies for"		\
		 "${PKGNAME}";						\
	else								\
	  ${PHASE_MSG} "Checking bootstrap dependencies for ${PKGNAME}";\
	fi
