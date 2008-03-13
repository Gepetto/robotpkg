#
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

# From $NetBSD: bsd.buildlink3.mk,v 1.199 2007/12/05 21:36:43 tron Exp $
#
# Copyright (c) 2004 The NetBSD Foundation, Inc.
# All rights reserved.
#
# This code is derived from software contributed to The NetBSD Foundation
# by Johnny C. Lam.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. All advertising materials mentioning features or use of this software
#    must display the following acknowledgement:
#        This product includes software developed by the NetBSD
#        Foundation, Inc. and its contributors.
# 4. Neither the name of The NetBSD Foundation nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
# ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

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

#.for p in ${BUILDLINK_PACKAGES}
#.  for v in AUTO_VARS BUILTIN_MK CONTENTS_FILTER CPPFLAGS DEPMETHOD FILES_CMD INCDIRS IS_DEPOT LDFLAGS LIBDIRS PKGNAME PREFIX RPATHDIRS
#_SYS_VARS.bl3+=		BUILDLINK_${v}.${p}
#.  endfor
#.  for v in IGNORE_PKG USE_BUILTIN
#_SYS_VARS.bl3+=		${v}.${p}
#.  endfor
#.endfor

# DEPEND_PKG contains the list of packages for which we add a direct
# dependency.
#
DEPEND_PKG?=# empty

# By default, prefer the robotpkg version of all packages. Individual
# packages might override this, and users can set their preferences in
# robotpkg.conf.
#
$(foreach _pkg_,${DEPEND_USE},$(eval PREFER.${_pkg_}?=robotpkg))

# By default, every package receives a full dependency.
#
$(foreach _pkg_,${DEPEND_USE},$(eval DEPEND_METHOD.${_pkg_}?=full))

# _DPD_PKG contains all of the elements of DEPEND_PKG for which we must
# add a dependency.  We add a dependency if we are using the robotpkg
# version of the package.
#
_DPD_PKG=	# empty
define _dpd_pkgadd
  ifneq (,$$(filter robotpkg,$${PREFER.${1}}))
_DPD_PKG+=	${1}
  endif
endef
$(foreach _pkg_,${DEPEND_PKG},$(eval $(call _dpd_pkgadd,${_pkg_})))

# Add the proper dependency on each package pulled in by depend.mk
# files.  DEPEND_METHOD.<pkg> contains a list of either "full" or
# "build", and if any of that list is "full" then we use a full dependency
# on <pkg>, otherwise we use a build dependency on <pkg>.
#
define _dpd_adddep
  ifneq (,$$(filter full,${DEPEND_METHOD.${1}}))
DEPENDS+=	${DEPEND_ABI.${1}}:${DEPEND_DIR.${1}}
  endif
  ifneq (,$$(filter build,${DEPEND_METHOD.${1}}))
BUILD_DEPENDS+=	${DEPEND_ABI.${1}}:${DEPEND_DIR.${1}}
  endif
endef
$(foreach _pkg_,${_DPD_PKG},$(eval $(call _dpd_adddep,${_pkg_})))


# Compute the prefix of packages that we are pulling from the system.
# The prefix of robotpkg packages is computed later in this file, after
# the barrier.
#
override define _dpd_sysprefix
  ifndef PREFIX.${1}
    ifeq (,$$(filter robotpkg,$${PREFER.${1}}))
PREFIX.${1}=$$(firstword $$(call prefixsearch,$${SYSTEM_SEARCH.${1}},${SYSTEM_PREFIX}))
MAKEOVERRIDES+=		PREFIX.${1}=$$(call quote,$${PREFIX.${1}})
    endif
  else
    ifneq (,$$(filter robotpkg,$${PREFER.${1}}))
PKG_FAIL_REASON+= "The prefix for ${1} is defined, but the variable"
PKG_FAIL_REASON+= "PREFER.${1} says to use the robotpkg package."
PKG_FAIL_REASON+= "Please unset PREFIX.${1} in your"
PKG_FAIL_REASON+= ${_MAKECONF}
    endif
  endif
  ifeq (,$$(filter robotpkg,$${PREFER.${1}}))
_list:=$$(call pathsearch,$${SYSTEM_SEARCH.${1}},$${PREFIX.${1}})
    ifneq ($$(words $${SYSTEM_SEARCH.${1}}),$$(words $${_list}))
PKG_FAIL_REASON+= "==================================================="
PKG_FAIL_REASON+= "The package ${PKGNAME} requires ${1} from the system."
PKG_FAIL_REASON+= "However, the following files could not be found:"
$$(foreach f,$$(filter-out $$(patsubst $${_prefix}/%,%,$${_list}),\
	$${SYSTEM_SEARCH.${1}}),$$(eval PKG_FAIL_REASON+="		$${f}"))
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= "The search was performed in \$$$${SYSTEM_PREFIX}:"
      ifdef SYSTEM_PREFIX
