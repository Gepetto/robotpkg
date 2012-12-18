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
# From $NetBSD: bsd.install-vars.mk,v 1.4 2006/11/04 07:42:51 rillig Exp $
#
#					Anthony Mallet on Mon Nov 27 2006
#

# This Makefile fragment is included separately by bsd.pkg.mk and
# defines some variables which must be defined earlier than where
# bsd.install.mk is included.
#
# Package-settable variables:
#
# INSTALLATION_DIRS_FROM_PLIST
#	If set to "yes", the static PLIST files of the package will
#	be used to determine which directories need to be created before
#	the "real" installation should start.
#

INSTALLATION_DIRS_FROM_PLIST?=	yes

INSTALL_LOGFILE?=	${WRKDIR}/install.log
INSTALL_LOGFILTER?=\
	${_LOGFILTER} ${_LOGFILTER_FLAGS} -l ${INSTALL_LOGFILE}		\
		$(if ${INSTALL_LOG_ETA},-a ${INSTALL_LOG_ETA})		\
		--

_COOKIE.install=	${WRKDIR}/.install_cookie
_COOKIE.preinstall=	${WRKDIR}/.install_start


# --- install (PUBLIC) -----------------------------------------------
#
# install is a public target to install the package.
#
include ${ROBOTPKG_DIR}/mk/install/install.mk
include ${ROBOTPKG_DIR}/mk/install/deinstall.mk
include ${ROBOTPKG_DIR}/mk/install/replace.mk


# --- install-clean (PRIVATE) ----------------------------------------
#
# install-clean removes the state files for the "install" and
# later phases so that the "install" target may be re-invoked.
#
install-clean:
	${RUN}${RM} -f ${PLIST} ${_COOKIE.install}


# --- install-cookie (PRIVATE) ---------------------------------------------
#
# install-cookie creates the "install" cookie file.
#
.PHONY: install-cookie
install-cookie:
	${RUN}${TEST} ! -f ${_COOKIE.install} || ${FALSE};	\
	exec >>${_COOKIE.install};				\
	${ECHO} "_COOKIE.install.date:=`${_CDATE_CMD}`"
