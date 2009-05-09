# $LAAS: depend.mk 2009/04/09 18:09:24 mallet $
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
#                                             Florent Lamiraux on Wed Apr  29 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
IPOPT_DEPEND_MK:=${IPOPT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	ipopt
endif

ifeq (+,$(IPOPT_DEPEND_MK)) # ------------------------------

PREFER.ipopt?=	robotpkg

DEPEND_USE+=			ipopt

DEPEND_ABI.ipopt?=	ipopt>=3.6.1
DEPEND_DIR.ipopt?=	../../optimization/ipopt

SYSTEM_SEARCH.ipopt=\
	include/coin/config_ipopt.h		\
	lib/libipopt.so

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