$$(foreach d,${SYSTEM_PREFIX},$$(eval PKG_FAIL_REASON+="		$${d}"))
      else
PKG_FAIL_REASON+= "		(empty)"
      endif
PKG_FAIL_REASON+= ""
PKG_FAIL_REASON+= "In order to fix the problem, you can modify your"
PKG_FAIL_REASON+= ${_MAKECONF}
PKG_FAIL_REASON+= "and define either of the following variables:"
PKG_FAIL_REASON+= "	- PREFIX.${1}, set to the prefix path of your"
PKG_FAIL_REASON+= "	  ${1} system package"
PKG_FAIL_REASON+= "	- SYSTEM_PREFIX, set to a list of system directories"
PKG_FAIL_REASON+= "	  to search for system files"
PKG_FAIL_REASON+= "	- PREFER.${1}=\"robotpkg\", to use the robotpkg"
PKG_FAIL_REASON+= "	  package for ${1}"
PKG_FAIL_REASON+= "==================================================="
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
PREFIX.${1}=$$(shell ${PKG_INFO} -qp ${1} | ${SED} -e 's,^[^/]*,,;q')
    else
PKG_FAIL_REASON+=	"The prefix for ${1} has not been defined."
    endif
MAKEOVERRIDES+=		PREFIX.${1}=$$(call quote,$${PREFIX.${1}})
  endif
endef
$(foreach _pkg_,${DEPEND_USE},$(eval $(call _dpd_pkgprefix,${_pkg_})))

# Generate default values for:
#
# BUILDLINK_PREFIX.<pkg>	contains all of the installed files
#				for <pkg>
#
# BUILDLINK_CFLAGS.<pkg>,
# BUILDLINK_CPPFLAGS.<pkg>,
# BUILDLINK_LDFLAGS.<pkg>	contain extra compiler options, -D..., -I...
#				and -L.../-Wl,-R options to be passed to the
#				compiler/linker so that building against
#				<pkg> will work.
#
# BUILDLINK_LIBS.<pkg>		contain -l... (library) options that can be
#				automatically appended to the LIBS
#				variable when building against <pkg>.
#

override define _dpd_flags
#
# If we're using the built-in package, then provide sensible defaults.
#
#USE_BUILTIN.${1}?=		no
#.  if !empty(USE_BUILTIN.${1}:M[yY][eE][sS])
#_BLNK1DBDIR.${1}?=	_BLNK1DBDIR.${1}_not_found
#_BLNK1INFO.${1}?=	${TRUE}
#BUILDLINK_PKGNAME.${1}?=	${1}
#BUILDLINK_IS_DEPOT.${1}?=	no
#BUILDLINK_PREFIX.${1}?=	/usr
#.  endif
#

DEPEND_CPPFLAGS.${1}?=# empty
DEPEND_LDFLAGS.${1}?=# empty
DEPEND_LIBS.${1}?=# empty
DEPEND_INCDIRS.${1}?=	include
DEPEND_LIBDIRS.${1}?=	lib
 ifneq (,$$(filter full,$${DEPEND_METHOD.${1}}))
DEPEND_RPATHDIRS.${1}?=	$${DEPEND_LIBDIRS.${1}}
 else
DEPEND_RPATHDIRS.${1}?=# empty
 endif
 ifdef USE_PKG_CONFIG
DEPEND_PKG_CONFIG.${1}?=# empty
 endif
endef
$(foreach _pkg_,${DEPEND_USE},$(eval $(call _dpd_flags,${_pkg_})))


# BUILDLINK_CPPFLAGS, BUILDLINK_LDFLAGS, and BUILDLINK_LIBS contain the
# proper -I..., -L.../-Wl,-R..., and -l... options to be passed to the
# compiler and linker to find the headers and libraries for the various
# packages at configure/build time.  BUILDLINK_CFLAGS contains any special
# compiler options needed when building against the various packages.
#
DEPEND_CPPFLAGS=	# empty
DEPEND_LDFLAGS=		# empty
DEPEND_LIBS=		# empty
DEPEND_CFLAGS=		# empty
ifdef USE_PKG_CONFIG
DEPEND_PKG_CONFIG=# empty
endif

define _dpd_genflags
DEPEND_CPPFLAGS:= $$(filter-out $${DEPEND_CPPFLAGS.${1}},$${DEPEND_CPPFLAGS})
DEPEND_CPPFLAGS+= $${DEPEND_CPPFLAGS.${1}}

DEPEND_LDFLAGS:= $$(filter-out $${DEPEND_LDFLAGS.${1}},$${DEPEND_LDFLAGS})
DEPEND_LDFLAGS+= $${DEPEND_LDFLAGS.${1}}

