#
# Copyright (c) 2006,2008-2011,2013,2016,2019,2022-2023 LAAS/CNRS
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
# THIS SOFTWARE IS PROVIDED BY THE  AUTHOR AND CONTRIBUTORS ``AS IS'' AND
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
#                                       Anthony Mallet on Sat Dec  2 2006
#

ifndef MK_ROBOTPKG_MACROS
MK_ROBOTPKG_MACROS:=	defined

define isyes
$(filter yes Yes YES,$(1))
endef

define isno
$(filter no No NO,$(1))
endef

# --- setdefault <var> <value> ---------------------------------------------
#
# Set <var> to <value> if <var> is empty.
#
override define setdefault
$(eval ifeq (,$$(value $1))
override $1:=$2
endif)
endef


# --- exists <file> --------------------------------------------------
#
# Return 'yes' if <file> exists, 'no' otherwise
#
override define exists
$(if $(wildcard $1),yes,no)
endef


# --- -require <file> ------------------------------------------------------
#
# Include <file> if it was not already included and it exists
#
override define -require
$(foreach f,$1,$(if $(filter $f,${MAKEFILE_LIST}),,$(eval -include $f)))
endef


# --- require <file> -------------------------------------------------------
#
# Include <file> if it was not already included
#
override define require
$(foreach f,$1,$(if $(filter $f,${MAKEFILE_LIST}),,$(eval include $f)))
endef


# --- require-for <target> <file> ------------------------------------------
#
# Include <file> if it was not already included and if the MAKECMDGOALS contain
# <target>
#
override define require-for
$(if $(filter $1,${MAKECMDGOALS} ${EXPECT_TARGETS}),$(call require,$2))
endef


# --- only-for <target> <data> ---------------------------------------------
#
# Expands to <data> only if <target> was specified on the command line.
#
override define only-for
$(if $(filter $1,${MAKECMDGOALS}),$2)
endef


# --- substs <from list>,<to list>,<string> --------------------------
#
# Substitute in the <string> each string in the first list by its
# replacement in the second list.
#
override define substs
$(if $1,$(subst $(firstword $1),$(firstword $2),$(call \
	substs,$(wordlist 2,$(words $1),$1),$(wordlist 2,$(words $2),$2),$3)),$3)
endef


# --- tolower <string> -----------------------------------------------
#
# Substitute in the <string> each character from A-Z to a-z
#
override define tolower
$(call substs,A B C D E F G H I J K L M N O P Q R S T U V W X Y Z,	\
	      a b c d e f g h i j k l m n o p q r s t u v w x y z,$1)
endef


# --- clean <string> -----------------------------------------------
#
# Substitute non-alpha chars in <string> to _
#
override define clean
$(call substs,/ -,_ _,$1)
endef


# --- quote <string> -------------------------------------------------
#
# Escape shell's meta-charaters in string
#
override _quote:='#'
override define _nl


endef
override define quote
${_quote}$(subst ${_quote},'\${_quote}',$(subst ${_nl}, ,$1))${_quote}
endef


# --- cdr <list> -----------------------------------------------------------
#
# Return all but the first element of <list>
#
override define cdr
$(wordlist 2,$(words $1),$1)
endef


# --- concat <list> [<string>] ---------------------------------------------
#
# Join words of the <list> with <string> or ',' if string is not specified
#
override _comma:=,
override define concat
$(strip $(subst ${_empty} ${_empty},$(or $2,${_comma}),$1))
endef


# --- wordn <word> <list> --------------------------------------------------
#
# Return the position in <list> where <word> appears first, counting from 1, or
# empty if word does not appear in <list>.
#
define wordn
$(strip $(if $2,$(if $(filter $1,$(word 1,$2)),$(words . $3),\
  $(call wordn,$1,$(call cdr,$2),. $3))))
endef


# --- iterate <count> <expr> -----------------------------------------
#
# Expand <expr> <count> times.
# Currently, <count> must be less than 8, but this limit can be easily
# expanded in the code below by adding more dots in the list.
#
override define iterate
$(foreach -,$(wordlist 1,$(1),. . . . . . . .),$(2))
endef


# --- prepend <item> <list> ------------------------------------------
#
# Append <item> to the beginning of <list>, removing duplicates.
#
override define prepend
$(strip $1 $(filter-out $1,$2))
endef


# --- append <item> <list> -------------------------------------------
#
# Append <item> to the end of <list>, if not already in the list.
#
override define append
$(strip $(if $(filter $1,$2),$2,$2 $1))
endef


