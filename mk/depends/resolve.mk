# $LAAS: resolve.mk 2008/10/23 16:18:22 mallet $
#
# Copyright (c) 2008 LAAS/CNRS
# Copyright (c) 2004 The NetBSD Foundation, Inc.
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# This code is derived from software contributed to The NetBSD Foundation
# by Johnny C. Lam.
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
#   4. Neither  the  name of The NetBSD  Foundation nor the  names of its
#      contributors may  be used to endorse  or promote products  derived
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
# From $NetBSD: bsd.buildlink3.mk,v 1.199 2007/12/05 21:36:43 tron Exp $
#
#                                       Anthony Mallet on Thu Feb 28 2008
#

# An example package depend.mk file:
#
# -------------8<-------------8<-------------8<-------------8<-------------
# DEPEND_DEPTH:=	${DEPEND_DEPTH}+
# FOO_DEPEND_MK:=	${FOO_DEPEND_MK}+
#
# ifeq (+,$(DEPEND_DEPTH))
# DEPEND_PKG+=		foo
# endif
#
# ifeq (+,$(FOO_DEPEND_MK))
# DEPEND_USE+=		foo
# DEPEND_DIR.foo?=	../../category/foo
# endif  # FOO_DEPEND_MK
#
# include ../../category/baz/depend.mk
#
# DEPEND_DEPTH:=	${DEPEND_DEPTH:+=}
# -------------8<-------------8<-------------8<-------------8<-------------
#
# Most of the depend.mk file is protected against multiple inclusion,
# except for the parts related to manipulating DEPEND_DEPTH.
#
# Note that if a depend.mk file is included, then the package Makefile
# has the expectation that it can use the value of PREFIX.<pkg>.
# If the depend.mk tries to handle dependencies satisfied directly by
# the base system, then it should provide an appropriate value for
# PREFIX.<pkg> for that case.  The case where a dependency is
# satisfied by a robotpkg-installed package is handled automatically by
# this file.
#
# The different variables that may be set in a depend.mk file are
# described below.
#
# The variable name convention used in this Makefile are:
#
# DEPEND_*	public variables usable in other Makefiles
# _DPD_*	private variables to this Makefile


# DEPEND_PKG contains the list of packages for which we add a direct
# dependency.
#
DEPEND_PKG?=# empty

# DEPEND_USE contains the full list of packages on which we have a
# dependency (direct or indirect).
#
DEPEND_USE?=# empty

# By default, prefer the robotpkg version of all packages. Individual
# packages might override this, and users can set their preferences in
# robotpkg.conf.
#
$(foreach _pkg_,${DEPEND_USE},$(eval PREFER.${_pkg_}?=robotpkg))

# By default, every package receives a full dependency.
#
$(foreach _pkg_,${DEPEND_USE},$(eval DEPEND_METHOD.${_pkg_}?=full))


# Add the proper dependency on each package pulled in by depend.mk
# files.  DEPEND_METHOD.<pkg> contains a list of either "full", "build"
# or "bootstrap". If any of that list is "full" then we use a full
# dependency on <pkg>, otherwise we use a build dependency on <pkg>.
#
define _dpd_adddep
  ifneq (,$$(filter robotpkg,$${PREFER.${1}}))
    ifneq (,$$(filter full,${DEPEND_METHOD.${1}}))
DEPENDS+=		${DEPEND_ABI.${1}}:${DEPEND_DIR.${1}}
    else
      ifneq (,$$(filter build,${DEPEND_METHOD.${1}}))
BUILD_DEPENDS+=		${DEPEND_ABI.${1}}:${DEPEND_DIR.${1}}
      else
        ifneq (,$$(filter bootstrap,${DEPEND_METHOD.${1}}))
BOOTSTRAP_DEPENDS+=	${DEPEND_ABI.${1}}:${DEPEND_DIR.${1}}
        endif
      endif
    endif
  endif
endef
$(foreach _pkg_,${DEPEND_PKG},$(eval $(call _dpd_adddep,${_pkg_})))


# Compute the prefix of packages that we are pulling from the system.
# The prefix of robotpkg packages is computed later in this file, after
# the barrier.
#
_PREFIXSEARCH_CMD=	${SETENV} ECHO=${ECHO}					\
				  TEST=${TEST}					\
				  SED=${SED}					\
				  PKG_ADMIN_CMD=${PKG_ADMIN_CMD}		\
			${SH} ${ROBOTPKG_DIR}/mk/depends/prefixsearch.sh

