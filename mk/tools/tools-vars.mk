# $LAAS: tools-vars.mk 2009/02/16 16:57:18 tho $
#
# Copyright (c) 2006-2009 LAAS/CNRS
# Copyright (c) 2005, 2006 The NetBSD Foundation, Inc.
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
#   3. All advertising materials mentioning features or use of this
#      software must display the following acknowledgement:
#        This product includes software developed by the NetBSD
#        Foundation, Inc. and its contributors.
#   4. Neither  the name  of The NetBSD  Foundation nor the  names of its
#      contributors may be  used to endorse  or promote  products derived
#      from this software without specific prior written permission.
#
# THIS  SOFTWARE IS  PROVIDED BY  THE  COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND  ANY  EXPRESS OR  IMPLIED  WARRANTIES,  INCLUDING,  BUT NOT
# LIMITED TO, THE IMPLIED  WARRANTIES  OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR  PURPOSE ARE  DISCLAIMED. IN  NO EVENT SHALL THE COPYRIGHT
# HOLDERS  OR      CONTRIBUTORS  BE LIABLE FOR   ANY    DIRECT, INDIRECT,
# INCIDENTAL,  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF  SUBSTITUTE  GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR  BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY  OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR
# TORT (INCLUDING NEGLIGENCE  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE   OF THIS SOFTWARE,  EVEN   IF ADVISED OF   THE POSSIBILITY OF SUCH
# DAMAGE.
#
# From $NetBSD: bsd.tools.mk,v 1.45 2006/07/25 18:04:25 jlam Exp $
#
#                                       Anthony Mallet on Thu Nov 30 2006
#

# This Makefile fragment is included to robotpkg.mk and defines the
# relevant variables and targets for the "tools" phase.
#
# The following are the "public" targets provided by this module:
#
#    tools
#

# Prepend ${TOOLS_DIR}/bin to the PATH so that our scripts are found
# first when searching for executables.
#
TOOLS_DIR=	${WRKDIR}/.tools
PREPEND_PATH+=	${TOOLS_DIR}/bin

TOOLS_SHELL?=		${SH}
_TOOLS_WRAP_LOG=	${WRKLOG}

USE_TOOLS?=		# empty

_COOKIE.tools=	${WRKDIR}/.tools_done


# --- tools (PUBLIC) -------------------------------------------------

# tools is a public target to create a private directory of tools
# specified by USE_TOOLS.
#
_TOOLS_TARGETS+=	acquire-tools-lock
_TOOLS_TARGETS+=	${_COOKIE.tools}
_TOOLS_TARGETS+=	release-tools-lock

.PHONY: tools
ifeq (yes,$(call exists,${_COOKIE.tools}))
tools:
	@${DO_NADA}
else
  ifdef _PKGSRC_BARRIER
tools: ${_TOOLS_TARGETS}
  else
tools: barrier
  endif
endif

.PHONY: acquire-tools-lock release-tools-lock
acquire-tools-lock: acquire-lock
release-tools-lock: release-lock

ifeq (yes,$(call exists,${_COOKIE.tools}))
${_COOKIE.tools}:;
else
${_COOKIE.tools}: real-tools;
endif


# --- real-tools (PRIVATE) -------------------------------------------

# real-tools is a helper target onto which one can hook all of the
# targets that do the actual tool creation.
#
_REAL_TOOLS_TARGETS+=	tools-message
#_REAL_TOOLS_TARGETS+=	tools-vars
_REAL_TOOLS_TARGETS+=	override-tools
_REAL_TOOLS_TARGETS+=	post-tools
_REAL_TOOLS_TARGETS+=	tools-cookie
#_REAL_TOOLS_TARGETS+=	error-check

.PHONY: real-tools
real-tools: ${_REAL_TOOLS_TARGETS}

.PHONY: tools-message
tools-message:
	@${PHASE_MSG} "Overriding tools for ${PKGNAME}"

# --- tools-cookie (PRIVATE) -----------------------------------------
#
# tools-cookie creates the "tools" cookie file.  The contents
# are the names of the tools in USE_TOOLS.
#
.PHONY: tools-cookie
tools-cookie:
	${_PKG_SILENT}${_PKG_DEBUG}${TEST} ! -f ${_COOKIE.tools} || ${FALSE}
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} $(dir ${_COOKIE.tools})
	${_PKG_SILENT}${_PKG_DEBUG}${ECHO} ${USE_TOOLS} > ${_COOKIE.tools}


# --- override-tools (PRIVATE) ---------------------------------------

# override-tools is a helper target onto which one can hook all of
# the targets that create tools so they are generated at the proper
# time.
#
.PHONY: override-tools
override-tools:
	@${DO_NADA}


# --- post-tools (PUBLIC, override) ----------------------------------

# post-tools may be overridden within a package Makefile and can be
# used to directly modify the contents of the tools directory after
# the tools are generated.
#
.PHONY: post-tools
post-tools:

include ${ROBOTPKG_DIR}/mk/tools/digest.mk
#.include "${ROBOTPKG_DIR}/mk/tools/automake.mk"
#.include "${ROBOTPKG_DIR}/mk/tools/autoconf.mk"
#.include "${ROBOTPKG_DIR}/mk/tools/texinfo.mk"
#.include "${ROBOTPKG_DIR}/mk/tools/gettext.mk"
#.include "${ROBOTPKG_DIR}/mk/tools/intltool.mk"
#.include "${ROBOTPKG_DIR}/mk/tools/ldconfig.mk"
#.include "${ROBOTPKG_DIR}/mk/tools/rpcgen.mk"
#.include "${ROBOTPKG_DIR}/mk/tools/strip.mk"
#.include "${ROBOTPKG_DIR}/mk/tools/imake.mk"
#.include "${ROBOTPKG_DIR}/mk/tools/replace.mk"
#.include "${ROBOTPKG_DIR}/mk/tools/perl.mk"
include ${ROBOTPKG_DIR}/mk/tools/python.mk
#.include "${ROBOTPKG_DIR}/mk/tools/pkg-config.mk"
include ${ROBOTPKG_DIR}/mk/tools/make.mk
#
#.include "${ROBOTPKG_DIR}/mk/tools/create.mk"
