# $LAAS: w3m.mk 2009/01/18 22:51:48 tho $
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
#                                             Anthony Mallet on Sun Jan 18 2009
#

DEPEND_DEPTH:=	${DEPEND_DEPTH}+
W3M_DEPEND_MK:=	${W3M_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	w3m
endif

ifeq (+,$(W3M_DEPEND_MK)) # ------------------------------------------------

PREFER.w3m?=	system
DEPEND_USE+=	w3m
DEPEND_ABI.w3m?=w3m>=0.5

SYSTEM_SEARCH.w3m=	\
	'bin/w3m:s|.*w3m/\([0-9.]\{1,\}\).*|\1|p:% -version'

W3M=		${PREFIX.w3m}/bin/w3m

endif # W3M_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
