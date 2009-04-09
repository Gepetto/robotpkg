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
#                                             Anthony Mallet on Thu Apr  9 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HPP_WORLDMODELPLANNER_DEPEND_MK:=${HPP_WORLDMODELPLANNER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	hpp-worldmodelplanner
endif

ifeq (+,$(HPP_WORLDMODELPLANNER_DEPEND_MK)) # ------------------------------

PREFER.hpp-worldmodelplanner?=	robotpkg

DEPEND_USE+=			hpp-worldmodelplanner

DEPEND_ABI.hpp-worldmodelplanner?=	hpp-worldmodelplanner>=1.0
DEPEND_DIR.hpp-worldmodelplanner?=	../../path/hpp-worldmodelplanner

SYSTEM_SEARCH.hpp-worldmodelplanner=\
	include/hppWorldModelPlanner/hppWorldModelPlanner.h		\
	'lib/pkgconfig/hppWorldModelPlanner.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
