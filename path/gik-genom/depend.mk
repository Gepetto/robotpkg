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
#                                            Anthony Mallet on Wed Mar 24 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GIK_GENOM_DEPEND_MK:=	${GIK_GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gik-genom
endif

ifeq (+,$(GIK_GENOM_DEPEND_MK)) # ------------------------------------------

PREFER.gik-genom?=	robotpkg

DEPEND_USE+=		gik-genom

DEPEND_ABI.gik-genom?=	gik-genom>=1.5.1r2
DEPEND_DIR.gik-genom?=	../../path/gik-genom

SYSTEM_SEARCH.gik-genom=\
	include/gik/gikStruct.h					\
	'lib/pkgconfig/gik.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

