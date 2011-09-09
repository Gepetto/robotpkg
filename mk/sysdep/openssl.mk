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
#                                             Anthony Mallet on Fri Nov 20 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENSSL_DEPEND_MK:=	${OPENSSL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openssl
endif

ifeq (+,$(OPENSSL_DEPEND_MK)) # --------------------------------------------

PREFER.openssl?=	system
DEPEND_USE+=		openssl
DEPEND_ABI.openssl?=	openssl>=0.9.6

SYSTEM_PKG.Fedora.openssl=	openssl-devel
SYSTEM_PKG.Ubuntu.openssl=	libssl-dev
SYSTEM_PKG.Debian.openssl=	libssl-dev
SYSTEM_PKG.NetBSD.openssl=         	pkgsrc/security/openssl

_vregex:=s/^.*OpenSSL[ ]*//;s/[ -].*$$//;p
SYSTEM_SEARCH.openssl:=	\
	'bin/openssl:/OpenSSL/{${_vregex};}:% version' 			\
	'include/openssl/opensslv.h:/VERSION_TEXT/{${_vregex};q;}'	\
	'lib/libcrypto.*'						\
	'lib/libssl.*'

endif # OPENSSL_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
