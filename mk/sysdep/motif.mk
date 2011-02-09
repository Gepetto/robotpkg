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
#                                             Anthony Mallet on Thu Mar 12 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MOTIF_DEPEND_MK:=	${MOTIF_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		motif
endif

ifeq (+,$(MOTIF_DEPEND_MK)) # ----------------------------------------------

PREFER.motif?=		system

DEPEND_USE+=		motif
DEPEND_ABI.motif?=	motif

SYSTEM_DESCR.motif=		"lesstif or openmotif"
SYSTEM_PKG.Linux-fedora.motif=	"lesstif-devel"
SYSTEM_PKG.Linux-ubuntu.motif=	"libmotif-dev"
SYSTEM_PKG.NetBSD.motif=	"pkgsrc/x11/lesstif or pkgsrc/x11/openmotif"

SYSTEM_SEARCH.motif=\
	'include/Xm/XmAll.h'			\
	'lib/libXm.{a,so}'

endif # MOTIF_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
