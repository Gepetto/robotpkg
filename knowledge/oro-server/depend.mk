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
#                                          S�verin Lemaignan on Mon Jul  6 2009
#


DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OROSERVER_DEPEND_MK:=	${OROSERVER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		oro-server
endif

ifeq (+,$(OROSERVER_DEPEND_MK)) # -----------------------------------------------

PREFER.oro-server?=		robotpkg

DEPEND_USE+=		oro-server
DEPEND_ABI.oro-server?=	oro-server>=0.7.0
DEPEND_DIR.oro-server?=	../../knowledge/oro-server

SYSTEM_SEARCH.oro-server=\
	bin/oro-server

endif # OROSERVER_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
