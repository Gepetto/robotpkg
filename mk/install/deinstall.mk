#
# Copyright (c) 2006-2009,2011 LAAS/CNRS
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
# From $NetBSD: deinstall.mk,v 1.7 2006/11/03 08:04:06 joerg Exp $
#

# DEINSTALLDEPENDS controls whether dependencies and dependents are also
# removed when a package is de-installed.  The valid values are:
#
#    no		only the package is removed (if dependencies allow it)
#    yes	dependent packages are also removed
#    all	dependent packages and unused dependencies are also removed
#
DEINSTALLDEPENDS?=	no

$(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)


# --- deinstall, su-deinstall (PUBLIC) -------------------------------
#
# deinstall is a public target to remove an installed package.
#
_DEINSTALL_TARGETS+=	deinstall-message
_DEINSTALL_TARGETS+=	acquire-deinstall-lock
_DEINSTALL_TARGETS+=	pkg-deinstall
_DEINSTALL_TARGETS+=	release-deinstall-lock
_DEINSTALL_TARGETS+=	install-clean

.PHONY: deinstall
ifneq (,$(call isyes,${MAKE_SUDO_INSTALL}))
  _SU_TARGETS+=	deinstall
  MAKEFLAGS.su-deinstall+= DEINSTALLDEPENDS=${DEINSTALLDEPENDS}
  deinstall: su-target-deinstall
  su-deinstall: ${_DEINSTALL_TARGETS}
else
  deinstall: ${_DEINSTALL_TARGETS}
endif


.PHONY: acquire-deinstall-lock release-deinstall-lock
acquire-deinstall-lock: acquire-localbase-lock
release-deinstall-lock: release-localbase-lock


.PHONY: deinstall-message
deinstall-message:
	@${PHASE_MSG} "Deinstalling for ${PKGBASE}"


# --- reinstall (PUBLIC) ---------------------------------------------
#
# reinstall is a special target to re-run the install target.
#
.PHONY: reinstall
reinstall: install-clean
	${RUN}${RECURSIVE_MAKE} install $(filter confirm,${MAKECMDGOALS})
