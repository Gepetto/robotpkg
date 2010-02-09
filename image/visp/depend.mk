##
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
#                                              Thomas Moulard on Thu Feb 4 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
VISP_DEPEND_MK:=	${VISP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		visp
endif

ifeq (+,$(VISP_DEPEND_MK)) # -----------------------------------------------

PREFER.visp?=		robotpkg

DEPEND_USE+=		visp

DEPEND_ABI.visp?=	visp>=2.4.4
DEPEND_DIR.visp?=	../../image/visp

SYSTEM_SEARCH.visp=\
	'bin/visp-config:p:% --dumpversion'	\
	'include/visp/vpConfig.h'		\
	'lib/libvisp-2.{a,so,dylib}'

endif # VISP_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
