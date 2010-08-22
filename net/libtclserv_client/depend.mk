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

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBTCLSERV_CLIENT_DEPEND_MK:=	${LIBTCLSERV_CLIENT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libtclserv_client
endif

ifeq (+,$(LIBTCLSERV_CLIENT_DEPEND_MK)) # -------------------------------------------

PREFER.libtclserv_client?=	robotpkg

DEPEND_USE+=		libtclserv_client

DEPEND_ABI.libtclserv_client?=	libtclserv_client>=0.1
DEPEND_DIR.libtclserv_client?=	../../net/libtclserv_client

SYSTEM_SEARCH.libtclserv_client=\
	include/tclserv_client/tclserv_client.h \
	lib/pkgconfig/libtclserv_client.pc	\
	lib/libtclserv_client.la

endif # LIBTCLSERV_CLIENT_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
