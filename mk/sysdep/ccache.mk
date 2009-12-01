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
#                                             Anthony Mallet on Sat Nov 28 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
CCACHE_DEPEND_MK:=	${CCACHE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ccache
endif

ifeq (+,$(CCACHE_DEPEND_MK)) # ---------------------------------------------

PREFER.ccache?=		system

DEPEND_USE+=		ccache
DEPEND_ABI.ccache?=	ccache>=2
DEPEND_METHOD.ccache+=	build
SYSTEM_SEARCH.ccache=	'bin/ccache:/version/s/[^.0-9]//gp:% -V'

export CCACHE=		${PREFIX.ccache}/bin/ccache

endif # CCACHE_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
