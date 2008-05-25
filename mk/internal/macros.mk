# $LAAS: macros.mk 2008/05/25 00:18:30 tho $
#
# Copyright (c) 2006,2008 LAAS/CNRS
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

define isyes
$(filter yes Yes YES,$(1))
endef

define isno
$(filter no No NO,$(1))
endef

define exists
$(shell test -e $(1) && echo yes || echo no)
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


# --- quote <string> -------------------------------------------------
#
# Escape shell's meta-charaters in string
#
empty=
space=$(empty) $(empty)
tab=$(empty)	$(empty)
quotechars= = & { } ( ) [ ] | * < > $ , ' ` " \ # for fontify: "`'
override define quote
$(subst $(tab),\$(tab),$(subst $(space),\$(space),$(call \
	substs,$(quotechars),$(addprefix \,$(quotechars)),$1)))
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


# --- prependpath <path> <path-list> ---------------------------------
#
# Prepend <path> in front of <path-list>, inserting a semi-colon if
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


# --- pathsearch <file(s)> <path> ------------------------------------
#
# Look for file in path, returning the first match. If file is a list of
# file, the function returns the full path for all files. path can be a
# colon-separated or space-separated list of directories.
#
# As a special case, if a file is not found in /usr/lib, it is also search in /lib
#
override define pathsearch
$(foreach f,$(1),$(firstword \
	$(or $(wildcard $(addsuffix /$(f),$(subst :, ,$(2)))),\
	     $(wildcard $(subst /usr/lib,/lib,$(addsuffix /$(f),$(subst :, ,$(2))))))))
endef


# --- prefixsearch <file(s)> <path> ----------------------------------
#
# Look for file in path, returning the prefix of the first match.
# See pathsearch.
#
override define prefixsearch
$(strip $(foreach p,$(subst :, ,$(2)),\
	$(if $(strip $(foreach f,$(1),\
		$(if $(or $(wildcard $(p)/$(f)),\
			  $(wildcard $(subst /usr/lib,/lib,$(p)/$(f)))),X))),$(p))))
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
