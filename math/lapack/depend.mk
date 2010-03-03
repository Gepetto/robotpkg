#
# Copyright (c) 2008-2010 LAAS/CNRS
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
#                                             Anthony Mallet on Mon Apr  7 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LAPACK_DEPEND_MK:=	${LAPACK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		lapack
endif

ifeq (+,$(LAPACK_DEPEND_MK)) # ---------------------------------------

PREFER.lapack?=		system

DEPEND_USE+=		lapack

DEPEND_ABI.lapack?=	lapack>=3.1.0
DEPEND_DIR.lapack?=	../../math/lapack

SYSTEM_SEARCH.lapack=	'lib/liblapack.*'

SYSTEM_PKG.Linux-fedora.lapack=	lapack-devel
SYSTEM_PKG.Linux-ubuntu.lapack=	liblapack-dev
SYSTEM_PKG.Linux-debian.lapack=	liblapack-dev

endif # LAPACK_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