# --- lappend <item-list> <list> -------------------------------------
#
# Append <item-list> to the end of <list> except for elements of
# <item-list> already in the list.
#
override define lappend
$(if $1,$(call lappend,$(wordlist 2,$(words $1),$1),$(call \
	append,$(firstword $1),$2)),$2)
endef


# --- prependpath <path> <path-list> ---------------------------------
#
# Prepend <path> in front of <path-list>, inserting a colon if
# <path-list> is not empty and removing duplicates.
# If <path> does not exist, <path-list> is returned as-is.
#
override define prependpath
$(subst $  ,:,$(call prepend,$(realpath $1),$(subst :, ,$2)))
endef


# --- prependpaths <path-list> <path-list> ---------------------------
#
# Same as prependpath, but for a list of paths.
#
override define prependpaths
$(if $1,$(call prependpaths,$(wordlist 2,$(words $1),. $1),$(call \
	prependpath,$(lastword $1),$2)),$2)
endef


# --- pathsearch <file(s)> <path> ------------------------------------
#
# Look for file $1 in path $2, returning the first match. path can be a
# colon-separated or space-separated list of directories.
#
override define pathsearch
$(firstword $(realpath $(addsuffix /$1,$(subst :, ,$2))))
endef


# --- pkgpath <path> -------------------------------------------------------
#
# Return the PKGPATH (path relative to ROBOTPKG_DIR) for a package in path.
#
override define pkgpath
$(subst ${ROBOTPKG_DIR}/,,$(realpath $1))
endef


# --- add-barrier <phase> <target> -----------------------------------------
#
# Register that the toplevel <target> needs to run after the barrier <phase>
#
override define add-barrier
$(if ${_COOKIE.$(strip $1)},$1 $(eval _barrier.$(strip $1)+=$2),	\
  $(error undefined barrier '$(strip $1)'))
endef


# --- wordwrapfilter -------------------------------------------------
#
# Shell filter to print wrap long lines at 40 characters
#
override define wordwrapfilter
 ${XARGS} -n 1 | ${AWK} '					\
	BEGIN { printwidth = 40; line = "" }			\
	{							\
		if (length(line) > 0)				\
			line = line" "$$0;			\
		else						\
			line = $$0;				\
		if (length(line) > 40) {			\
			print "	"line;				\
			line = "";				\
		}						\
	}							\
	END { if (length(line) > 0) print "	"line }		\
 '
endef

define _OVERRIDE_TARGET
@:;case $*"" in "-") ;; *) ${ECHO} "don't know how to make $@."; exit 2;; esac
endef


# --- cache <name> <value> -------------------------------------------------
#
# Caching values to avoid expensive calls
#
override define cache
$(foreach _,$1,$(if $(filter undefined,$(origin _cache_$_)),$(eval	\
  _cache_$_ := $2))${_cache_$_})
endef


# --- preduce --------------------------------------------------------------

# Distill a version requirement list into a single interval that is the
# satifies all the requirements. The input list shall be in the form of >=,
# == and <= constraints. (!= is recognized, but kinda weird :)
#
override define preduce
$(call cache,$(subst $$,,$(subst =,_,$(subst				\
  $  ,__,$1))),$$(shell ${AWK}						\
  $(addprefix -f ${ROBOTPKG_DIR}/mk/internal/,libdewey.awk dewey.awk)	\
  reduce '$1'))
endef


# --- pmatch --------------------------------------------------------------

# Match a package pattern against a specific version
#
override define pmatch
$(shell ${AWK}								\
  $(addprefix -f ${ROBOTPKG_DIR}/mk/internal/,libdewey.awk dewey.awk)	\
  pmatch '$1' '$2')
endef


# --- pgetopts -------------------------------------------------------------

# Get required/excluded options from a package pattern
#
override define pgetopts
$(shell ${AWK}								\
  $(addprefix -f ${ROBOTPKG_DIR}/mk/internal/,libdewey.awk dewey.awk)	\
  getopts '$1' '$2')
endef


# --- sh -------------------------------------------------------------------

# Like $(shell ...), except that it works also with LOGFILTER-enabled rules.
# Since those rules redefine the SHELL variable and redirect stdout
# to the log filter, this breaks $(shell ...) when called in that context.
#
# This function takes advantage of the $(foreach ...) function that binds its
# variables locally and overrides the target specific SHELL variable used in
# the LOGFILTER context. The $(let ...) function cannot be used as it is not
# supported by older GNU make versions that are still in use.
#
override define sh
$(foreach SHELL,${SH},$(foreach .SHELLFLAGS,-c,$(shell $1)))
endef

endif # MK_ROBOTPKG_MACROS
