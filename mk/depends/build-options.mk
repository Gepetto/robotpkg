# $LAAS: build-options.mk 2008/10/24 11:55:27 mallet $

# Copyright (c) 2008 LAAS/CNRS
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
# THIS  SOFTWARE IS  PROVIDED BY  THE  COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND  ANY  EXPRESS OR  IMPLIED  WARRANTIES,  INCLUDING,  BUT NOT
# LIMITED TO, THE IMPLIED  WARRANTIES  OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR  PURPOSE ARE DISCLAIMED. IN  NO EVENT SHALL THE COPYRIGHT
# HOLDERS OR      CONTRIBUTORS  BE  LIABLE FOR   ANY    DIRECT, INDIRECT,
# INCIDENTAL,  SPECIAL,  EXEMPLARY, OR CONSEQUENTIAL  DAMAGES (INCLUDING,
# BUT NOT LIMITED  TO, PROCUREMENT OF  SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS  INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY  OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR
# TORT (INCLUDING NEGLIGENCE  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE   OF THIS  SOFTWARE, EVEN   IF ADVISED OF   THE POSSIBILITY OF SUCH
# DAMAGE.
#
# From $NetBSD: pkg-build-options.mk,v 1.7 2007/10/13 11:04:17 dsl Exp $
#
#                                       Anthony Mallet on Sun May 18 2008
#

#
# This procedure determines the PKG_OPTIONS that have been in effect
# when a package has been built. When the package is not yet installed,
# the current PKG_OPTIONS are queried.
#
# Parameters:
#	REQD_BUILD_OPTIONS.<pkg>
#		The required options from the package <pkg>.
#
# Example:
#	REQD_BUILD_OPTIONS.<pkg>:= ogireslpc
#	include ../../audio/festival/depend.mk
#
#

define _pkg_buildopt
  ifdef REQD_BUILD_OPTIONS.${1}
    ifeq (robotpkg,${PREFER.${1}})
      ifndef PKG_BUILD_OPTIONS.${1}
        PKG_BUILD_OPTIONS.${1}:=$$(shell				\
	  echo ""; 							\
	  ${PKG_INFO} -Q PKG_OPTIONS ${1} 2>/dev/null			\
	  || { cd ${DEPEND_DIR.${1}}					\
	     && ${MAKE} ${MAKEFLAGS} show-var VARNAME=PKG_OPTIONS; }	\
        )
      endif
      MAKEOVERRIDES+=\
	PKG_BUILD_OPTIONS.${1}:=$$(call quote,$${PKG_BUILD_OPTIONS.${1}})

      r:=$$(filter-out $${PKG_BUILD_OPTIONS.${1}},${REQD_BUILD_OPTIONS.${1}})
      ifneq (,$${r})
PKG_FAIL_REASON+= ${hline}
PKG_FAIL_REASON+= "The package ${PKGNAME} requires ${1} to be built with"
PKG_FAIL_REASON+= "the following options:"
PKG_FAIL_REASON+= "	$${r}"
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= "In order to fix the problem, you should re-install ${1}"
PKG_FAIL_REASON+= "in ${DEPEND_DIR.${1}} with these options enabled."
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= ${hline}
      endif
    endif
  endif
endef
$(foreach _pkg_,${DEPEND_PKG},$(eval $(call _pkg_buildopt,${_pkg_})))
