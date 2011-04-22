#
# Copyright (c) 2009-2011 LAAS/CNRS
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
_BSDEPENDS_TARGETS+=	cbbh
_BSDEPENDS_TARGETS+=	acquire-depends-lock
_BSDEPENDS_TARGETS+=	${_COOKIE.bootstrap-depends}
_BSDEPENDS_TARGETS+=	release-depends-lock

bootstrap-depends: ${_BSDEPENDS_TARGETS};


# --- ${_COOKIE.bootstrap-depends} -----------------------------------------
#
# ${_COOKIE.bootstrap-depends} creates the "depends" cookie file.
# When the cookie exists, data gathered by prefixsearch.sh gets included.
# The cookie itself is included to trigger gmake's restart when the cookie is
# outdated.
#

ifeq (yes,$(call exists,${_COOKIE.bootstrap-depends}))
  ifneq (,$(filter bootstrap-depends,${MAKECMDGOALS}))
    ${_COOKIE.bootstrap-depends}: .FORCE
  endif

  _MAKEFILE_WITH_RECIPES+=${_COOKIE.bootstrap-depends}
  ${_COOKIE.bootstrap-depends}: $(filter-out ${WRKDIR}/%,${MAKEFILE_LIST})
	${RUN}${MV} -f $@ $@.prev;					\
	${RM} -f ${_SYSBSDEPENDS_FILE} ${_BSDEPENDS_FILE}

  $(call require, ${_COOKIE.bootstrap-depends})
else
  $(call require, ${ROBOTPKG_DIR}/mk/depends/sysdep.mk)
  $(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)

  ${_COOKIE.bootstrap-depends}: real-bootstrap-depends;
endif

.PHONY: bootstrap-depends-cookie
bootstrap-depends-cookie: makedirs
	${RUN}${TEST} ! -f ${_COOKIE.bootstrap-depends} || ${FALSE};	\
	exec >>${_COOKIE.bootstrap-depends};				\
	${ECHO} "_COOKIE.bootstrap-depends.date:=`${_CDATE_CMD}`"


# --- real-bootstrap-depends (PRIVATE) -------------------------------------
#
# real-bootstrap-depends is a helper target onto which one can hook all of the
# targets that do the actual bootstrap dependency installation.
#
_REAL_BSDEPENDS_TARGETS+=	cbbh
_REAL_BSDEPENDS_TARGETS+=	makedirs
_REAL_BSDEPENDS_TARGETS+=	bootstrap-depends-message
_REAL_BSDEPENDS_TARGETS+=	pkg-bootstrap-depends
_REAL_BSDEPENDS_TARGETS+=	sys-bootstrap-depends
_REAL_BSDEPENDS_TARGETS+=	bootstrap-depends-cookie
ifneq (,$(filter bootstrap-depends,${MAKECMDGOALS}))
  _REAL_BSDEPENDS_TARGETS+=	bootstrap-depends-done-message
endif

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
