# $LAAS: perl.mk 2009/03/11 21:37:17 mallet $
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
PERL_DEPEND_MK:=	${PERL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		perl
endif

ifeq (+,$(PERL_DEPEND_MK)) # -----------------------------------------------

PREFER.perl?=		system

DEPEND_USE+=		perl
DEPEND_ABI.perl?=	perl>=5
SYSTEM_SEARCH.perl=\
	'bin/perl:/perl/{s/[^0-9.]*\([0-9.]*\).*/\1/;p;q;}:% -v'

export PERL=		${PREFIX.perl}/bin/perl

endif # PERL_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
