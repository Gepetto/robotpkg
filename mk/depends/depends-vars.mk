# $LAAS: depends-vars.mk 2009/03/10 19:39:41 mallet $
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
# From $NetBSD: bsd.depends-vars.mk,v 1.4 2006/07/13 14:02:34 jlam Exp $
#
#					Anthony Mallet on Thu Nov 30 2006
#

# The following variables may be set in a package Makefile:
#
#    BOOTSTRAP_DEPENDS is a list of dependencies of the form "pattern:dir"
#	for packages that should be installed before any other stage is
#	invoked.
#
#    REQD_BUILD_OPTIONS.<pkg>
#	The required build options from the package <pkg>.
#
BOOTSTRAP_DEPENDS?=	# empty

SYSDEP_VERBOSE?=	yes

_SYSDEP_FILE=		${WRKDIR}/.sysdep
_PKGDEP_FILE=		${WRKDIR}/.pkgdep

_COOKIE.bootstrapdepend=${WRKDIR}/.bootstrapdepend_done
_COOKIE.depends=	${WRKDIR}/.depends_done

# DEPENDS_TARGET is the target that is invoked to satisfy missing
# dependencies.  This variable is user-settable in /etc/mk.conf.
#
ifndef DEPENDS_TARGET
  ifneq (,$(findstring package,${MAKECMDGOALS}))
DEPENDS_TARGET=		package
  endif
  ifneq (,$(findstring update,${MAKECMDGOALS}))
    ifneq (,$(findstring replace,${UPDATE_TARGET}))
DEPENDS_TARGET=		${UPDATE_TARGET}
    else
DEPENDS_TARGET=		update
    endif
  endif
  ifneq (,$(findstring bin-install,${MAKECMDGOALS}))
DEPENDS_TARGET=		bin-install
  endif
  ifndef DEPENDS_TARGET
DEPENDS_TARGET=		reinstall
  endif
endif

# The following are the "public" targets provided by this module:
#
#    depends, bootstrap-depends, install-depends
#

# --- depends (PUBLIC) -----------------------------------------------
#
# depends is a public target to install missing dependencies for
# the package.
#
.PHONY: depends
ifndef NO_DEPENDS
  include ${ROBOTPKG_DIR}/mk/depends/depends.mk
else
  depends: ${_COOKIE.depends}
	@${DO_NADA}

  ${_COOKIE.depends}:
	${RUN}${TEST} ! -f ${_COOKIE.depends} || ${FALSE}
	${RUN}${MKDIR} $(dir ${_COOKIE.depends})
	${RUN}> ${_COOKIE.depends}
endif


# --- bootstrap-depends (PUBLIC, OVERRIDE) ---------------------------
#
# bootstrap-depends is a public target to install any missing
# dependencies needed during stages before the normal "depends"
# stage.  These dependencies are listed in BOOTSTRAP_DEPENDS.
#
.PHONY: bootstrap-depends
ifndef NO_DEPENDS
  include ${ROBOTPKG_DIR}/mk/depends/sysdep.mk
else ifeq (yes,$(call exists,${_COOKIE.bootstrapdepend}))
  bootstrap-depends:
	@${DO_NADA}
else
  bootstrap-depends: bootstrap-depends-cookie
endif


# --- depends-clean (PRIVATE) ----------------------------------------------
#
# depends-clean removes the state files associated with the "depends" target so
# that "depends" may be re-invoked.
#
depends-clean:
	${RUN}${RM} -f ${_COOKIE.depends}
	${RUN}${RMDIR} -p $(dir ${_COOKIE.depends}) 2>/dev/null || ${TRUE}


# --- bootstrap-depends-cookie (PRIVATE) -----------------------------------
#
# bootstrap-depends-cookie creates the "boostrap-depends" cookie file.
#
.PHONY: bootstrap-depends-cookie
bootstrap-depends-cookie:
	${RUN}${TEST} ! -f ${_COOKIE.bootstrapdepend} || ${FALSE}
	${RUN}${MKDIR} $(dir ${_COOKIE.bootstrapdepend})
	${RUN}${ECHO} ${PKGNAME} > ${_COOKIE.bootstrapdepend}
