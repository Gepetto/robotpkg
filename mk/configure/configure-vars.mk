#
# Copyright (c) 2006-2011 LAAS/CNRS
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
# From $NetBSD: bsd.configure-vars.mk,v 1.1 2006/07/05 06:09:15 jlam Exp $
#
#					Anthony Mallet on Sat Dec  2 2006
#

#
# CONFIGURE_DIRS is the list of directories in which to run the
#	configure process.  If the directories are relative paths,
#	then they are assumed to be relative to ${WRKSRC}.
#
# SCRIPTS_ENV is the shell environment passed to scripts invoked
#	by robotpkg.
#
CONFIGURE_DIRS?=	${WRKSRC}
SCRIPTS_ENV?=		# empty

# PKGINFODIR is the subdirectory of ${PREFIX} into which the info
# files are installed unless the software was configured with an
# installation prefix other than ${PREFIX}.
#
CONFIGURE_HAS_INFODIR?=	yes

# PKGMANDIR is the subdirectory of ${PREFIX} into which the man and
# catman pages are installed unless the software was configured with
# an installation prefix other than ${PREFIX}.
#
CONFIGURE_HAS_MANDIR?=	 yes

SCRIPTS_ENV+=	${ALL_ENV}
ifdef BATCH
SCRIPTS_ENV+=	BATCH=yes
endif
SCRIPTS_ENV+=	CURDIR=${CURDIR}
SCRIPTS_ENV+=	DISTDIR=${DISTDIR}
SCRIPTS_ENV+=	FILESDIR=${FILESDIR}
SCRIPTS_ENV+=	LOCALBASE=${LOCALBASE}
SCRIPTS_ENV+=	PATCHDIR=${PATCHDIR}
SCRIPTS_ENV+=	ROBOTPKG_DIR=${ROBOTPKG_DIR}
SCRIPTS_ENV+=	SCRIPTDIR=${SCRIPTDIR}
SCRIPTS_ENV+=	WRKDIR=${WRKDIR}
SCRIPTS_ENV+=	WRKSRC=${WRKSRC}

# The filter for the default do-build action
#
CONFIGURE_LOGFILE?=	${WRKDIR}/configure.log
CONFIGURE_LOGFILTER?=\
	${_LOGFILTER} ${_LOGFILTER_FLAGS} -l ${CONFIGURE_LOGFILE}	\
		$(if ${CONFIGURE_LOG_ETA},-a ${CONFIGURE_LOG_ETA})	\
		--

# The following are the "public" targets provided by this module:
#
#    configure
#
# The following targets may be overridden in a package Makefile:
#
#    pre-configure, do-configure, post-configure
#

_COOKIE.configure=      ${WRKDIR}/.configure_cookie


# --- configure (PUBLIC) ---------------------------------------------------
#
# configure is a public target to configure the software for building.
#
.PHONY: configure
ifndef NO_CONFIGURE
  include ${ROBOTPKG_DIR}/mk/configure/configure.mk
else
  ifeq (yes,$(call exists,${_COOKIE.configure}))
    configure:
	@${DO_NADA}
  else
    $(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)
    $(call require, ${ROBOTPKG_DIR}/mk/extract/extract-vars.mk)

    _CONFIGURE_TARGETS+=	$(call add-barrier, depends, configure)
    ifndef _EXTRACT_IS_CHECKOUT
      $(call require, ${ROBOTPKG_DIR}/mk/patch/patch-vars.mk)
      _CONFIGURE_TARGETS+=	patch
    endif
    _CONFIGURE_TARGETS+=	configure-cookie

    configure: ${_CONFIGURE_TARGETS};
  endif
endif


# --- reconfigure (PUBLIC) -------------------------------------------------
#
# reconfigure is a special target to re-run the configure target.
#
.PHONY: reconfigure
reconfigure: configure-clean
	${RUN}${RECURSIVE_MAKE} configure


# --- configure-clean (PRIVATE) --------------------------------------------
#
# configure-clean removes the state files for the "configure" and later phases
# so that the "configure" target may be re-invoked.
#
$(call require, ${ROBOTPKG_DIR}/mk/build/build-vars.mk)

configure-clean: build-clean
	${RUN}${RM} -f ${_COOKIE.configure}


# --- configure-cookie (PRIVATE) -------------------------------------------
#
# configure-cookie creates the "configure" cookie file.
#
.PHONY: configure-cookie
configure-cookie: makedirs
	${RUN}${TEST} ! -f ${_COOKIE.configure} || ${FALSE}
	${RUN}exec >>${_COOKIE.configure};				\
	${ECHO} "_COOKIE.configure.date:=`${_CDATE_CMD}`"
