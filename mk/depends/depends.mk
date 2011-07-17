#
# Copyright (c) 2006-2007,2009,2011 LAAS/CNRS
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
#   3. All advertising  materials mentioning    features  or use of  this
#      software  must  display the  following acknowledgement:
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
# From $NetBSD: depends.mk,v 1.10 2006/07/07 21:24:28 jlam Exp $
#
#                                       Anthony Mallet on Thu Nov 30 2006
#


# --- depends (PUBLIC) -----------------------------------------------
#
# depends is a public target to install missing dependencies for
# the package.
#
_DEPENDS_TARGETS+=	cbbh
_DEPENDS_TARGETS+=	$(call add-barrier, bootstrap-depends, depends)
_DEPENDS_TARGETS+=	acquire-depends-lock
_DEPENDS_TARGETS+=	${_COOKIE.depends}
_DEPENDS_TARGETS+=	release-depends-lock

depends: ${_DEPENDS_TARGETS};


.PHONY: acquire-depends-lock release-depends-lock
acquire-depends-lock: acquire-lock
release-depends-lock: release-lock


# --- ${_COOKIE.depends} ---------------------------------------------------
#
# ${_COOKIE.depends} creates the "depends" cookie file.
# When the cookie exists, data gathered by prefixsearch.sh gets included.
# The cookie itself is included to trigger gmake's restart when the cookie is
# outdated.
#
ifeq (yes,$(call exists,${_COOKIE.depends}))
  ifneq (,$(filter depends,${MAKECMDGOALS}))
    ${_COOKIE.depends}: .FORCE
  endif

  _MAKEFILE_WITH_RECIPES+=${_COOKIE.depends}
  ${_COOKIE.depends}: $(filter-out ${WRKDIR}/%,${MAKEFILE_LIST})
  ${_COOKIE.depends}: ${_COOKIE.bootstrap-depends}
	${RUN}${TEST} ! -f $@ || ${MV} -f $@ $@.prev;			\
	${RM} -f ${_SYSDEPENDS_FILE} ${_DEPENDS_FILE}

  $(call require, ${_COOKIE.depends})
else
  $(call require, ${ROBOTPKG_DIR}/mk/depends/sysdep.mk)
  $(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)

  ifeq (yes,$(call exists,${_COOKIE.bootstrap-depends}))
    # The goal here is to check if the 'bootstrap' cookie, while already
    # present, needs an update and we thus want to defer 'depends' a bit
    # more. The trick is to check if the 'bootstrap' cookie was deleted by its
    # own rule (meaning that it was outdated). If so, we just raise an error
    # ($TEST below) that makes the 'depends' cookie target fail early. Since
    # 'make' is about to restart anyway, bootstrap-depends will re-run and we
    # will eventually end up in here again (after a restart in the 'if' branch
    # above). This works only because errors are not fatal to 'make' while
    # rebuilding makefiles... (but note this is just to handle correctly a rare
    # situation, though).
    ${_COOKIE.depends}: maybe-defer-depends real-depends;

    .PHONY: maybe-defer-depends
    maybe-defer-depends: ${_COOKIE.bootstrap-depends}
	@${TEST} -f $<
  else
    # This defers the depends target until bootstrap-depends has completed and
    # make has restarted with those dependencies resolved.
    ${_COOKIE.depends}:;
  endif
endif


# --- depends-cookie (PRIVATE) ---------------------------------------------
#
# depends-cookie creates the "depends" cookie file.
#
.PHONY: depends-cookie
depends-cookie: makedirs
	${RUN}${TEST} ! -f ${_COOKIE.depends} || ${FALSE};		\
	exec >>${_COOKIE.depends};					\
	${ECHO} "_COOKIE.depends.date:=`${_CDATE_CMD}`"


