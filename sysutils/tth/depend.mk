# $LAAS: depend.mk 2009/01/19 17:11:02 mallet $
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
#                                             Anthony Mallet on Mon Jan 12 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TTH_DEPEND_MK:=		${TTH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tth
endif

ifeq (+,$(TTH_DEPEND_MK)) # ------------------------------------------------

PREFER.tth?=		robotpkg

DEPEND_USE+=		tth

DEPEND_METHOD.tth?=	build
DEPEND_ABI.tth?=	tth>=3.85
DEPEND_DIR.tth?=	../../sysutils/tth

SYSTEM_SEARCH.tth=	\
	'bin/tth:/TtH.*Version/{s/(c).*$$//;s/[^0-9.]//gp;}:% -h'

export TTH=		${PREFIX.tth}/bin/tth

endif # TTH_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
