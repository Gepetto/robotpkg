#
# Copyright (c) 2006-2009,2011 LAAS/CNRS
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
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
# From $NetBSD: bsd.pkg.barrier.mk,v 1.13 2006/11/03 08:01:04 joerg Exp $
#
#					Anthony Mallet on Wed Dec  6 2006
#

# --- barrier <targets> ----------------------------------------------------
#
# Ouput the appropriate list of targets depending if we are before or after the
# barrier.
#
override define barrier
$(if ${_PKGSRC_BARRIER},$2,$1 barrier)
endef


# --- barrier (PRIVATE) ----------------------------------------------------
#
# barrier is a helper target that can be used to separate targets that should
# be built in a new make process from being built in the current one.  The
# targets that must be built after the "barrier" target invokes a new make
# should be of the form:
#
#	foo: $(call barrier, early dependencies, foo's source dependencies)
#

.PHONY: barrier
barrier:
ifndef _PKGSRC_BARRIER
	${RUN}cd ${CURDIR} && ${RECURSIVE_MAKE}				\
		_PKGSRC_BARRIER=yes ${MAKECMDGOALS}
	@${PHASE_MSG}							\
		"Done$(patsubst %, \`%',${MAKECMDGOALS})"		\
		"for ${PKGNAME}"
endif