hline="===================================================================="
override define _dpd_sysprefix
  ifndef _PREFIX.${1}
    ifeq (,$$(filter robotpkg,$${PREFER.${1}}))
      _PREFIX.${1}:=$$(shell ${_PREFIXSEARCH_CMD}			\
	-p $$(call quote,$$(or $${PREFIX.${1}},${SYSTEM_PREFIX}))	\
	"${1}" "$${DEPEND_ABI.${1}}" $${SYSTEM_SEARCH.${1}})
      MAKEOVERRIDES+=	_PREFIX.${1}:=$$(call quote,$$(strip $${_PREFIX.${1}}))
    endif
  endif
  ifeq (,$$(filter robotpkg,$${PREFER.${1}}))
    ifeq (,$$(strip $${_PREFIX.${1}}))
PKG_FAIL_REASON+= ${hline}
PKG_FAIL_REASON+= "System requirements for ${PKGNAME} were not met:"
PKG_FAIL_REASON+= $$(shell ${_PREFIXSEARCH_CMD} -e			\
	-p $$(call quote,$$(or $${PREFIX.${1}},${SYSTEM_PREFIX}))	\
	"${1}" "$${DEPEND_ABI.${1}}" $${SYSTEM_SEARCH.${1}} 		\
	| ${SED} -e 's/^/"/g;s/$$$$/"/g')
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= "In order to fix the problem, you should install"
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= "		$${DEPEND_ABI.${1}}"
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= "in your system (as well as associated development packages)."
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= "If this package is already present, you should check the"
PKG_FAIL_REASON+= "following variables in ${_MAKECONF}:"
PKG_FAIL_REASON+= "	. SYSTEM_PREFIX is a list of system directories that"
PKG_FAIL_REASON+= "	  will be searched for system files. Its current value is:"
      ifdef SYSTEM_PREFIX
$$(foreach d,${SYSTEM_PREFIX},$$(eval PKG_FAIL_REASON+="		$${d}"))
      else
PKG_FAIL_REASON+= "		(empty)"
      endif
PKG_FAIL_REASON+= "	. PREFIX.${1} can be set to the prefix path of your"
PKG_FAIL_REASON+= "	  ${1} system package."
      ifneq (,$(strip ${DEPEND_DIR.${1}}))
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= "If no $${DEPEND_ABI.${1}} package can be made available in your "
PKG_FAIL_REASON+= "system, you can choose to use the robotpkg version, by setting "
PKG_FAIL_REASON+= "in ${_MAKECONF}:"
PKG_FAIL_REASON+= "	. PREFER.${1}=	robotpkg"
      endif
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= ${hline}
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= "*** ${1} package not found. (see above)"
    else
      PREFIX.${1}:=$${_PREFIX.${1}}
    endif
  endif
endef
$(foreach _pkg_,${DEPEND_USE},$(eval $(call _dpd_sysprefix,${_pkg_})))


# --- Begin after the barrier ----------------------------------------

ifdef _PKGSRC_BARRIER

# Generate default value for PREFIX.<pkg> variable for the robotpkg
# packages.
#
override define _dpd_pkgprefix
  ifndef PREFIX.${1}
    ifneq (,$$(filter robotpkg,$${PREFER.${1}}))
PREFIX.${1}:=$$(shell ${PKG_INFO} -qp ${1} | ${SED} -e 's,^[^/]*,,;q')
    else
PKG_FAIL_REASON+=	"The prefix for ${1} has not been defined."
    endif
MAKEOVERRIDES+=		PREFIX.${1}:=$$(call quote,$${PREFIX.${1}})
  endif
endef
$(foreach _pkg_,${DEPEND_USE},$(eval $(call _dpd_pkgprefix,${_pkg_})))


# Generate default values for:
#
# DEPEND_CFLAGS.<pkg>,
# DEPEND_CPPFLAGS.<pkg>,
# DEPEND_LDFLAGS.<pkg>	contain extra compiler options, -D..., -I...
#			and -L.../-Wl,-R options to be passed to the
#			compiler/linker so that building against
#			<pkg> will work.
#
# DEPEND_LIBS.<pkg>	contain -l... (library) options that can be
#			automatically appended to the LIBS
#			variable when building against <pkg>.
#
override define _dpd_flags
  DEPEND_CFLAGS.${1}?=#		empty
  DEPEND_CPPFLAGS.${1}?=#	empty
  DEPEND_LDFLAGS.${1}?=#	empty
  DEPEND_LIBS.${1}?=#		empty
  DEPEND_INCDIRS.${1}?=		include
  DEPEND_LIBDIRS.${1}?=		lib
  DEPEND_PKG_CONFIG.${1}?=	lib/pkgconfig
  ifneq (,$$(filter full,$${DEPEND_METHOD.${1}}))
    DEPEND_RPATHDIRS.${1}?=	$${DEPEND_LIBDIRS.${1}}
  else
    DEPEND_RPATHDIRS.${1}?=# empty
  endif
