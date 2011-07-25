#
# Copyright (c) 2006-2007,2009,2011 LAAS/CNRS
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


# --- package (PUBLIC) -----------------------------------------------
#
# package is a public target to generate a binary package.
#
$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)

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


# --- real-package (PRIVATE) -----------------------------------------
#
# real-package is a helper target onto which one can hook all of the
# targets that do the actual packaging of the built objects.
#
_REAL_PACKAGE_TARGETS+=	pkg-check-installed
_REAL_PACKAGE_TARGETS+=	package-message
_REAL_PACKAGE_TARGETS+=	pre-package
_REAL_PACKAGE_TARGETS+=	pkg-tarup
_REAL_PACKAGE_TARGETS+=	pkg-links
_REAL_PACKAGE_TARGETS+=	post-package
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
	${WARNING_MSG} "$$found may not be publicly available:";
	${WARNING_MSG} $(call quote,${NO_PUBLIC_BIN})
endif
