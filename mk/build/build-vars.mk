#
# Copyright (c) 2006-2011,2013 LAAS/CNRS
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
# From $NetBSD: bsd.build-vars.mk,v 1.3 2006/09/09 02:35:13 obache Exp $
#
#					Anthony Mallet on Sat Dec  2 2006
#

#
# BUILD_DIRS is the list of directories in which to perform the build
#	process.  If the directories are relative paths, then they
#	are assumed to be relative to ${WRKSRC}.
#
# MAKE_PROGRAM is the path to the make executable that is run to
#	process the source makefiles.  This is always overridden by
#	the tools framework in pkgsrc/mk/tools/make.mk, but we provide
#	a default here for documentation purposes.
#
# MAKE_ENV is the shell environment that is exported to the make
#	process.
#
# MAKE_FLAGS is a list of arguments that is pass to the make process.
#
# MAKE_FILE is the path to the makefile that is processed by the make
#	executable.  If the path is relative, then it is assumed to
#	be relative to each directory listed in BUILD_DIRS.
#

$(call require, ${ROBOTPKG_DIR}/mk/configure/configure-vars.mk)

# Supported build tools (in mk/build/<tool>.mk)
# Use gmake by default.
#
BUILD_TOOLS=	gmake

BUILD_TOOL=\
  $(basename $(notdir \
    $(filter $(addprefix %/build/,${BUILD_TOOLS:=.mk}),${MAKEFILE_LIST})))

ifeq (0,$(words ${BUILD_TOOL}))
  $(call require, ${ROBOTPKG_DIR}/mk/build/gmake.mk)
else ifneq (1,$(words ${BUILD_TOOL}))
  PKG_FAIL_REASON+= "Multiple build tools defined: ${BUILD_TOOL}"
endif


# Build variables
#
BUILD_DIRS?=	${CONFIGURE_DIRS}
BUILD_TARGET?=
$(foreach _,${BUILD_DIRS},$(eval BUILD_TARGET.$_?= ${BUILD_TARGET}))

MAKE_PROGRAM?=	${FALSE}
MAKE_ENV?=	# empty
MAKE_FLAGS?=	# empty
MAKE_FILE?=	/dev/null

MAKE_ENV+=	${ALL_ENV}
MAKE_ENV+=	LOCALBASE=${LOCALBASE}
MAKE_ENV+=	PKGMANDIR=${PKGMANDIR}

BUILD_MAKE_FLAGS?=
BUILD_MAKE_CMD?=\
  ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} ${MAKE_FLAGS}		\
    ${BUILD_MAKE_FLAGS} -f ${MAKE_FILE} ${BUILD_TARGET.$1}


# The filter for the {pre,post,}-build targets
#
BUILD_LOGFILE?=	${WRKDIR}/build.log
BUILD_LOGFILTER?=\
	${_LOGFILTER} ${_LOGFILTER_FLAGS} -l ${BUILD_LOGFILE}


# The build cookie
#
_COOKIE.build=  ${WRKDIR}/.build_cookie
