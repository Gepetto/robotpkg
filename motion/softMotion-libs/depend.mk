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
#                                            Xavier BROQUERE on Fri Feb 26 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PA10LIBS_DEPEND_MK:=	${SOFTMOTIONLIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		softMotion-libs
endif

ifeq (+,$(SOFTMOTIONLIBS_DEPEND_MK)) # -------------------------------------
PREFER.softMotion-libs?=	robotpkg

DEPEND_USE+=		softMotion-libs

DEPEND_ABI.softMotion-libs?=	softMotion-libs>=0.1
DEPEND_DIR.softMotion-libs?=	../../motion/softMotion-libs

SYSTEM_SEARCH.softMotion-libs=\
	include/softMotion/softMotion.h \   				\
	lib/libsoftMotion.so

endif # SOFTMOTIONLIBS_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
