#
# Copyright (c) 2011 LAAS/CNRS
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
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
POPT_DEPEND_MK:=	${POPT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		popt
endif

ifeq (+,$(POPT_DEPEND_MK)) # --------------------------------------------

PREFER.popt?=	system

DEPEND_USE+=		popt
DEPEND_ABI.popt?=	popt>=0

SYSTEM_PKG.Linux-fedora.popt=	popt-devel
SYSTEM_PKG.Linux-ubuntu.popt=	libpopt-dev
SYSTEM_PKG.NetBSD.popt=		pkgsrc/devel/popt

SYSTEM_SEARCH.popt=\
	'include/popt.h'\
	'lib/libpopt.{a,so,dylib}'


endif # POPT_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