DEPEND_CFLAGS:= $$(filter-out $${DEPEND_CFLAGS.${1}},$${DEPEND_CFLAGS})
DEPEND_CFLAGS+= $${DEPEND_CFLAGS.${1}}

DEPEND_LIBS:= $$(filter-out $${DEPEND_LIBS.${1}},$${DEPEND_LIBS})
DEPEND_LIBS+= $${DEPEND_LIBS.${1}}
endef
$(foreach _pkg_,${DEPEND_USE},$(eval $(call _dpd_genflags,${_pkg_})))

# DEPEND_INCDIRS.<pkg>,
#
override define _dpd_addincdirs
  ifeq (yes,$$(call exists,$${PREFIX.${1}}/${2}))
_d:=-I$${PREFIX.${1}}/${2}
DEPEND_CPPFLAGS:= $$(filter-out $${_d},$${DEPEND_CPPFLAGS})
DEPEND_CPPFLAGS+= $${_d}
  endif
endef
$(foreach _pkg_,${DEPEND_USE},$(foreach _d_,${DEPEND_INCDIRS.${_pkg_}},\
	$(eval $(call _dpd_addincdirs,${_pkg_},${_d_}))))

# DEPEND_LIBDIRS.<pkg>
#
override define _dpd_addlibdirs
  ifeq (yes,$$(call exists,$${PREFIX.${1}}/${2}))
_d:=-L$${PREFIX.${1}}/${2}
DEPEND_LDFLAGS:= $$(filter-out $${_d},$${DEPEND_LDFLAGS})
DEPEND_LDFLAGS+= $${_d}
  endif
endef
$(foreach _pkg_,${DEPEND_USE},$(foreach _d_,${DEPEND_LIBDIRS.${_pkg_}},\
	$(eval $(call _dpd_addlibdirs,${_pkg_},${_d_}))))

# Apppend DEPEND_RPATHDIRS.<pkg> to DEPEND_LDFLAGS.
# DEPEND_RPATHDIRS.<pkg> is a list of subdirectories of PREFIX.<pkg>
# that should be added to the compiler/linker search paths; these
# directories are checked to see if they exist before they're added to
# the search paths.
#
override define _dpd_addrpath
  ifeq (yes,$$(call exists,$${PREFIX.${1}}/${2}))
_d:=${COMPILER_RPATH_FLAG}$${PREFIX.${1}}/${2}
DEPEND_LDFLAGS:= $$(filter-out $${_d},$${DEPEND_LDFLAGS})
DEPEND_LDFLAGS+= $${_d}
  endif
endef
$(foreach _pkg_,${DEPEND_USE},$(foreach _d_,${DEPEND_RPATHDIRS.${_pkg_}},\
	$(eval $(call _dpd_addrpath,${_pkg_},${_d_}))))

ifdef USE_PKG_CONFIG
# DEPEND_PKG_CONFIG.<pkg>
#
override define _dpd_addpkgconfig
  ifeq (yes,$$(call exists,$${PREFIX.${1}}/${2}))
_d:=$${PREFIX.${1}}/${2}
DEPEND_PKG_CONFIG:= $$(filter-out $${_d},$${DEPEND_PKG_CONFIG})
DEPEND_PKG_CONFIG+= $${_d}
  endif
endef
$(foreach _pkg_,${DEPEND_USE},$(foreach _d_,${DEPEND_PKG_CONFIG.${_pkg_}},\
	$(eval $(call _dpd_addpkgconfig,${_pkg_},${_d_}))))
endif

#
# Ensure that ${LOCALBASE}/lib is in the runtime library search path.
#
DEPEND_LDFLAGS:= $(filter-out ${COMPILER_RPATH_FLAG}${LOCALBASE}/lib,${DEPEND_LDFLAGS})
DEPEND_LDFLAGS+= ${COMPILER_RPATH_FLAG}${LOCALBASE}/lib


#
# We add DEPEND_CPPFLAGS to both CFLAGS and CXXFLAGS since much software
# ignores the value of CPPFLAGS that we set in the environment.
#
CPPFLAGS+=	${DEPEND_CPPFLAGS}
CFLAGS+=	${DEPEND_CFLAGS} ${DEPEND_CPPFLAGS}
CXXFLAGS+=	${DEPEND_CFLAGS} ${DEPEND_CPPFLAGS}
LDFLAGS+=	${DEPEND_LDFLAGS} ${DEPEND_LIBS}

ifdef USE_PKG_CONFIG
 ifneq (,${PKG_CONFIG_PATH})
PKG_CONFIG_PATH+=$(foreach p,${DEPEND_PKG_CONFIG},:${p})
 else
PKG_CONFIG_PATH+=$(patsubst :%,%,$(foreach p,${DEPEND_PKG_CONFIG},:${p}))
 endif
endif

endif # _PKGSRC_BARRIER