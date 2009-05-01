# $LAAS: depend.mk 2009/04/09 18:23:13 mallet $
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
#                                      Florent Lamiraux 05-01-2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
KPP_INTERFACE_DEPEND_MK:=	${KPP_INTERFACE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			kpp-interface
endif

ifeq (+,$(KPP_INTERFACE_DEPEND_MK)) # ------------------------------------

PREFER.kpp-interface?=	robotpkg

DEPEND_USE+=			kpp-interface

DEPEND_ABI.kpp-interface?=	kpp-interface>=1.6
DEPEND_DIR.kpp-interface?=	../../devel/kpp-interface

SYSTEM_SEARCH.kpp-interface=\
	include/kppInterface/kppInterface.h		\
	'lib/libkppInterface.{a,so}'					\
	'lib/pkgconfig/kppInterface.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
