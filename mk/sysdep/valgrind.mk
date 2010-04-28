#
# Copyright (c) 2010 LAAS/CNRS
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
#                                            Anthony Mallet on Wed Apr 28 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
VALGRIND_DEPEND_MK:=	${VALGRIND_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		valgrind
endif

ifeq (+,$(VALGRIND_DEPEND_MK)) # -------------------------------------------

PREFER.valgrind?=	system

DEPEND_USE+=		valgrind
DEPEND_ABI.valgrind?=	valgrind>=3

DEPEND_METHOD.valgrind+=build
SYSTEM_SEARCH.valgrind=\
	'bin/valgrind:s/[^0-9.]//gp:% --version'		\
	'include/valgrind/valgrind.h'				\
	'lib/pkgconfig/valgrind.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Linux-fedora.valgrind=	valgrind-devel
SYSTEM_PKG.Linux-ubuntu.valgrind=	valgrind
SYSTEM_PKG.Linux-debian.valgrind=	valgrind

export VALGRIND=	${PREFIX.valgrind}/bin/valgrind

endif # VALGRIND_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
