#
# Copyright (c) 2006,2008-2011 LAAS/CNRS
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
$(if $(value $1),,$(eval $1=$2))
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
$(if $(filter $1,${MAKECMDGOALS}),$(call require,$2))
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


# --- quote <string> -------------------------------------------------
#
# Escape shell's meta-charaters in string
#
override _quote:='#'
override define quote
${_quote}$(subst ${_quote},'\${_quote}',$1)${_quote}
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
$(strip $(if $(realpath $1),$(if $(strip $2),				\
  $(subst $(_empty) $(_empty),:,					\
  $(realpath $1) $(filter-out $(realpath $1),$(subst :, ,$2))),		\
  $1),$2))
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
@case $*"" in "-") ;; *) ${ECHO} "don't know how to make $@."; exit 2;; esac
endef


# --- preduce --------------------------------------------------------------

# Distill a version requirement list into a single interval that is the
# satifies all the requirements. The input list shall be in the form of >=,
# == and <= constraints. (!= is recognized, but kinda weird :)
#
override define preduce
$(shell ${AWK} -f ${ROBOTPKG_DIR}/mk/internal/dewey.awk reduce '$1')
endef


# --- pmatch --------------------------------------------------------------

# Match a package pattern against a specific version
#
override define pmatch
$(shell ${AWK} -f ${ROBOTPKG_DIR}/mk/internal/dewey.awk pmatch '$1' '$2')
endef


# --- unexport-empty -------------------------------------------------------

# Unexport a variable if it's empty
#
override define _unexport-empty
  ifeq (file,$$(origin $1))
    ifeq (,$$(strip $${$1}))
      unexport $1
    endif
  endif
endef
override define unexport-empty
$(eval $(call _unexport-empty,$1))
endef

endif # MK_ROBOTPKG_MACROS
