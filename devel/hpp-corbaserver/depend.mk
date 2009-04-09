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
#                                      Anthony Mallet on Thu Apr  9 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HPP_CORBASERVER_DEPEND_MK:=	${HPP_CORBASERVER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			hpp-corbaserver
endif

ifeq (+,$(HPP_CORBASERVER_DEPEND_MK)) # ------------------------------------

PREFER.hpp-corbaserver?=	robotpkg

DEPEND_USE+=			hpp-corbaserver

DEPEND_ABI.hpp-corbaserver?=	hpp-corbaserver>=1.7.1
DEPEND_DIR.hpp-corbaserver?=	../../devel/hpp-corbaserver

SYSTEM_SEARCH.hpp-corbaserver=\
	include/hppCorbaServer/hppciServer.h				\
	'lib/libhppCorbaServer.{a,so}'					\
	'lib/pkgconfig/hppCorbaServer.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
