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
#                                            Anthony Mallet on Tue Mar 23 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SQLITE3_DEPEND_MK:=	${SQLITE3_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sqlite3
endif

ifeq (+,$(SQLITE3_DEPEND_MK)) # --------------------------------------------

PREFER.sqlite3?=	system

DEPEND_USE+=		sqlite3
DEPEND_ABI.sqlite3?=	sqlite3>=3

DEPEND_METHOD.sqlite3+=	build
SYSTEM_SEARCH.sqlite3=	'bin/sqlite3:p:% -version'

export SQLITE3=		${PREFIX.sqlite3}/bin/sqlite3

endif # SQLITE3_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
