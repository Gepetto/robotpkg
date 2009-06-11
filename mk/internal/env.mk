#
# Copyright (c) 2009 LAAS/CNRS
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
# instead of a ?= assignment or, better, by using the 'setdefault' macro.
#
# Note that even without this file, the ?= wouldn't have been effective anyway
# since the value from the environment would have taken precedence.
#
# Use ${MAKE} -e to force envrionment variables to continue overriding
# assigments within makefiles.

_NOENV_VARS=\
	AWK		ANT		BASENAME	CAT		\
	CHOWN		CHMOD		CMAKE		CMP		\
	CONFIG_SITE	CP		DATE		ECHO		\
	EGREP		EXPR		FALSE		FIND		\
	GREP		ID		LS		LN		\
	MKDIR		MV		PAGER		PAX		\
	PYTHON		RM		RMDIR		SED		\
	SETENV		SH		SORT		TAR		\
	TEST		TOUCH		TPUT		TRUE		\
	TSORT		UNAME		WC		XARGS


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
$(foreach _v_, ${_NOENV_VARS}, $(eval $(call unsetenv,${_v_})))
