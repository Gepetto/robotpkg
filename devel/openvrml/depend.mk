# $LAAS: Makefile 2010/07/13 11:55:00 tmoulard $
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
#                                           Thomas Moulard on Tue Jul 13 2010
#


DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENVRML_DEPEND_MK:=	${OPENVRML_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openvrml
endif

ifeq (+,$(OPENVRML_DEPEND_MK)) # -----------------------------------------------

PREFER.openvrml?=		robotpkg

DEPEND_USE+=		openvrml
DEPEND_ABI.openvrml?=	openvrml>=0.18.6
DEPEND_DIR.openvrml?=	../../devel/openvrml

SYSTEM_SEARCH.openvrml=\
	include/openvrml/openvrml-common.h	\
	'lib/libopenvrml{a,so,dylib}'		\
	'lib/pkgconfig/openvrml.pc:/Version/s/[^0-9.]//gp'

endif # OPENVRML_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
