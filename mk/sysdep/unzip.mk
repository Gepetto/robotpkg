# $LAAS: unzip.mk 2009/01/27 16:48:34 mallet $
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
#                                             Anthony Mallet on Thu Jan 27 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
UNZIP_DEPEND_MK:=	${UNZIP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		unzip
endif

ifeq (+,$(UNZIP_DEPEND_MK)) # ----------------------------------------------

PREFER.unzip?=		system

DEPEND_USE+=		unzip
DEPEND_ABI.unzip?=	unzip
DEPEND_METHOD.unzip?=	build
SYSTEM_SEARCH.unzip=	'bin/unzip'

# Don't call this variable "UNZIP" because the unzip program uses this
# environment variable to define default options.
#
export UNZIP_CMD=	${PREFIX.unzip}/bin/unzip

endif # UNZIP_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
