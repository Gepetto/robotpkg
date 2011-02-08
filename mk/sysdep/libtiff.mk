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
#                                             Anthony Mallet on Tue Apr 27 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBTIFF_DEPEND_MK:=	${LIBTIFF_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libtiff
endif

ifeq (+,$(LIBTIFF_DEPEND_MK)) # --------------------------------------------

PREFER.libtiff?=	system

DEPEND_USE+=		libtiff

DEPEND_ABI.libtiff?=	libtiff>=3

SYSTEM_SEARCH.libtiff=	\
	'include/tiffvers.h:/VERSION_STR/{s/\\\\n.*$$//;s/[^0-9.]//g;p;}' \
	'lib/libtiff.{a,so}'

SYSTEM_PKG.Linux-fedora.libtiff=	libtiff-devel
SYSTEM_PKG.Linux-ubuntu.libtiff=	libtiff-dev
SYSTEM_PKG.Linux-debian.libtiff=	libtiff-dev
SYSTEM_PKG.NetBSD.libtiff=		pkgsrc/graphics/tiff

endif # LIBTIFF_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
