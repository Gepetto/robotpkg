# $LAAS: depend.mk 2009/04/09 18:01:29 mallet $
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
#                                             Anthony Mallet on Thu Apr  9 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HPP_DYNAMIC_OBSTACLE_DEPEND_MK:=${HPP_DYNAMIC_OBSTACLE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	hpp-dynamic-obstacle
endif

ifeq (+,$(HPP_DYNAMIC_OBSTACLE_DEPEND_MK)) # -------------------------------

PREFER.hpp-dynamic-obstacle?=	robotpkg

DEPEND_USE+=			hpp-dynamic-obstacle

DEPEND_ABI.hpp-dynamic-obstacle?=	hpp-dynamic-obstacle>=1.0
DEPEND_DIR.hpp-dynamic-obstacle?=	../../path/hpp-dynamic-obstacle

SYSTEM_SEARCH.hpp-dynamic-obstacle=\
	include/hppDynamicObstacle/hppDynamicObstacle.h			\
	'lib/pkgconfig/hppDynamicObstacle.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
