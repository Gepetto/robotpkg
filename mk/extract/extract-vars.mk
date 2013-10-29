#
# Copyright (c) 2006-2013 LAAS/CNRS
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
# THIS SOFTWARE IS PROVIDED BY THE  AUTHOR AND CONTRIBUTORS ``AS IS'' AND
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
# From $NetBSD: bsd.extract-vars.mk,v 1.6 2006/10/15 01:56:06 minskim Exp $
#
#					Anthony Mallet on Fri Dec  1 2006
#

# The following variables may be set by the package Makefile and
# specify how extraction happens:
#
#    EXTRACT_ONLY is a list of distfiles relative to ${_DISTDIR} to
#	extract and defaults to ${DISTFILES}.
#
#    EXTRACT_SUFX is the suffix for the default distfile to be
#       extracted.  The default suffix is ".tar.gz".
#
$(call require,${ROBOTPKG_DIR}/mk/fetch/fetch-vars.mk)

EXTRACT_ONLY?=		${FETCH_ONLY}
EXTRACT_SUFX?=		.tar.gz
EXTRACT_DIR?=		${WRKDIR}

_COOKIE.extract=	${WRKDIR}/.extract_cookie
_COOKIE.checkout=	${WRKDIR}/.checkout_cookie


# let users override the MASTER_REPOSITORY defined in a package
ifdef REPOSITORY.${PKGBASE}
  _MASTER_REPOSITORY=${REPOSITORY.${PKGBASE}}
else ifdef MASTER_REPOSITORY
  _MASTER_REPOSITORY=${MASTER_REPOSITORY}
endif

# let users define specific checkout options
ifdef CHECKOUT_VCS_OPTS.${PKGBASE}
  CHECKOUT_VCS_OPTS+=	${CHECKOUT_VCS_OPTS.${PKGBASE}}
endif

# let users override the CHECKOUT version
ifdef CHECKOUT.${PKGBASE}
  _CHECKOUT=${CHECKOUT.${PKGBASE}}
else ifdef CHECKOUT
  _CHECKOUT=${CHECKOUT}
endif

# test for checkouts
ifneq (,$(filter checkout,${MAKECMDGOALS}))
  _EXTRACT_IS_CHECKOUT:=yes
endif
ifeq (yes,$(call exists,${_COOKIE.checkout}))
  _EXTRACT_IS_CHECKOUT:=yes
endif

# redefine package name for checkouts
ifdef _EXTRACT_IS_CHECKOUT
  CHECKOUT_PKGVERSION:=${_ROBOTPKG_NOW}
  BUILD_DEFS+=CHECKOUT_PKGVERSION
endif

# The filter for the default do-extract action
EXTRACT_LOGFILE?=	${WRKDIR}/extract.log
EXTRACT_LOGFILTER?=	${_LOGFILTER} ${_LOGFILTER_FLAGS} -l ${EXTRACT_LOGFILE}
