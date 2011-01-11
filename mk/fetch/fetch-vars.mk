#
# Copyright (c) 2006,2008-2011 LAAS/CNRS
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
# From $NetBSD: bsd.fetch-vars.mk,v 1.6 2006/07/27 07:41:40 rillig Exp $
#
#					Anthony Mallet on Tue Dec  5 2006
#

# The following variables may be set by the user:
#
#    DISTDIR is the top-level directory into which all original
#	distribution files are fetched.
#
#    DIST_PATH is a list of directories, separated by colons, in which
#	the distribution files are looked up, additionally to DISTDIR.
#	No files will ever be created in these directories.
#
# The following variables may be set in a package Makefile:
#
#    DIST_SUBDIR is the subdirectory of ${DISTDIR} in which the original
#	distribution files for the package are fetched.
#
#    DISTFILES is the list of distribution files that are fetched.
#

# The default DISTDIR is currently set in robotpkg.prefs.mk.
#DISTDIR?=               ${ROBOTPKG_DIR}/distfiles

# The fetch method.
FETCH_METHOD?=   	archive
# "manual" will explicitly fail if the DISTFILES don't exist locally.
# "custom" requires setting FETCH_CMD, FETCH_BEFORE_ARGS, FETCH_AFTER_ARGS,
# FETCH_RESUME_ARGS and FETCH_OUTPUT_ARGS. FETCH_CMD must understand fetching
# files located via URLs.
# Possible: tnftp, cvs, git, svn, manual, custom
# Default: tnftp
ifeq (,$(filter archive cvs git svn manual custom,${FETCH_METHOD}))
  PKG_FAIL_REASON+= "FETCH_METHOD for ${PKGNAME} must be one of"
  PKG_FAIL_REASON+= "	archive cvs git svn manual custom"
endif

# Default archive extension
EXTRACT_SUFX?=		.tar.gz

_DISTDIR=		${DISTDIR}/${DIST_SUBDIR}
DISTFILES?=		${DISTNAME}${EXTRACT_SUFX}

# Backup site for archives
_MASTER_SITE_BACKUP=	${MASTER_SITE_BACKUP:=${DIST_SUBDIR:=/}}
_MASTER_SITE_OVERRIDE=	${MASTER_SITE_OVERRIDE:=${DIST_SUBDIR:=/}}

# The following variables are all lists of options to pass to he command
# used to do the actual fetching of the file.
ifeq (archive,$(strip ${FETCH_METHOD}))
  _FETCH_CMD=		${TNFTP}
  _FETCH_RESUME_ARGS=	-R
  _FETCH_OUTPUT_ARGS=	-o

  _FETCH_DEPEND=	pkgtools/tnftp/depend.mk
  DEPEND_METHOD.tnftp+=	bootstrap
endif

ifeq (cvs,$(strip ${FETCH_METHOD}))
  _FETCH_CMD=		${CVS}

  _FETCH_DEPEND=	mk/sysdep/cvs.mk pkgtools/pax/depend.mk
  DEPEND_METHOD.cvs+=	bootstrap
  DEPEND_METHOD.pax+=	bootstrap
endif

ifeq (git,$(strip ${FETCH_METHOD}))
  _FETCH_CMD=		${GIT}

  _FETCH_DEPEND=	mk/sysdep/git.mk
  DEPEND_METHOD.git+=	bootstrap
endif

ifeq (svn,$(strip ${FETCH_METHOD}))
  _FETCH_CMD=		${SVN}

  _FETCH_DEPEND=	mk/sysdep/svn.mk pkgtools/pax/depend.mk
  DEPEND_METHOD.svn+=	bootstrap
  DEPEND_METHOD.pax+=	bootstrap
endif

ifeq (manual,$(strip ${FETCH_METHOD}))
  _FETCH_BEFORE_ARGS=	${FALSE}
endif

ifeq (custom,$(strip ${FETCH_METHOD}))
  # FETCH_CMD is the program used to fetch files for FETCH_USING=custom.
  # It must understand fetching files located via URLs.
  #
  _FETCH_CMD=		${FETCH_CMD}
  _FETCH_BEFORE_ARGS=	${FETCH_BEFORE_ARGS}
  _FETCH_AFTER_ARGS=	${FETCH_AFTER_ARGS}
  _FETCH_RESUME_ARGS=	${FETCH_RESUME_ARGS}
  _FETCH_OUTPUT_ARGS=	${FETCH_OUTPUT_ARGS}
endif

# Fetch logfile
FETCH_LOGFILE?=		${WRKDIR}/.fetch.log
FETCH_LOGFILTER?=	${_LOGFILTER} ${_LOGFILTER_FLAGS} \
	$(if $(filter cvs git svn,${FETCH_METHOD}), -l ${FETCH_LOGFILE},-n) \
	--

include ${ROBOTPKG_DIR}/mk/fetch/sites.mk
include ${ROBOTPKG_DIR}/mk/fetch/fetch.mk
