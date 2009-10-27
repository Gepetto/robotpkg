# $LAAS: depends.mk 2009/10/27 16:10:26 mallet $
#
# Copyright (c) 2006-2007,2009 LAAS/CNRS
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
_DEPENDS_TARGETS+=	acquire-depends-lock
_DEPENDS_TARGETS+=	${_COOKIE.depends}
_DEPENDS_TARGETS+=	release-depends-lock

depends: ${_DEPENDS_TARGETS}

.PHONY: acquire-depends-lock release-depends-lock
acquire-depends-lock: acquire-lock
release-depends-lock: release-lock

ifeq (yes,$(call exists,${_COOKIE.depends}))
  ${_COOKIE.depends}:
	@${DO_NADA}
else
  $(call require, ${ROBOTPKG_DIR}/mk/depends/sysdep.mk)
  $(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)

  ${_COOKIE.depends}: real-depends;
endif


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
_REAL_DEPENDS_TARGETS+=	pkg-depends-cookie

.PHONY: real-depends
real-depends: ${_REAL_DEPENDS_TARGETS}

.PHONY: depends-message
depends-message:
	@${PHASE_MSG} "Checking dependencies for ${PKGNAME}"


# --- pre-depends-hook (PRIVATE, override, hook) ---------------------
#
# pre-depends-hook is a generic hook target that is run just before
# dependencies are installed for depends-install.
#
.PHONY: pre-depends-hook
pre-depends-hook:
