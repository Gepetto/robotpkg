# $LAAS: extract-vars.mk 2009/02/19 11:29:56 tho $
#
# Copyright (c) 2006-2009 LAAS/CNRS
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

MK_ROBOTPKG_EXTRACT:=	defined

ifndef MK_ROBOTPKG_FETCH
  include ${ROBOTPKG_DIR}/mk/fetch/fetch-vars.mk
endif

# The following variables may be set by the package Makefile and
# specify how extraction happens:
#
#    EXTRACT_ONLY is a list of distfiles relative to ${_DISTDIR} to
#	extract and defaults to ${DISTFILES}.
#
#    EXTRACT_SUFX is the suffix for the default distfile to be
#       extracted.  The default suffix is ".tar.gz".
#

EXTRACT_ONLY?=		${DISTFILES}
EXTRACT_SUFX?=		.tar.gz


# Discover which tools we need based on the file extensions of the
# distfiles.
#
#.if !empty(EXTRACT_ONLY:M*.tar) || \
#    !empty(EXTRACT_ONLY:M*.tar.*) || \
#    !empty(EXTRACT_ONLY:M*.tbz) || \
#    !empty(EXTRACT_ONLY:M*.tbz2) || \
#    !empty(EXTRACT_ONLY:M*.tgz) || \
#    !empty(EXTRACT_ONLY:M*-tar.gz) || \
#    !empty(EXTRACT_ONLY:M*_tar.gz)
#.  if !empty(EXTRACT_USING:Mgtar)
#USE_TOOLS+=	gtar
#.  elif !empty(EXTRACT_USING:Mnbtar)
#USE_TOOLS+=	tar
#.  else
#USE_TOOLS+=	pax
#.  endif
#.endif
#.if !empty(EXTRACT_ONLY:M*.cpio) || \
#    !empty(EXTRACT_ONLY:M*.cpio.bz2) || \
#    !empty(EXTRACT_ONLY:M*.cpio.gz)
#USE_TOOLS+=	pax
#.endif
#.if !empty(EXTRACT_ONLY:M*.bz2) || \
#    !empty(EXTRACT_ONLY:M*.tbz) || \
#    !empty(EXTRACT_ONLY:M*.tbz2)
#USE_TOOLS+=	bzcat
#.endif
ifneq (,$(filter %.zip,${EXTRACT_ONLY}))
  DEPEND_METHOD.unzip+=	bootstrap
  include ${ROBOTPKG_DIR}/mk/sysdep/unzip.mk
endif
#.if !empty(EXTRACT_ONLY:M*.lzh) || \
#    !empty(EXTRACT_ONLY:M*.lha)
#USE_TOOLS+=	lha
#.endif
#.if !empty(EXTRACT_ONLY:M*.gz) || \
#    !empty(EXTRACT_ONLY:M*.tgz) || \
#    !empty(EXTRACT_ONLY:M*.Z)
#USE_TOOLS+=	gzcat
#.endif
#.if !empty(EXTRACT_ONLY:M*.zoo)
#USE_TOOLS+=	unzoo
#.endif
#.if !empty(EXTRACT_ONLY:M*.rar)
#USE_TOOLS+=	unrar
#.endif
#.if !empty(EXTRACT_ONLY:M*.gem)
#USE_TOOLS+=	gem
#.endif

_COOKIE.extract=	${WRKDIR}/.extract_done
_COOKIE.checkout=	${WRKDIR}/.checkout_done

ifneq (,$(filter checkout,${MAKECMDGOALS}))
  _EXTRACT_IS_CHECKOUT:=yes
endif
ifeq (yes,$(call exists,${_COOKIE.checkout}))
  _EXTRACT_IS_CHECKOUT:=yes
endif

ifdef _EXTRACT_IS_CHECKOUT
  ifndef _CHECKOUT_PKGVERSION
    _CHECKOUT_PKGVERSION:=.checkout.$(shell ${_CDATE_CMD} "+%Y.%m.%d.%k.%M.%S")
    MAKEOVERRIDES+=_CHECKOUT_PKGVERSION=${_CHECKOUT_PKGVERSION}
  endif
  PKGNAME:=		${PKGNAME}${_CHECKOUT_PKGVERSION}

  _EXTRACT_TIMESTAMP_FILE:=	${_COOKIE.checkout}
else
  _EXTRACT_TIMESTAMP_FILE:=	${_COOKIE.extract}
endif

# The following are the "public" targets provided by this module:
#
#    extract, checkout
#
# The following targets may be overridden in a package Makefile:
#
#    pre-extract, do-extract, post-extract
#    pre-checkout, do-checkout, post-checkout
#

# --- extract (PUBLIC) -----------------------------------------------
#
# extract is a public target to perform extraction.
#
.PHONY: extract
ifndef NO_EXTRACT
  include ${ROBOTPKG_DIR}/mk/extract/extract.mk
else
  ifeq (yes,$(call exists,${_COOKIE.extract}))
extract:
	@${DO_NADA}
  else
    ifdef _PKGSRC_BARRIER
extract: tools extract-cookie
    else
extract: barrier
    endif
  endif
endif


# --- checkout (PUBLIC) ----------------------------------------------
#
# checkout is a public target to perform repository checkout.
#
.PHONY: checkout
ifdef MASTER_REPOSITORY
  include ${ROBOTPKG_DIR}/mk/extract/checkout.mk
else
checkout:
	@${ECHO} This package does not define any repository for checkout.
	@${FALSE}
endif


# --- extract-cookie (PRIVATE) ---------------------------------------------
#
# extract-cookie creates the "extract" cookie file. The contents are the name
# of the package.
#
.PHONY: extract-cookie
extract-cookie:
	${RUN}${TEST} ! -f ${_COOKIE.extract} || ${FALSE}
	${RUN}${MKDIR} $(dir ${_COOKIE.extract})
	${RUN}${ECHO} ${PKGNAME} > ${_COOKIE.extract}


# --- checkout-cookie (PRIVATE) --------------------------------------------
#
# checkout-cookie creates the "checkout" cookie file. The contents are the name
# of the package.
#
.PHONY: checkout-cookie
checkout-cookie:
	${RUN}${TEST} ! -f ${_COOKIE.checkout} || ${FALSE}
	${RUN}${MKDIR} $(dir ${_COOKIE.checkout})
	${RUN}${ECHO} ${PKGBASE} > ${_COOKIE.checkout}
