# $LAAS: depend.mk 2009/01/21 22:58:42 tho $
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
#                                             Anthony Mallet on Wed Jan 21 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
JIDOGRIP_LIBS_DEPEND_MK:=	${JIDOGRIP_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			jidogrip-libs
endif

ifeq (+,$(JIDOGRIP_LIBS_DEPEND_MK)) # --------------------------------------

PREFER.jidogrip-libs?=		robotpkg

DEPEND_USE+=			jidogrip-libs
DEPEND_ABI.jidogrip-libs?=	jidogrip-libs>=1.1
DEPEND_DIR.jidogrip-libs?=	../../hardware/jidogrip-libs

SYSTEM_SEARCH.jidogrip-libs=	\
	'include/jidogrip.h'
	'lib/libjidogrip.la'
	'lib/pkgconfig/libjidogrip.pc:/Version/s/[^0-9.]//gp'

endif # JIDOGRIP_LIBS_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
