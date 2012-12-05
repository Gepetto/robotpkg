#
# Copyright (c) 2006-2012 LAAS/CNRS
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

EXTRACT_ONLY?=		${DISTFILES}
EXTRACT_SUFX?=		.tar.gz

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
  PKGREVISION:=$(strip ${PKGREVISION})0${CHECKOUT_PKGVERSION}
endif

# The filter for the default do-extract action
EXTRACT_LOGFILE?=	${WRKDIR}/extract.log
EXTRACT_LOGFILTER?=\
	${_LOGFILTER} ${_LOGFILTER_FLAGS} -l ${EXTRACT_LOGFILE}	--

# For DISTFILES definition
$(call require,${ROBOTPKG_DIR}/mk/fetch/fetch-vars.mk)

# Discover which tools we need based on the file extensions of the
# distfiles.
#
ifneq (,$(filter %.tar %.tar.gz %.tar.bz2 %.tgz %.tbz2,${EXTRACT_ONLY}))
  DEPEND_METHOD.pax+=	bootstrap
  include ${ROBOTPKG_DIR}/pkgtools/pax/depend.mk
endif
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
ifneq (,$(filter %.deb,${EXTRACT_ONLY}))
  EXTRACT_ENV+=		DPKG=$(call quote,${DPKG})
  DEPEND_METHOD.dpkg+=	bootstrap
  include ${ROBOTPKG_DIR}/mk/sysdep/dpkg.mk
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
    $(call require, ${ROBOTPKG_DIR}/mk/checksum/checksum-vars.mk)

    extract: $(call add-barrier, bootstrap-depends, extract)
    extract: checksum extract-cookie;
  endif
endif


# --- checkout (PUBLIC) ----------------------------------------------
#
# checkout is a public target to perform repository checkout.
#
.PHONY: checkout
ifdef _MASTER_REPOSITORY
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
extract-cookie: makedirs
	${RUN}${TEST} ! -f ${_COOKIE.extract} || ${FALSE};		\
	exec >>${_COOKIE.extract};					\
	${ECHO} "_COOKIE.extract.date:=`${_CDATE_CMD}`";		\
	${ECHO} "_COOKIE.extract.files:=${EXTRACT_ONLY}"


# --- checkout-cookie (PRIVATE) --------------------------------------------
#
# checkout-cookie creates the "checkout" cookie file. The contents are the name
# of the package.
#
.PHONY: checkout-cookie
checkout-cookie: makedirs
	${RUN}${TEST} ! -f ${_COOKIE.checkout} || ${FALSE};		\
	exec >>${_COOKIE.checkout};					\
	${ECHO} "_COOKIE.checkout.date:=`${_CDATE_CMD}`"
