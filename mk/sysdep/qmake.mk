# $LAAS: qmake.mk 2011/10/10 15:00:54 mallet $
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
#                                             Anthony Mallet on Mon Mar 23 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QMAKE_DEPEND_MK:=	${QMAKE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qmake
endif

ifeq (+,$(QMAKE_DEPEND_MK)) # ----------------------------------------------

PREFER.qmake?=		system

DEPEND_USE+=		qmake
DEPEND_ABI.qmake?=	qmake>=1
DEPEND_METHOD.qmake+=	build
SYSTEM_SEARCH.qmake=\
	'{,qt[0-9]/}bin/qmake{,-qt[0-9]}::% -query QMAKE_VERSION'

USE_QMAKE=		yes
export QMAKE=		$(word 1,${SYSTEM_FILES.qmake})

SYSTEM_PKG.Debian.qmake=	qt4-qmake
SYSTEM_PKG.Ubuntu.qmake=	qt4-qmake

endif # QMAKE_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
