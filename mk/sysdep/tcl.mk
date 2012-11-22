#
# Copyright (c) 2012 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use  in  source  and binary  forms,  with  or  without
# modification, are permitted provided that the following conditions are met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
# THE SOFTWARE  IS PROVIDED "AS IS"  AND THE AUTHOR  DISCLAIMS ALL WARRANTIES
# WITH  REGARD   TO  THIS  SOFTWARE  INCLUDING  ALL   IMPLIED  WARRANTIES  OF
# MERCHANTABILITY AND  FITNESS.  IN NO EVENT  SHALL THE AUTHOR  BE LIABLE FOR
# ANY  SPECIAL, DIRECT,  INDIRECT, OR  CONSEQUENTIAL DAMAGES  OR  ANY DAMAGES
# WHATSOEVER  RESULTING FROM  LOSS OF  USE, DATA  OR PROFITS,  WHETHER  IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR  OTHER TORTIOUS ACTION, ARISING OUT OF OR
# IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
#                                           Anthony Mallet on Tue Nov 13 2012
#

#
# Tcl language definitions
#
# This file determines which Tcl version is used as a dependency for
# a package.
#
# === User-settable variables ===
#
# PREFER_ALTERNATIVE.tcl
#	The preferred Tcl interpreters/versions to use. The
#	order of the entries matters, since earlier entries are
#	preferred over later ones.
#
#	Possible values: tcl84 tcl85
#	Default: tcl85 tcl84
#
# === Package-settable variables ===
#
# DEPEND_ABI.tcl
#	The Tcl versions that are acceptable for the package.
#
#	Possible values: any pattern
#	Default: tcl>=8.4
#
# === Defined variables ===
#
# PKGTAG.tcl
#       The prefix to use in PKGNAME for extensions which are meant
#       to be installed for multiple Tcl versions.
#
#       Example: tcl85
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TCL_DEPEND_MK:=		${TCL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		${PKG_ALTERNATIVE.tcl}
endif

ifeq (+,$(TCL_DEPEND_MK)) # ------------------------------------------------

DEPEND_USE+=		${PKG_ALTERNATIVE.tcl}

PREFER.tcl?=		system
DEPEND_ABI.tcl?=	tcl>=8.4

# factorize SYSTEM_SEARCH.tcl* here for all tcl* packages
override define _tcl_syssearch
  'bin/tclsh{,[0-9.]*}:p:echo puts [set tcl_patchLevel]| %'	\
  'lib/{,tcl{,[0-9]*}/}tclConfig.sh:/TCL_VERSION/s/[^.0-9]//gp'	\
  'include/{,tcl{,[0-9]*}/}tcl.h:/TCL_VERSION/s/[^.0-9]//gp'
endef

# define some variables for use in the packages
export TCLSH=		$(word 1,${SYSTEM_FILES.${PKG_ALTERNATIVE.tcl}})
TCL_CONFIG_SH=		$(word 2,${SYSTEM_FILES.${PKG_ALTERNATIVE.tcl}})
TCL_VERSION=		$(patsubst 8%,8.%,${PKG_ALTERNATIVE.tcl})

# TCLPATH.<pkg> is a list of subdirectories of PREFIX.<pkg> (or absolute
# directories) that should be added to the tcl search paths.
#
_TCL_SYSPATH:=$(if ${TCLSH},						\
  $(shell ${ECHO} 'puts $$auto_path' |		\
    ${SETENV} TCLLIBPATH= ${TCLSH} 2>/dev/null))

TCLLIBPATH=$(filter-out ${_TCL_SYSPATH},				\
	$(patsubst %/,%,$(foreach _pkg_,${DEPEND_USE},			\
	  $(addprefix							\
	    ${PREFIX.${_pkg_}}/, $(patsubst ${PREFIX.${_pkg_}}/%,%,	\
	    $(or ${TCLPATH.${_pkg_}},					\
	      $(dir $(filter %/pkgIndex.tcl,${SYSTEM_FILES.${_pkg_}}))	\
	))))))
export TCLLIBPATH

# define an alternative for available tcls packages
PKG_ALTERNATIVES+=	tcl
PKG_ALTERNATIVES.tcl=	tcl84 tcl85

# set default preferences
PREFER_ALTERNATIVE.tcl?=	tcl85 tcl84

PKG_ALTERNATIVE_DESCR.tcl84= Use tcl-8.4
PKGTAG.tcl84 =		tcl84
define PKG_ALTERNATIVE_SELECT.tcl84
  $(call preduce,${DEPEND_ABI.tcl} tcl>=8.4<8.5)
endef
define PKG_ALTERNATIVE_SET.tcl84
  _tcl_abi:=$(subst tcl,tcl84,${PKG_ALTERNATIVE_SELECT.tcl84})
  DEPEND_ABI.tcl84?=	$(strip ${_tcl_abi})
  DEPEND_ABI.tk+=	tk>=8.4<8.5

  include ../../mk/sysdep/tcl84.mk
endef

PKG_ALTERNATIVE_DESCR.tcl85= Use tcl-8.5
PKGTAG.tcl85 =		tcl85
define PKG_ALTERNATIVE_SELECT.tcl85
  $(call preduce,${DEPEND_ABI.tcl} tcl>=8.5<8.6)
endef
define PKG_ALTERNATIVE_SET.tcl85
  _tcl_abi:=$(subst tcl,tcl85,${PKG_ALTERNATIVE_SELECT.tcl85})
  DEPEND_ABI.tcl85?=	$(strip ${_tcl_abi})
  DEPEND_ABI.tk+=	tk>=8.5<8.6

  include ../../mk/sysdep/tcl85.mk
endef


# Add extra replacement in PLISTs
PLIST_SUBST+=\
	TCL_VERSION=${TCL_VERSION}

PRINT_PLIST_AWK_SUBST+=\
	gsub(/$(subst .,\.,${TCL_VERSION})/, "$${TCL_VERSION}");

endif # TCL_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
