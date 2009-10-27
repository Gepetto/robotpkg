# $LAAS: package-vars.mk 2009/10/27 18:21:35 mallet $
#
# Copyright (c) 2006-2009 LAAS/CNRS
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
#   3. All  advertising  materials  mentioning  features or  use of  this
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
# From $NetBSD: bsd.package.mk,v 1.9 2006/10/09 11:44:07 joerg Exp $
#
#                                       Anthony Mallet on Mon Dec  4 2006
#

# This Makefile fragment is included by robotpkg.mk and provides all
# variables and targets related to binary packages.
#
# The following are the "public" targets provided by this module:
#
#    package, repackage

_COOKIE.package=	${WRKDIR}/.package_done

# ---  package (PUBLIC) ----------------------------------------------
#
# package is a public target to generate a binary package.
#
.PHONY: package
ifndef NO_PACKAGE
  $(call require, ${ROBOTPKG_DIR}/mk/package/package.mk)
else
  ifeq (yes,$(call exists,${_COOKIE.package}))
    package:
	@${DO_NADA}
  else
    $(call require, ${ROBOTPKG_DIR}/mk/install/install-vars.mk)

    package: $(call barrier, depends, install)
      ifdef SKIP_SILENT
	@${DO_NADA}
      else
	@${PHASE_MSG} "${PKGNAME} may not be packaged: "${NO_PACKAGE}"."
      endif
  endif
endif


# --- repackage (PUBLIC) ---------------------------------------------
#
# repackage is a special target to re-run the package target.
#
.PHONY: repackage
repackage: package-clean package


# --- tarup (PUBLIC) -------------------------------------------------
#
# tarup is a public target to generate a binary package from an
# installed package instance.
#
$(call require-for, tarup, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)

.PHONY: tarup
tarup: pkg-tarup


# --- package-clean (PRIVATE) ----------------------------------------
#
# package-clean removes the state files associated with the "package"
# phase so that the "package" target may be re-invoked.
#
package-clean:
	${RUN}${RM} -f ${_COOKIE.package}
