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
#                                             Anthony Mallet on Tue Dec 15 2009
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MESA_DEPEND_MK:=	${MESA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mesa
endif

ifeq (+,$(MESA_DEPEND_MK)) # -----------------------------------------------

PREFER.mesa?=		system

DEPEND_USE+=		mesa

DEPEND_ABI.mesa?=	mesa>=7

SYSTEM_SEARCH.mesa=	\
	'include/GL/gl.h:/*.*Version/s/[^.0-9]//gp'			\
	'lib/libGL.*'

SYSTEM_PKG.Linux-fedora.mesa=	mesa-libGL-devel
SYSTEM_PKG.Linux-ubuntu.mesa=	libgl1-mesa-dev
SYSTEM_PKG.Linux-debian.mesa=	libgl1-mesa-dev
SYSTEM_PKG.NetBSD.mesa=		pkgsrc/graphics/MesaLib

endif # MESA_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
