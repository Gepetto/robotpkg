# $LAAS: depend.mk 2009/04/09 18:25:25 mallet $
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
#                                             Anthony Mallet on Thu Apr  9 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
NETSHRING_DEPEND_MK:=	${NETSHRING_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		netshring
endif

ifeq (+,$(NETSHRING_DEPEND_MK)) # ------------------------------------------

PREFER.netshring?=	robotpkg

DEPEND_USE+=		netshring

DEPEND_ABI.netshring?=	netshring>=1.2
DEPEND_DIR.netshring?=	../../architecture/netshring

SYSTEM_SEARCH.netshring=\
	include/netshring.h						\
	'lib/libnetshring.{a,so}'					\
	'lib/pkgconfig/netshring.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
