#
# Copyright (c) 2006-2011 LAAS/CNRS
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
# From $NetBSD: flavor-vars.mk,v 1.2 2006/10/06 14:51:36 joerg Exp $
#
#                                       Anthony Mallet on Thu Dec  7 2006
#

# This Makefile fragment defines variables related to the robotpkg_*
# administrative tools, which must be defined early.

# It is not possible to rely on the generic dependency facility, because even
# the bootstrap dependencies use the robotpkg_* tools. Still include the
# regular depend.mk, so that an upgrade of pkg_install can be triggered as for
# other packages. No dependency is added if NO_PKGTOOLS_REQD_CHECK is defined
# (currently only pkg_install itself).
#
include ${ROBOTPKG_DIR}/pkgtools/pkg_install/depend.mk

PKG_ADD_CMD?=		${PREFIX.pkg_install}/sbin/robotpkg_add
PKG_ADMIN_CMD?=		${PREFIX.pkg_install}/sbin/robotpkg_admin
PKG_CREATE_CMD?=	${PREFIX.pkg_install}/sbin/robotpkg_create
PKG_DELETE_CMD?=	${PREFIX.pkg_install}/sbin/robotpkg_delete
PKG_INFO_CMD?=		${PREFIX.pkg_install}/sbin/robotpkg_info


# Make sure robotpkg_info works. If it does not, strange errors will popup:
# better avoid this.
#
ifndef PKGTOOLS_VERSION
  export PKGTOOLS_VERSION:=$(shell ${PKG_INFO_CMD} -V 2>/dev/null || echo -1)
  _ENV_VARS+=PKGTOOLS_VERSION
endif
ifeq (-1,${PKGTOOLS_VERSION})
  $(shell ${ERROR_MSG} ${hline})
  $(shell ${ERROR_MSG} "The robotpkg_info tool is not working:")
  $(shell ${PKG_INFO_CMD} -V 2>&1 | ${ERROR_CAT})
  $(shell ${ERROR_MSG})
  $(shell ${ERROR_MSG} You may have to (re)run the robotpkg/bootstrap/bootstrap)
  $(shell ${ERROR_MSG} script in order to fix this problem.)
  $(shell ${ERROR_MSG} ${hline})
  $(error Fatal error)
endif

# This is the default package database directory
PKG_DBDIR?=	${LOCALBASE}/var/db/robotpkg

_PKG_DBDIR=	${PKG_DBDIR}
PKGTOOLS_ARGS?=	-K ${_PKG_DBDIR}

PKG_ADD?=	${SETENV} ${PKGTOOLS_ENV} ${PKG_ADD_CMD} ${PKGTOOLS_ARGS}
PKG_ADMIN?=	${SETENV} ${PKGTOOLS_ENV} ${PKG_ADMIN_CMD} ${PKGTOOLS_ARGS}
PKG_CREATE?=	${SETENV} ${PKGTOOLS_ENV} ${PKG_CREATE_CMD} ${PKGTOOLS_ARGS}
PKG_DELETE?=	${SETENV} ${PKGTOOLS_ENV} ${PKG_DELETE_CMD} ${PKGTOOLS_ARGS}
PKG_INFO?=	${SETENV} ${PKGTOOLS_ENV} ${PKG_INFO_CMD} ${PKGTOOLS_ARGS}

# "${_PKG_BEST_EXISTS} pkgpattern" prints out the name of the installed
# package that best matches pkgpattern.  Use this instead of
# "${PKG_INFO} -e pkgpattern" if the latter would return more than one
# package name.
#
_PKG_BEST_EXISTS?=	${PKG_INFO} -E


# Metadata filenames
_BUILD_INFO_FILE=	+BUILD_INFO
_BUILD_VERSION_FILE=	+BUILD_VERSION
_COMMENT_FILE=		+COMMENT
_DESCR_FILE=		+DESC
_MESSAGE_FILE=		+DISPLAY
_PRESERVE_FILE=		+PRESERVE
_SIZE_ALL_FILE=		+SIZE_ALL
_SIZE_PKG_FILE=		+SIZE_PKG
_CONTENTS_FILE=		+CONTENTS


# Return $1 only if PKGNAME is not installed or should be updated. If package
# is up-to-date and safe, return $2
#
_COOKIE.outdated=		${WRKDIR}/.outdated

override define if-outdated-pkg
$(eval -include ${_COOKIE.outdated})$(if ${_OUTDATED.${PKGPATH}},$1,$2)
endef

include ${ROBOTPKG_DIR}/mk/pkg/depends.mk
include ${ROBOTPKG_DIR}/mk/pkg/metadata.mk
include ${ROBOTPKG_DIR}/mk/pkg/install.mk
include ${ROBOTPKG_DIR}/mk/pkg/deinstall.mk
include ${ROBOTPKG_DIR}/mk/pkg/replace.mk
include ${ROBOTPKG_DIR}/mk/pkg/package.mk
