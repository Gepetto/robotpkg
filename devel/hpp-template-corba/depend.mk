# $LAAS: depend.mk 2009/04/09 18:23:13 mallet $
#
# Copyright (c) 2010 CNRS
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
#                                      Florent Lamiraux on June 13, 2010
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HPP_TEMPLATE_CORBA_DEPEND_MK:=	${HPP_TEMPLATE_CORBA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			hpp-template-corba
endif

ifeq (+,$(HPP_TEMPLATE_CORBA_DEPEND_MK)) # ------------------------------------

PREFER.hpp-template-corba?=	robotpkg

DEPEND_USE+=			hpp-template-corba

DEPEND_ABI.hpp-template-corba?=	hpp-template-corba>=0.4
DEPEND_DIR.hpp-template-corba?=	../../devel/hpp-template-corba

SYSTEM_SEARCH.hpp-template-corba=\
	include/hpp/corba/template/server.hh				\
	'lib/pkgconfig/hpp-template-corba.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
