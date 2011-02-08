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
COIN2_DEPEND_MK:=	${COIN2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		coin2
endif

ifeq (+,$(COIN2_DEPEND_MK)) # ----------------------------------------------

PREFER.coin2?=		system

DEPEND_USE+=		coin2

DEPEND_ABI.coin2?=	coin2>=2<3

SYSTEM_SEARCH.coin2=	\
 'include/{,Coin2}/Inventor/C/basic.h:/COIN_VERSION.*"/s/[^.0-9]//gp'	\
 'lib/libCoin.{a,so}'

SYSTEM_PKG.Linux-fedora.coin2=	Coin2-devel
SYSTEM_PKG.Linux-ubuntu.coin2=	libcoin20-dev
SYSTEM_PKG.Linux-debian.coin2=	libcoin20-dev
SYSTEM_PKG.NetBSD.coin2=	pkgsrc/graphics/Coin

endif # COIN2_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
