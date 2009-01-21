# $LAAS: depend.mk 2009/01/21 22:06:04 tho $
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
#                                             Matthieu Herrb on Wed Jan 21 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
CLONEGENOM_DEPEND_MK:=	${CLONEGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		clone-genom
endif

ifeq (+,$(CLONEGENOM_DEPEND_MK))
PREFER.clone-genom?=	robotpkg

DEPEND_USE+=		clone-genom

DEPEND_ABI.clone-genom?=	clone-genom>=0.1
DEPEND_DIR.clone-genom?=	../../audio/clone-genom

SYSTEM_SEARCH.clone-genom=\
	include/clone/cloneStruct.h		\
	'lib/pkgconfig/clone.pc:/Version/s/[^0-9.]*//p'
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
