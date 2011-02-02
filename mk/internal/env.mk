#
# Copyright (c) 2009,2011 LAAS/CNRS
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

# Clean unwanted variables inherited from the environment.
#
# Variables cleaned by this file must be further set with an 'ifndef' construct
# instead of a ?= assignment or, better, by using the 'setdefault'
# macro. gmake-3.82 has an interesting 'undefine' command, but many systems
# still have 3.81, so ...
#
# Note that even without this file, the ?= wouldn't have been effective anyway
# since the value from the environment would have taken precedence.

_ENV_VARS=\
	ROBOTPKG_BASE ROBOTPKG_DIR PATH TERM TERMCAP DISPLAY XAUTHORITY	\
	SSH_AUTH_SOCK MAKELEVEL MAKEOVERRIDES MFLAGS



# --- unsetenv -------------------------------------------------------------
#
# Undef (set to empty) a variable that was inherited from the environment and
# unexport it, so that it looks like it wasn't in the environment initially.
#
override define unsetenv
  ifeq (environment,$(origin $1))
    $1=
    unexport $1
  endif
endef

# unsetenv each unwanted var
$(foreach _v_,$(filter-out ${_ENV_VARS},${.VARIABLES}),$(eval \
	$(call unsetenv,${_v_})))


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
