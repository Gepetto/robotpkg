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
#                                            Anthony Mallet on Wed Mar 24 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SPEETT_GENOM_DEPEND_MK:=${SPEETT_GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		speett-genom
endif

ifeq (+,$(SPEETT_GENOM_DEPEND_MK)) # ---------------------------------------

PREFER.speett-genom?=	robotpkg

DEPEND_USE+=		speett-genom

DEPEND_ABI.speett-genom?=speett-genom>=1.0
DEPEND_DIR.speett-genom?=../../audio/speett-genom

SYSTEM_SEARCH.speett-genom=\
	include/speett/speett-struct.h					\
	'lib/pkgconfig/speett.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

