# $LAAS: depend.mk 2009/05/28 18:38:25 mallet $
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
#                                             Anthony Mallet on Thu Jan 22 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBPYYARP_DEPEND_MK:=	${LIBPYYARP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libpyyarp
endif

ifeq (+,$(LIBPYYARP_DEPEND_MK)) # -----------------------------------------------

PREFER.libpyyarp?=		robotpkg

DEPEND_USE+=		libpyyarp
DEPEND_ABI.libpyyarp?=	libpyyarp>=2.2.6
DEPEND_DIR.libpyyarp?=	../../devel/libpyyarp


SYSTEM_SEARCH.libpyyarp=\
	'lib/python[0-9.]*/{site-package,dist-packages}/yarp.py'
	

include ../../architecture/yarp/depend.mk

endif # LIBPYYARP_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
