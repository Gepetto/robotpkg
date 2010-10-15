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

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
XENOMAI_DEPEND_MK:=	${XENOMAI_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		xenomai
endif

ifeq (+,$(XENOMAI_DEPEND_MK)) # -------------------------------------------

PREFER.xenomai?=	system

DEPEND_USE+=		xenomai
DEPEND_ABI.xenomai?=	xenomai>=2.5.3

DEPEND_METHOD.xenomai+=build
SYSTEM_SEARCH.xenomai=\
	'bin/xeno-config:s/[^0-9.]//;p:% --version'		\
	'include/xenomai/xeno_config.h'				\
	'lib/libxenomai.la'

endif # XENOMAI_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
