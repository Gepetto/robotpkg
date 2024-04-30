#
# Copyright (c) 2006-2007,2009,2011,2013,2016-2018,2024 LAAS/CNRS
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
# From $NetBSD: package.mk,v 1.18 2006/10/09 12:25:44 joerg Exp $
#
#                                      Anthony Mallet on Mon Dec  4 2006
#

$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)
$(call require, ${ROBOTPKG_DIR}/mk/pkg/package.mk)


# --- package (PUBLIC) -----------------------------------------------
#
# package is a public target to generate a binary package.
#

_PACKAGE_TARGETS+=	$(call add-barrier,bootstrap-depends,package tarup)
_PACKAGE_TARGETS+=	acquire-package-lock
_PACKAGE_TARGETS+=	real-package
_PACKAGE_TARGETS+=	release-package-lock

.PHONY: package tarup
package tarup: ${_PACKAGE_TARGETS};

.PHONY: pre-package post-package
pre-package:
post-package:


.PHONY: acquire-package-lock release-package-lock
acquire-package-lock: acquire-lock
release-package-lock: release-lock


# --- depackage (PUBLIC) ---------------------------------------------------
#
# package is a public target to remove published binary package files.
#

_DEPACKAGE_TARGETS+=	$(call add-barrier,bootstrap-depends,depackage)
_DEPACKAGE_TARGETS+=	acquire-package-lock
ifneq (,$(filter bsd deb,${PKG_FORMAT}))
  _DEPACKAGE_TARGETS+=	pkg-unlink
endif
ifneq (,$(filter deb,${PKG_FORMAT}))
  _DEPACKAGE_TARGETS+=	deb-package
endif
_DEPACKAGE_TARGETS+=	release-package-lock

.PHONY: depackage
depackage: ${_DEPACKAGE_TARGETS};


# --- real-package (PRIVATE) -----------------------------------------
#
# real-package is a helper target onto which one can hook all of the
# targets that do the actual packaging of the built objects.
#
_REAL_PACKAGE_TARGETS+=	pkg-check-installed
_REAL_PACKAGE_TARGETS+=	package-message
_REAL_PACKAGE_TARGETS+=	do-package-failsafe
_REAL_PACKAGE_TARGETS+=	package-failed
_REAL_PACKAGE_TARGETS+=	package-warnings

.PHONY: real-package
real-package: ${_REAL_PACKAGE_TARGETS}

.PHONY: package-message
package-message:
	@found=`${_PKG_BEST_EXISTS} ${PKGWILDCARD}`;			\
	${PHASE_MSG} "Building binary package for $$found"


# Displays warnings about the binary package.
.PHONY: package-warnings
package-warnings:
ifdef NO_PUBLIC_BIN
	@found=`${_PKG_BEST_EXISTS} ${PKGWILDCARD}`;			\
	${WARNING_MSG} "$$found may not be publicly available:";	\
	${WARNING_MSG} $(call quote,${NO_PUBLIC_BIN})
endif


# --- package-failsafe (PRIVATE) -------------------------------------------
#
# Invoke the packaging targets and unpublish files on error.
#
_PACKAGE_FAILSAFE_TARGETS+=	package-set-stale
_PACKAGE_FAILSAFE_TARGETS+=	pre-package
ifneq (,$(filter bsd deb,${PKG_FORMAT}))
  _PACKAGE_FAILSAFE_TARGETS+=	pkg-tarup
  _PACKAGE_FAILSAFE_TARGETS+=	pkg-links
  _PACKAGE_FAILSAFE_TARGETS+=	pkg-update-summary
endif
ifneq (,$(filter deb,${PKG_FORMAT}))
  _PACKAGE_FAILSAFE_TARGETS+=	deb-package
endif
_PACKAGE_FAILSAFE_TARGETS+=	post-package
_PACKAGE_FAILSAFE_TARGETS+=	package-unset-stale

.PHONY: package-failsafe
package-failsafe: ${_PACKAGE_FAILSAFE_TARGETS}

.PHONY: do-package-failsafe
do-package-failsafe:
	${RUN}${MAKE} package-failsafe || ${TRUE}

.PHONY: package-set-stale
package-set-stale:
	${RUN}								\
	${MKDIR} ${PKGREPOSITORY} ||					\
	  ${FAIL_MSG} "cannot create directory: ${PKGREPOSITORY}";	\
	>${_PKGFILE_STALE}

.PHONY: package-unset-stale
package-unset-stale:
	${RUN}${RM} -f ${_PKGFILE_STALE}

.PHONY: package-failed
package-failed:
	${RUN}${TEST} -f ${_PKGFILE_STALE} || exit 0;			\
	${MAKE} depackage;						\
	${RM} -f ${_PKGFILE_STALE};					\
	exit 2


# --- deb-package (PRIVATE) ------------------------------------------------
#
# deb-package generates a debian binary package (.deb)
#
ifneq (,$(filter deb,${PKG_FORMAT}))
  DEPEND_METHOD.pkgrepo2deb+=	bootstrap
  include ${ROBOTPKG_DIR}/pkgtools/pkgrepo2deb/depend.mk

  PKGREPO2DEB_ENV+=	PKG_PATH=$(call quote,${PKGREPOSITORY};${PKG_PATH})
  PKGREPO2DEB_ENV+=	ROBOTPKG_ADD=${PKG_ADD_CMD}
  PKGREPO2DEB_ENV+=	ROBOTPKG_ADMIN=${PKG_ADMIN_CMD}
  PKGREPO2DEB_ENV+=	TMPDIR=${WRKDIR}

  .PHONY: deb-package
  deb-package:
	${RUN} >${_PKG_LOG};						\
	${STEP_MSG} "Updating debian binary packages";			\
	pkgfile=`${_PKG_BEST_EXISTS} ${PKGWILDCARD}`;			\
	dirs=;								\
	dirs="$$dirs ${PKGPUBLICSUBDIR}";				\
$(foreach _,${PACKAGES_SUBDIRS},					\
	dirs="$$dirs $_";						\
)									\
	exitv=0;							\
	for d in $$dirs; do						\
	  ${TEST} -d ${DEB_PACKAGES}/$$d ||				\
	    ${MKDIR} ${DEB_PACKAGES}/$$d;				\
	  ${SETENV} ${PKGREPO2DEB_ENV}					\
	    ${PKGREPO2DEB} -r ${PKGREPOSITORY} -d ${DEB_PACKAGES}/$$d	\
	      ${PKGREPO2DEB_ARGS} ${PACKAGES}/$$d/$$pkgfile${PKG_SUFX}	\
	      2>>${_PKG_LOG} || exitv=$$?;				\
	done;								\
	if ${TEST} -s ${_PKG_LOG}; then					\
	  ${WARNING_CAT} <${_PKG_LOG};					\
	fi;								\
	exit $$exitv
endif
