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
#                                             Anthony Mallet on Thu Mar 12 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TRANSGEN_DEPEND_MK:=	${TRANSGEN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		transgen
endif

ifeq (+,$(TRANSGEN_DEPEND_MK)) # -------------------------------------------

PREFER.transgen?=	robotpkg

DEPEND_USE+=		transgen

DEPEND_ABI.transgen?=	transgen>=1.0b1
DEPEND_DIR.transgen?=	../../architecture/transgen

SYSTEM_SEARCH.transgen=\
	bin/transgen			\
	include/transgen/oprs-com.h	\
	lib/pkgconfig/transgen.pc	\
	lib/liboprs-com.a

export TRANSGEN?=	${PREFIX.transgen}/bin/transgen

endif # TRANSGEN_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