# --- real-depends (PRIVATE) -----------------------------------------
#
# real-depends is a helper target onto which one can hook all of the
# targets that do the actual dependency installation.
#
_REAL_DEPENDS_TARGETS+=	pre-depends-hook
_REAL_DEPENDS_TARGETS+=	depends-message
_REAL_DEPENDS_TARGETS+= sys-depends
_REAL_DEPENDS_TARGETS+=	pkg-depends-build-options
_REAL_DEPENDS_TARGETS+=	pkg-depends-install
_REAL_DEPENDS_TARGETS+=	pkg-depends-file
_REAL_DEPENDS_TARGETS+= pkg-sys-conflicts
_REAL_DEPENDS_TARGETS+= depends-conflicts
_REAL_DEPENDS_TARGETS+=	depends-cookie
ifneq (,$(filter depends,${MAKECMDGOALS}))
  _REAL_DEPENDS_TARGETS+=	depends-done-message
endif

.PHONY: real-depends
real-depends: ${_REAL_DEPENDS_TARGETS}

.PHONY: depends-message
depends-message:
	@if ${TEST} -f "${_COOKIE.depends}.prev"; then			\
	  ${PHASE_MSG} "Rechecking dependencies for ${PKGNAME}";	\
	else								\
	  ${PHASE_MSG} "Checking dependencies for ${PKGNAME}";		\
	fi


# --- pre-depends-hook (PRIVATE, override, hook) ---------------------
#
# pre-depends-hook is a generic hook target that is run just before
# dependencies are installed for depends-install.
#
.PHONY: pre-depends-hook
pre-depends-hook:


# --- depends-conflicts (PRIVATE) ------------------------------------------
#
# Detects multiple installations of a dependency in the list of prefixes used
# by the package, and warn about potential conflicts.
#
# The list of prefixes is obtained from the SYSDEP_FILE et al. As a gross
# heuristic, only prefixes that refer to a SYSTEM_SEARCH.pkg mentioning an
# 'include' or 'lib' directory are considered (this filters out tools like pax,
# pkg-config etc. that have no header or libraries and which will not generate
# any conflicts even if they are found in multiple locations). Along the same
# lines, only dependencies that refer to a SYSTEM_SEARCH.pkg containing
# 'include' or 'lib' are considered.
#
.PHONY: depends-conflicts
depends-conflicts:
	${RUN}depf=;							\
	for f in ${_SYSBSDEPENDS_FILE} ${_SYSDEPENDS_FILE}		\
		 ${_BSDEPENDS_FILE} ${_DEPENDS_FILE}; do		\
	  ${TEST} -r $$f && depf="$$depf $$f";				\
	done;								\
	${TEST} -z "$$depf" && exit 0;					\
	conflicts=;							\
	altpfix=`{ ${ECHO} $(abspath ${PREFIX});			\
	  ${SED} -n -e '/PREFIX.*:=/{s///;h;}'				\
		 -e '/SYSTEM_FILES.*include/{g;p;}'			\
		 -e '/SYSTEM_FILES.*lib/{g;p;}' $$depf;} | ${SORT} -u`;	\
$(foreach _pkg_,${DEPEND_USE},						\
  $(if $(filter include/% lib/%,${SYSTEM_SEARCH.${_pkg_}}),		\
	pfix=`${SED} -n -e '/PREFIX.${_pkg_}:=/{s///p;q;}' $$depf`;	\
	vers=`${SED} -n -e '/PKGVERSION.${_pkg_}:=/{s///p;q;}' $$depf`;	\
	for p in $$altpfix; do						\
	  ${TEST} "$$p" -ef "$$pfix" && continue;			\
	  m=`${_PREFIXSEARCH_CMD} 2>/dev/null 3>&2			\
		-p "$$p" $(call quote,${_pkg_}) $(call quote,${_pkg_})	\
		${SYSTEM_SEARCH.${_pkg_}}` || m=;			\
	  if ${TEST} -n "$$m"; then					\
	    conflicts=$$conflicts" $$m $$p";				\
	    ${WARNING_MSG} "Using $$vers in $$pfix";			\
	  fi;								\
	done;								\
))									\
	if ${TEST} -n "$$conflicts"; then				\
	  ${WARNING_MSG} "The following packages may"			\
		"interfere with the build because they";		\
	  ${WARNING_MSG} "are located in paths used by other"		\
		"dependencies:";					\
	  set -- $$conflicts; while ${TEST} $$# -gt 0; do		\
	    ${WARNING_MSG} "	$$1 in $$2"; shift 2;			\
	  done;								\
	fi