endef
$(foreach _pkg_,${DEPEND_USE},$(eval $(call _dpd_flags,${_pkg_})))


# DEPEND_CPPFLAGS, DEPEND_LDFLAGS, and DEPEND_LIBS contain the
# proper -I..., -L.../-Wl,-R..., and -l... options to be passed to the
# compiler and linker to find the headers and libraries for the various
# packages at configure/build time.  DEPEND_CFLAGS contains any special
# compiler options needed when building against the various packages.
#
DEPEND_CFLAGS:=$(call lappend,						\
  $(foreach _pkg_,${DEPEND_USE},${DEPEND_CFLAGS.${_pkg_}}),)

DEPEND_CPPFLAGS:=$(call lappend,					\
  $(foreach _pkg_,${DEPEND_USE},${DEPEND_CPPFLAGS.${_pkg_}}),)

DEPEND_LDFLAGS:=$(call lappend,						\
  $(foreach _pkg_,${DEPEND_USE},${DEPEND_LDFLAGS.${_pkg_}}),)

DEPEND_LIBS:=$(call lappend,						\
  $(foreach _pkg_,${DEPEND_USE},${DEPEND_LIBS.${_pkg_}}),)


# Append DEPEND_INCDIRS.<pkg> to DEPEND_CPPFLAGS
#
# DEPEND_INCDIR.<pkg> is a list of subdirectories of PREFIX.<pkg>
# that should be added to the compiler/linker search paths;
# these directories are checked to see if they exist before they're added
# to the search paths. The special /usr/lib is not added since it is in
# the default compiler path.
#
DEPEND_CPPFLAGS:=$(call lappend,$(addprefix -I,$(foreach 		\
  _pkg_,${DEPEND_USE},$(realpath $(filter-out /usr/include,$(addprefix	\
      ${PREFIX.${_pkg_}}/,${DEPEND_INCDIRS.${_pkg_}}))))),		\
	${DEPEND_LDFLAGS})


# Append DEPEND_LIBDIRS.<pkg> to DEPEND_LDFLAGS
#
# DEPEND_LIBDIRS.<pkg> is a list of subdirectories of PREFIX.<pkg>
# that should be added to the compiler/linker search paths;
#
DEPEND_LDFLAGS:=$(call lappend,$(addprefix -L,$(foreach 		\
  _pkg_,${DEPEND_USE},$(realpath $(filter-out /usr/lib,$(addprefix	\
      ${PREFIX.${_pkg_}}/,${DEPEND_LIBDIRS.${_pkg_}}))))),		\
	${DEPEND_LDFLAGS})


# Apppend DEPEND_RPATHDIRS.<pkg> to DEPEND_LDFLAGS.
#
# DEPEND_RPATHDIRS.<pkg> is a list of subdirectories of PREFIX.<pkg>
# that should be added to the compiler/linker run-time search paths;
#
# Ensure that ${LOCALBASE}/lib is first in this list.
#
DEPEND_LDFLAGS:=\
  $(call append,${COMPILER_RPATH_FLAG}${LOCALBASE}/lib,${DEPEND_LDFLAGS})

DEPEND_LDFLAGS:=$(call lappend,$(addprefix ${COMPILER_RPATH_FLAG},	\
  $(foreach _pkg_,${DEPEND_USE},$(realpath $(filter-out /usr/lib,	\
    $(addprefix ${PREFIX.${_pkg_}}/,${DEPEND_RPATHDIRS.${_pkg_}}))))),	\
	${DEPEND_LDFLAGS})


# We add DEPEND_CPPFLAGS to both CFLAGS and CXXFLAGS since much software
# ignores the value of CPPFLAGS that we set in the environment.
#
CPPFLAGS+=	${DEPEND_CPPFLAGS}
CFLAGS+=	${DEPEND_CFLAGS} ${DEPEND_CPPFLAGS}
CXXFLAGS+=	${DEPEND_CFLAGS} ${DEPEND_CPPFLAGS}
LDFLAGS+=	${DEPEND_LDFLAGS} ${DEPEND_LIBS}


# If we are using pkg-config, update the PKG_CONFIG_PATH variable by
# prepending the value of DEPEND_PKG_CONFIG.<pkg> of all depended
# packages.
#
ifneq (,$(filter pkg-config,${DEPEND_USE}))
  PKG_CONFIG_PATH:=$(call prependpaths,					\
	$(foreach _pkg_,${DEPEND_USE},$(addprefix			\
		${PREFIX.${_pkg_}}/,${DEPEND_PKG_CONFIG.${_pkg_}})),	\
	${PKG_CONFIG_PATH})
endif

endif # _PKGSRC_BARRIER
