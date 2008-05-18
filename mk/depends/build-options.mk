# Copyright (c) 2008
#      IS/AIST-ST2I/CNRS Joint Japanese-French Robotics Laboratory (JRL).
# All rights reserved.
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
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# From $NetBSD: pkg-build-options.mk,v 1.7 2007/10/13 11:04:17 dsl Exp $
#
# Authored by Anthony Mallet on Sun May 18 2008.
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
        PKG_BUILD_OPTIONS.${1}:=$(shell					\
	  echo ""; 							\
	  ${PKG_INFO} -Q PKG_OPTIONS ${1} 2>/dev/null			\
	  || { cd ${DEPEND_DIR.${1}}					\
	     && ${MAKE} ${MAKEFLAGS} show-var VARNAME=PKG_OPTIONS; }	\
        )
      endif
      MAKEOVERRIDES+=\
	PKG_BUILD_OPTIONS.${1}=$$(call quote,$${PKG_BUILD_OPTIONS.${1}})

      r:=$$(filter-out $${PKG_BUILD_OPTIONS.${1}},${REQD_BUILD_OPTIONS.${1}})
      ifneq (,$${r})
hline="===================================================================="
PKG_FAIL_REASON+= ${hline}
PKG_FAIL_REASON+= "The package ${PKGNAME} requires ${1} to be built with"
PKG_FAIL_REASON+= "the following options:"
PKG_FAIL_REASON+= "	$${r}"
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= "In order to fix the problem, you should re-install ${1}"
PKG_FAIL_REASON+= "in ${DEPEND_DIR.${1}} with these options enabled."
PKG_FAIL_REASON+= ${hline}
      endif
    endif
  endif
endef
$(foreach _pkg_,${DEPEND_PKG},$(eval $(call _pkg_buildopt,${_pkg_})))
