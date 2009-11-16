# $LAAS: build-vars.mk 2009/11/16 13:56:06 mallet $
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

BUILD_DIRS?=	${CONFIGURE_DIRS}
MAKE_PROGRAM?=	${MAKE}
MAKE_ENV?=	# empty
MAKE_FLAGS?=	# empty
MAKE_FILE?=	Makefile

MAKE_ENV+=	${ALL_ENV}
ifndef NO_EXPORT_CPP
MAKE_ENV+=	CPP=$(call quote,${CPP})
endif
MAKE_ENV+=	LOCALBASE=${LOCALBASE}
MAKE_ENV+=	NO_WHOLE_ARCHIVE_FLAG=${NO_WHOLE_ARCHIVE_FLAG}
MAKE_ENV+=	WHOLE_ARCHIVE_FLAG=${WHOLE_ARCHIVE_FLAG}
MAKE_ENV+=	PKGMANDIR=${PKGMANDIR}

# The filter for the default do-build action
#
BUILD_LOGFILE?=	${WRKDIR}/build.log
BUILD_LOGFILTER?=\
	${_LOGFILTER} ${_LOGFILTER_FLAGS} -l ${BUILD_LOGFILE}		\
		$(if ${BUILD_LOG_ETA},-a ${BUILD_LOG_ETA})		\
		--

# Add these bits to the environment used when invoking the recursive make
# processes for build-related phases.
#
PKGSRC_MAKE_ENV+=	PATH=${PATH}


# The following are the "public" targets provided by this module:
#
#    build
#
# The following targets may be overridden in a package Makefile:
#
#    pre-build, do-build, post-build
#

_COOKIE.build=  ${WRKDIR}/.build_done


# --- build (PUBLIC) -------------------------------------------------------
#
# build is a public target to build the sources for the package.
#
.PHONY: build
ifndef NO_BUILD
  include ${ROBOTPKG_DIR}/mk/build/build.mk
else
  ifeq (yes,$(call exists,${_COOKIE.build}))
    build:
	@${DO_NADA}
  else
    build: $(call barrier, depends, configure build-cookie)
  endif
endif


# --- rebuild (PUBLIC) -----------------------------------------------------
#
# rebuild is a special target to re-run the build target.
#
.PHONY: rebuild
rebuild: build-clean
	${RUN}${RECURSIVE_MAKE} build


# --- build-cookie (PRIVATE) -----------------------------------------------
#
# build-cookie creates the "build" cookie file.
#
.PHONY: build-cookie
build-cookie:
	${RUN}${TEST} ! -f ${_COOKIE.build} || ${FALSE};	\
	${MKDIR} $(dir ${_COOKIE.build});			\
	${ECHO} ${PKGNAME} > ${_COOKIE.build}
