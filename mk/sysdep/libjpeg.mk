#
# Copyright (c) 2010-2011 LAAS/CNRS
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
LIBJPEG_DEPEND_MK:=	${LIBJPEG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libjpeg
endif

ifeq (+,$(LIBJPEG_DEPEND_MK)) # --------------------------------------------

PREFER.libjpeg?=	system

DEPEND_USE+=		libjpeg

DEPEND_ABI.libjpeg?=	libjpeg

SYSTEM_SEARCH.libjpeg=	\
	'include/jpeglib.h'	\
	'lib/libjpeg.{a,so}'

SYSTEM_PKG.Fedora.libjpeg=	libjpeg-devel
SYSTEM_PKG.Ubuntu.libjpeg=	libjpeg-dev
SYSTEM_PKG.Debian.libjpeg=	libjpeg-dev
SYSTEM_PKG.NetBSD.libjpeg=		pkgsrc/graphics/jpeg

endif # LIBJPEG_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
