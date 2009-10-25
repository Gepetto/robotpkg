#
# Copyright (c) 2006-2009 LAAS/CNRS
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

# _BARRIER_PRE_TARGETS is a list of the targets that must be built before
#	the "barrier" target invokes a new make.
#
_BARRIER_PRE_TARGETS=	makedirs
_BARRIER_PRE_TARGETS+=	interactive
_BARRIER_PRE_TARGETS+=	resolve-depends
_BARRIER_PRE_TARGETS+=	checksum
_BARRIER_PRE_TARGETS+=	depends

$(call require,${ROBOTPKG_DIR}/mk/checksum/checksum-vars.mk)


# _BARRIER_POST_TARGETS is a list of the targets that must be built after
#	the "barrier" target invokes a new make.  This list is specially
#	ordered so that if more than one is specified on the command-line,
#	then robotpkg will still do the right thing.
#
_BARRIER_POST_TARGETS=	tools
_BARRIER_POST_TARGETS+=	extract
_BARRIER_POST_TARGETS+=	patch
_BARRIER_POST_TARGETS+=	checkout
_BARRIER_POST_TARGETS+=	configure
_BARRIER_POST_TARGETS+=	build
_BARRIER_POST_TARGETS+=	test
_BARRIER_POST_TARGETS+=	all
_BARRIER_POST_TARGETS+=	install
_BARRIER_POST_TARGETS+=	reinstall
_BARRIER_POST_TARGETS+=	replace
_BARRIER_POST_TARGETS+=	package
_BARRIER_POST_TARGETS+=	repackage
_BARRIER_POST_TARGETS+=	print-PLIST

_BARRIER_CMDLINE_TARGETS+=$(filter ${_BARRIER_POST_TARGETS},${MAKECMDGOALS})


# --- barrier (PRIVATE) ----------------------------------------------
#
# barrier is a helper target that can be used to separate targets
# that should be built in a new make process from being built in
# the current one.  The targets that must be built after the "barrier"
# target invokes a new make should be listed in _BARRIER_POST_TARGETS,
# and should be of the form:
#
#	ifndef _PKGSRC_BARRIER
#	foo: barrier
#	else
#	foo: foo's real source dependencies
#	endif
#
# Note that none of foo's real source dependencies should include
# targets that occur before the barrier.
#

.PHONY: barrier
barrier: ${_BARRIER_PRE_TARGETS}
ifndef _PKGSRC_BARRIER
	${RUN}cd ${CURDIR} && ${RECURSIVE_MAKE}				\
		_PKGSRC_BARRIER=yes ${_BARRIER_CMDLINE_TARGETS}
	@${PHASE_MSG}							\
		"Done$(patsubst %, \`%',${_BARRIER_CMDLINE_TARGETS})"	\
		"for ${PKGNAME}"
endif
