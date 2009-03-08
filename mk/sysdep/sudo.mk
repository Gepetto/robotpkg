# $LAAS: sudo.mk 2009/03/08 23:23:55 tho $
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
#                                      Anthony Mallet on Sat Mar  7 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SUDO_DEPEND_MK:=	${SUDO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sudo
endif

ifeq (+,$(SUDO_DEPEND_MK)) # -----------------------------------------------

PREFER.sudo?=		system

DEPEND_USE+=		sudo
DEPEND_ABI.sudo?=	sudo>=1

SYSTEM_SEARCH.sudo=	'bin/sudo:s/^[^.0-9]*//p:% -V'
SYSTEM_PKG.Linux.sudo=	sudo
SYSTEM_PKG.NetBSD.sudo=	pkgsrc/security/sudo

export SUDO=		$(firstword ${SYSTEM_FILES.sudo})

endif # SUDO_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
