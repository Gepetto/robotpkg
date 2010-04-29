#
# Copyright (c) 2010 CNRS/LAAS
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#


DEPEND_DEPTH:=		${DEPEND_DEPTH}+
RMP_LIBS_DEPEND_MK:=${RMP_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rmp-libs
endif

ifeq (+,$(RMP_LIBS_DEPEND_MK))
PREFER.rmp-libs?=	robotpkg

DEPEND_USE+=		rmp-libs

DEPEND_ABI.rmp-libs?=	rmp-libs>=0.4
DEPEND_DIR.rmp-libs?=	../../robots/rmp-libs

SYSTEM_SEARCH.rmp-libs=\
	bin/rmpTest \
	include/rmp/rmpLib.h \
	lib/pkgconfig/rmp-libs.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
