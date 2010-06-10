# $LAAS: depend.mk 2009/01/21 22:32:39 tho $
#
# Copyright (c) 2009,2010 LAAS/CNRS
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
SAHAND_LIBS_DEPEND_MK:=	${SAHAND_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sahand-libs
endif

ifeq (+,$(SAHAND_DEPEND_MK)) # ---------------------------------------------

PREFER.sahand-libs?=		robotpkg

DEPEND_USE+=			sahand-libs
DEPEND_ABI.sahand-libs?=	sahand-libs>=08.08.14
DEPEND_DIR.sahand-libs?=	../../hardware/sahand-libs

SYSTEM_SEARCH.sahand=	\
	'include/SAHandCtrlApi.h'					\
	'lib/libsahand.so'

endif # SAHAND_LIBS_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
