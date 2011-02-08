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
LIBXML2_DEPEND_MK:=	${LIBXML2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libxml2
endif

ifeq (+,$(LIBXML2_DEPEND_MK)) # --------------------------------------------

PREFER.libxml2?=	system

DEPEND_USE+=		libxml2

DEPEND_ABI.libxml2?=	libxml2>=2

SYSTEM_SEARCH.libxml2=	\
 'include/libxml2/libxml/xmlversion.h:/LIBXML_DOTTED_VERSION.*"/s/[^.0-9]//gp'	\
 'lib/pkgconfig/libxml-2.0.pc:/Version/s/[^.0-9]//gp'				\
 'lib/libxml2.{a,so}'

SYSTEM_PKG.Linux-fedora.libxml2=	libxml2-devel
SYSTEM_PKG.Linux-ubuntu.libxml2=	libxml2-dev
SYSTEM_PKG.Linux-debian.libxml2=	libxml2-dev
SYSTEM_PKG.NetBSD.libxml2=		pkgsrc/textproc/libxml2

endif # LIBXML2_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
