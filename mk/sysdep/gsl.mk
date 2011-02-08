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
#                                            Anthony Mallet on Tue Feb  9 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GSL_DEPEND_MK:=		${GSL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gsl
endif

ifeq (+,$(GSL_DEPEND_MK)) # ------------------------------------------------

PREFER.gsl?=		system

DEPEND_USE+=		gsl

DEPEND_ABI.gsl?=	gsl>=1

SYSTEM_SEARCH.gsl=	\
	'include/gsl/gsl_version.h:/GSL_VERSION[^_]/s/[^.0-9]//gp'	\
	'lib/pkgconfig/gsl.pc:/Version/s/[^.0-9]//gp'			\
	'lib/libgsl.{a,so}'

SYSTEM_PKG.Linux-fedora.gsl=	gsl-devel
SYSTEM_PKG.Linux-ubuntu.gsl=	libgsl0-dev
SYSTEM_PKG.Linux-debian.gsl=	libgl1-gsl-dev
SYSTEM_PKG.NetBSD.gsl=		pkgsrc/math/gsl

endif # GSL_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

