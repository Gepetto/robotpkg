#
# Copyright (c) 2009,2011-2013,2016 LAAS/CNRS
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

# Avoid propagating package-specific command line variables and apply any
# overrides settings defined by parent Makefiles.
#

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
  $(foreach _,$(sort ${_override_vars_$(call clean,${PKGPATH})}), \
    $(eval $_ =$(value _overrides_$(call clean,${PKGPATH}_$_))))
endif

# Helper macro exporting variables
override define _export_override # (path, var, value)
  export _override_vars_$(call clean,$(call pkgpath,$1)) +=$2
  export _overrides_$(call clean,$(call pkgpath,$1)_$(strip $2)) +=$3
endef


# --- Avoid propagation of unwanted variables ------------------------------
#
# Variable passed on the command line that are package-specific must not be
# exported to recursive make.
#
_NO_INHERIT=	PREFIX PKGREQD WRKDIR

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

# Set compilers defaults to 'false' so that missing languages dependencies are
# detected
export CPP=	${FALSE}
export CC=	${FALSE}
export CXXCPP=	${FALSE}
export CXX=	${FALSE}
export FC=	${FALSE}


# PREFIX is always exported
ALL_ENV+=	PREFIX=$(call quote,${PREFIX})

# Set HOME directory. This is needed for some tools, e.g. latex for font
# generation.
ALL_ENV+=	HOME=${WRKDIR}


# PATH.<pkg> is a list of subdirectories of PREFIX.<pkg> (or absolute
# directories) that should be added to the run-time shell search paths (PATH)
#
ALL_ENV+= PATH=$(call quote,$(call prependpaths,			\
  ${LOCALBASE}/bin ${LOCALBASE}/sbin					\
  $(foreach _,${DEPEND_USE},$(realpath					\
    $(addprefix ${PREFIX.$_}/,${PATH.$_}) ${PATH.$_})),${PATH}))


# LD_LIBRARY_DIRS.<pkg> is a list of subdirectories of PREFIX.<pkg> (or
# absolute directories) that should be added to the run-time linker search
# paths (LD_LIBRARY_PATH)
#
ALL_ENV+= ${_LD_LIBRARY_PATH_VAR}=$(call quote,$(call prependpaths,	\
  $(filter-out $(addprefix /usr/,${SYSLIBDIR} lib),			\
  $(addprefix ${PREFIX}/,$(patsubst ${PREFIX}/%,%,${LD_LIBRARY_DIRS}))	\
  $(foreach _,${DEPEND_USE},$(realpath					\
    $(addprefix ${PREFIX.$_}/,${LD_LIBRARY_DIRS.$_})			\
    ${LD_LIBRARY_DIRS.$_}))),${LD_LIBRARY_PATH}))
