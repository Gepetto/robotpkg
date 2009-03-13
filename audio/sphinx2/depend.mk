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
#                                             Anthony Mallet on Fri Mar  6 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SPHINX2_DEPEND_MK:=	${SPHINX2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sphinx2
endif

ifeq (+,$(SPHINX2_DEPEND_MK)) # --------------------------------------------

PREFER.sphinx2?=	robotpkg

DEPEND_USE+=		sphinx2

DEPEND_ABI.sphinx2?=	sphinx2>=0.6
DEPEND_DIR.sphinx2?=	../../audio/sphinx2

SYSTEM_SEARCH.sphinx2=\
	include/sphinx2/sphinxp.h	\
	lib/libsphinx2.{a,so}

endif # SPHINX2_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
