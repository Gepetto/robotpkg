# $LAAS: gdbm.mk 2011/10/06 18:46:50 mallet $
#
# Copyright (c) 2009,2011 LAAS/CNRS
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
#                                           Séverin Lemaignan on Mon Dec 7 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GDBM_DEPEND_MK:=		${GDBM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gdbm
endif

ifeq (+,$(GDBM_DEPEND_MK)) # ------------------------------------------------

PREFER.gdbm?=		system

DEPEND_USE+=		gdbm
DEPEND_ABI.gdbm?=	gdbm>=1.8

SYSTEM_SEARCH.gdbm=	\
	'include/gdbm.h'	\
	'lib/libgdbm.so'

SYSTEM_PKG.Fedora.gdbm=	gdbm-devel
SYSTEM_PKG.Ubuntu.gdbm=	libgdbm-dev
SYSTEM_PKG.Debian.gdbm=	libgdbm-dev
SYSTEM_PKG.NetBSD.gdbm=	databases/gdbm

endif # GDBM_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
