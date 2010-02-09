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
#                                            Anthony Mallet on Tue Feb  9 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBSOQT_DEPEND_MK:=	${LIBSOQT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libsoqt
endif

ifeq (+,$(LIBSOQT_DEPEND_MK)) # --------------------------------------------

PREFER.libsoqt?=	system

DEPEND_USE+=		libsoqt

DEPEND_ABI.libsoqt?=	libsoqt>=1.4

SYSTEM_SEARCH.libsoqt=	\
 'include/{,Coin2}/Inventor/Qt/SoQtBasic.h:/SOQT_VERSION.*"/s/[^.0-9]//gp'	\
 'lib/libSoQt.{a,so,dylib}'

SYSTEM_PKG.Linux-fedora.libsoqt=	SoQt-devel
SYSTEM_PKG.Linux-ubuntu.libsoqt=	liblibsoqt-dev
SYSTEM_PKG.Linux-debian.libsoqt=	liblibsoqt-dev

endif # LIBSOQT_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
