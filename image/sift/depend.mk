# $LAAS: depend.mk 2009/05/28 18:38:25 mallet $
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
#                                               Nizar Sallem on Thu Jun 03 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SIFT_DEPEND_MK:=	${SIFT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sift
endif

ifeq (+,$(SIFT_DEPEND_MK)) # -----------------------------------------------

PREFER.sift?=		robotpkg

DEPEND_USE+=		sift
DEPEND_ABI.sift?=	sift>=1.1.2
DEPEND_DIR.sift?=	../../image/sift

SYSTEM_SEARCH.sift=\
	include/sift/sift.h	\
	lib/libsift.so

endif # SIFT_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
