# $LAAS: depend.mk 2009/01/21 22:32:39 tho $
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
#                                             Anthony Mallet on Wed Jan 21 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SAHAND_DEPEND_MK:=	${SAHAND_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sahand
endif

ifeq (+,$(SAHAND_DEPEND_MK)) # ---------------------------------------------

PREFER.sahand?=		robotpkg

DEPEND_USE+=		sahand
DEPEND_ABI.sahand?=	sahand>=2008.1.10
DEPEND_DIR.sahand?=	../../hardware/sahand

SYSTEM_SEARCH.sahand=	\
	'include/SAHandCtrlApi.h'					\
	'lib/libsahand_api_41.a'

endif # SAHAND_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
