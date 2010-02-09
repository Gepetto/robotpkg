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
LIBPNG_DEPEND_MK:=	${LIBPNG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libpng
endif

ifeq (+,$(LIBPNG_DEPEND_MK)) # ---------------------------------------------

PREFER.libpng?=		system

DEPEND_USE+=		libpng

DEPEND_ABI.libpng?=	libpng>=1

SYSTEM_SEARCH.libpng=	\
	'include/png.h'						\
	'lib/pkgconfig/libpng.pc:/Version/s/[^.0-9]//gp'	\
	'lib/libpng.{a,so,dylib}'

SYSTEM_PKG.Linux-fedora.libpng=	libpng-devel
SYSTEM_PKG.Linux-ubuntu.libpng=	libpng-dev
SYSTEM_PKG.Linux-debian.libpng=	libpng-dev
SYSTEM_PKG.NetBSD.libpng=	pkgsrc/graphics/png

endif # LIBPNG_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
