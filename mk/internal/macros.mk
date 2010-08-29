#
# Copyright (c) 2006,2008-2010 LAAS/CNRS
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
$(foreach f,$1,$(if $(wildcard $f),$(call require, $f)))
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
$(if $(realpath $1),$(if $(strip $2),$(subst ::,:,$1:$(subst $1,,$(strip $2))),$1),$2)
endef


# --- prependpaths <path-list> <path-list> ---------------------------
#
# Same as prependpath, but for a list of paths.
#
override define prependpaths
$(if $1,$(call prependpaths,$(wordlist 2,$(words $1),. $1),$(call \
	prependpath,$(lastword $1),$2)),$2)
endef


# --- syslibpath <path-list> -----------------------------------------------
#
# Append SYSLIBSUFFIX to /usr/lib and /lib.
#
override define syslibpath
$(patsubst /lib%,/lib${SYSLIBSUFFIX}%,$(patsubst				\
	/usr/lib%,/usr/lib${SYSLIBSUFFIX}%,$1))
endef


# --- pathsearch <file(s)> <path> ------------------------------------
#
# Look for file in path, returning the first match. If file is a list of file,
# the function returns the full path for all files. path can be a
# colon-separated or space-separated list of directories.
#
# As a special case, if a file is not found in /usr/lib, it is also searched in
# /lib. For those two directories, we add the SYSLIBSUFFIX.
#
override define pathsearch
$(strip $(foreach f,$1,$(firstword 						\
	$(or $(wildcard $(call syslibpath,$(addsuffix /$f,$(subst :, ,$2)))),	\
	     $(wildcard $(call syslibpath,$(subst				\
		/usr/lib,/lib,$(addsuffix /$f,$(subst :, ,$2)))))))))
endef


# --- prefixsearch <file(s)> <path> ----------------------------------
#
# Look for file in path, returning the prefix of the first match.
# See pathsearch.
#
override define prefixsearch
$(firstword $(foreach p,$(subst :, ,$2),$(if $(call pathsearch,$1,$p),$p)))
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


# --- versionreqd ----------------------------------------------------------

# Distill a version requirement list into a single value that is the
# strictest of the versions required. The input list shall be in the form of >=
# and <= constraints.
#
override define _versionreqd
  $(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)

  # split constraints into <= and >= categories
  _equ_:=$(patsubst -%,%,$(filter-out <%,$(filter-out >%,$2)))
  _min_:=$(sort $(filter >%,$2) $(addprefix >=,${_equ_}))
  _max_:=$(sort $(filter <%,$2) $(addprefix <=,${_equ_}))

  # find out the strictest constraint of type >=, please breathe
  _maxmin_:=\
    $$(firstword $$(foreach _rqd_,$${_min_},$$(if $$(strip		\
    $$(foreach _sat_,$$(filter-out $${_rqd_},$${_min_} $${_max_}),$$(shell\
    $${PKG_ADMIN} pmatch 'x$${_sat_}' 'x-$$(call substs,> >=,,$${_rqd_})' ||\
    echo no))),,$${_rqd_})))

  # breathe, then find out the strictest constraint of type <=
  _minmax_:=\
    $$(firstword $$(foreach _rqd_,$${_max_},$$(if $$(strip		\
    $$(foreach _sat_,$$(filter-out $${_rqd_},$${_min_} $${_max_}),$$(shell\
    $${PKG_ADMIN} pmatch 'x$${_sat_}' 'x-$$(call substs,< <=,,$${_rqd_})' ||\
    echo no))),,$${_rqd_})))

  # result is the union of both
  $1:=$${_maxmin_}$${_minmax_}
endef
override define versionreqd
$(strip $(eval $(call _versionreqd,_r_,$1)) ${_r_})
endef

endif # MK_ROBOTPKG_MACROS
