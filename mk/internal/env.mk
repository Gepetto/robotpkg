#
# Copyright (c) 2009,2011-2013 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#                                             Anthony Mallet on Sun May 31 2009
#

# Clean unwanted variables inherited from the environment, avoid propagating
# package-specific command line variables and apply any overrides settings
# defined by parent Makefiles.
#
# Variables cleaned by this file must be further set with an 'ifndef' construct
# instead of a ?= assignment or, better, by using the 'setdefault'
# macro. gmake-3.82 has an interesting 'undefine' command, but many systems
# still have 3.81, so ...
#
export _ENV_VARS?=\
	_ENV_VARS MAKECONF ROBOTPKG_BASE ROBOTPKG_DIR			\
	MAKE MAKELEVEL MAKEOVERRIDES MAKEFLAGS MFLAGS MAKE_RESTARTS	\
	PATH TERM TERMCAP DISPLAY XAUTHORITY SSH_AUTH_SOCK		\
	http_proxy https_proxy ftp_proxy

_NO_INHERIT=\
	PKGREQD WRKDIR


# Anything in this file must be evaluated (very) early during processing. This
# file is included at the top of robotpkg.prefs.mk which is in turn included
# at the top of robotpkg.mk (robotpkg.prefs.mk can even be included before
# robotpkg.mk by package Makefiles or depend.mk if needed).


# --- Apply overrides settings ---------------------------------------------
#
# Apply any settings defined in _override_vars.<pkgpath> by a parent Makefile.
# Do this for recursive 'make' invocations only.
#
# The list of configuration variables for each dependency is computed from
# _overrides.<var> and the list of variables for each pkg is set in
# _overrides_vars.<pkgpath>.
#
# Note: simply passing variables on the RECURSIVE_MAKE command like would not
# work because some targets (like show-depends) invoke MAKE themselves in many
# directories without knowing on behalf which package they do that.
#
ifneq (0,${MAKELEVEL})
  $(foreach _,$(sort ${_override_vars.${PKGPATH}}), \
    $(eval $_ =$(value _overrides.${PKGPATH}.$_)))

  # keep overrides settings
  _ENV_VARS+=_override_vars.% _overrides.%
endif

# Helper macro exporting variables
override define _export_override # (path, var, value)
  export _override_vars.$(call pkgpath,$1) +=$2
  export _overrides.$(call pkgpath,$1).$(strip $2) +=$3
endef



# --- Unsetenv -------------------------------------------------------------
#
# Undef (set to empty) a variable that was inherited from the environment and
# unexport it, so that it looks like it wasn't in the environment initially.
#
override define unsetenv
  ifeq (environment,$(origin $1))
    ${1}.env:=$$(value $1)
    $1=
    unexport $1
  endif
endef

# unsetenv each unwanted var
$(foreach _v_,$(filter-out ${_ENV_VARS},${.VARIABLES}),$(eval \
	$(call unsetenv,${_v_})))


# --- Avoid propagation of unwanted variables ------------------------------
#
# Variable passed on the command line that are package-specific must not be
# exported to recursive make.
#
override define _env_nopropagate # (var)
  ifeq (command line,$(origin $1))
    unexport $1
    $(call _export_override,${CURDIR},$1,${$1})
    MAKEOVERRIDES:=$$(subst $1=,$1.cmdline=,$${MAKEOVERRIDES})
  endif
endef
$(foreach _,${_NO_INHERIT},$(eval $(call _env_nopropagate,$_)))


# --- Force sane settings --------------------------------------------------

# Reset the current locale to a sane value (that is, 'C') during the build
# of packages.  Several utilities behave differently or even incorrectly if
# a locale different than 'C' is set.
export LANG=C
export LC_COLLATE=C
export LC_CTYPE=C
export LC_MESSAGES=C
export LC_MONETARY=C
export LC_NUMERIC=C
export LC_TIME=C

# Set HOME diretory. This is needed for some tools, e.g. latex for font
# generation.
export HOME=${WRKDIR}

# Set compilers defaults to 'false' so that missing languages dependencies are
# detected
export CPP=	${FALSE}
export CC=	${FALSE}
export CXXCPP=	${FALSE}
export CXX=	${FALSE}
export FC=	${FALSE}
